defmodule ExOpenAI.ReleaseRegressionTest do
  use ExUnit.Case, async: false

  alias ExOpenAI.Codegen.{DocsParser.Schema, ResponseConverter}

  defmodule CaptureClient do
    def api_call(method, url, body, content_type, opts, convert) do
      send(self(), {:request, method, url, body, content_type, opts})
      convert.({:ok, Process.get(:release_response, %{})})
    end
  end

  setup do
    previous = Application.fetch_env(:ex_openai, :http_client)
    Application.put_env(:ex_openai, :http_client, CaptureClient)

    on_exit(fn ->
      case previous do
        {:ok, client} -> Application.put_env(:ex_openai, :http_client, client)
        :error -> Application.delete_env(:ex_openai, :http_client)
      end
    end)

    :ok
  end

  test "optional request bodies retain schema-required properties" do
    ExOpenAI.Containers.create_container(name: "test")
    assert_receive {:request, :post, "/containers", [name: "test"], _, []}

    ExOpenAI.Conversations.update_conversation("conv_1", metadata: %{project: "test"})

    assert_receive {:request, :post, "/conversations/conv_1", [metadata: %{project: "test"}], _,
                    []}
  end

  test "inline request schemas supply their required properties" do
    items = [%{type: "message", role: "user", content: "hello"}]
    ExOpenAI.Conversations.create_conversation_items("conv_1", items)
    assert_receive {:request, :post, "/conversations/conv_1/items", [items: ^items], _, []}

    ExOpenAI.Chat.update_chat_completion("chatcmpl_1", %{project: "test"})

    assert_receive {:request, :post, "/chat/completions/chatcmpl_1",
                    [metadata: %{project: "test"}], _, []}
  end

  test "array and object query filters use bracketed keys" do
    ExOpenAI.Conversations.list_conversation_items("conv_1",
      include: ["message.output_text.logprobs", "message.input_image.image_url"]
    )

    assert_receive {:request, :get, url, [], _, []}

    assert URI.query_decoder(URI.parse(url).query) |> Enum.to_list() == [
             {"include[]", "message.output_text.logprobs"},
             {"include[]", "message.input_image.image_url"}
           ]

    ExOpenAI.Chat.list_chat_completions(metadata: %{project: "my app"})
    assert_receive {:request, :get, url, [], _, []}
    assert URI.decode_query(URI.parse(url).query) == %{"metadata[project]" => "my app"}

    assert ExOpenAI.Query.append("/responses?beta=true", after: "resp_1") ==
             "/responses?beta=true&after=resp_1"
  end

  test "201 responses select the eval response schema" do
    Process.put(:release_response, %{
      "id" => "eval_1",
      "object" => "eval",
      "created_at" => 1,
      "name" => "test"
    })

    assert {:ok, %ExOpenAI.Components.Eval{id: "eval_1"}} =
             ExOpenAI.Evals.create_eval(%{type: "custom", item_schema: %{}}, [])
  end

  test "all successful HTTP status codes are accepted with wrapped or raw bodies" do
    for code <- [200, 201, 202, 204, 299], body <- ["", %{"id" => "test"}] do
      assert ExOpenAI.Client.handle_response(
               {:ok, %HTTPoison.Response{status_code: code, body: body}}
             ) == {:ok, body}

      assert ExOpenAI.Client.handle_response(
               {:ok, %HTTPoison.Response{status_code: code, body: {:ok, body}}}
             ) == {:ok, body}
    end

    assert ExOpenAI.Client.handle_response(
             {:ok, %HTTPoison.Response{status_code: 400, body: "bad"}}
           ) == {:error, "bad"}
  end

  test "run statuses convert every declared enum member" do
    for status <- [
          :queued,
          :in_progress,
          :requires_action,
          :completed,
          :failed,
          :cancelled,
          :expired
        ] do
      assert {:ok, %ExOpenAI.Components.RunObject{status: ^status}} =
               ResponseConverter.convert_response(
                 {:ok, %{"id" => "run_1", "status" => Atom.to_string(status)}},
                 %Schema{ref: "#/components/schemas/RunObject"}
               )
    end
  end

  test "nullable aliases convert enum and list members" do
    assert {:ok, %ExOpenAI.Components.Response{service_tier: :default}} =
             ResponseConverter.convert_response(
               {:ok, %{"service_tier" => "default"}},
               %Schema{ref: "#/components/schemas/Response"}
             )

    assert {:ok, %ExOpenAI.Components.ChatCompletionResponseMessage{tool_calls: [call]}} =
             ResponseConverter.convert_response(
               {:ok,
                %{
                  "tool_calls" => [
                    %{
                      "id" => "call_1",
                      "type" => "function",
                      "function" => %{"name" => "weather", "arguments" => "{}"}
                    }
                  ]
                }},
               %Schema{ref: "#/components/schemas/ChatCompletionResponseMessage"}
             )

    assert call.function.name == "weather"
  end

  test "missing optional inline-map fields remain absent" do
    assert {:ok, response} =
             ResponseConverter.convert_response(
               {:ok,
                %{"text" => "hello", "logprobs" => [%{"token" => "hello", "logprob" => -0.1}]}},
               %Schema{ref: "#/components/schemas/CreateTranscriptionResponseJson"}
             )

    assert response.logprobs == [%{token: "hello", logprob: -0.1}]
  end

  test "Responses stream events retain their envelope and concrete type" do
    schema = %Schema{ref: "#/components/schemas/ResponseStreamEvent"}

    delta = %{
      "type" => "response.output_text.delta",
      "sequence_number" => 1,
      "item_id" => "msg_1",
      "output_index" => 0,
      "content_index" => 0,
      "delta" => "hello",
      "logprobs" => []
    }

    assert {:ok, %ExOpenAI.Components.ResponseTextDeltaEvent{delta: "hello", sequence_number: 1}} =
             ResponseConverter.convert_response({:ok, delta}, schema)

    completed = %{
      "type" => "response.completed",
      "sequence_number" => 2,
      "response" => %{"id" => "resp_1", "object" => "response", "status" => "completed"}
    }

    assert {:ok,
            %ExOpenAI.Components.ResponseCompletedEvent{
              sequence_number: 2,
              response: %ExOpenAI.Components.Response{id: "resp_1"}
            }} = ResponseConverter.convert_response({:ok, completed}, schema)
  end

  test "dynamic metadata keys and unknown enum strings do not allocate atoms" do
    prefix = "release_probe_#{System.unique_integer([:positive])}_"
    metadata = Map.new(1..20, fn i -> {prefix <> to_string(i), %{"id" => "dynamic"}} end)

    value = %{
      "id" => "resp_1",
      "object" => "response",
      "status" => prefix,
      "metadata" => metadata
    }

    assert {:ok, %ExOpenAI.Components.Response{metadata: ^metadata, status: ^prefix}} =
             ResponseConverter.convert_response({:ok, value}, %Schema{
               ref: "#/components/schemas/Response"
             })

    for name <- [prefix | Map.keys(metadata)] do
      assert_raise ArgumentError, fn -> String.to_existing_atom(name) end
    end
  end

  test "endpoint Markdown is visible and uses readable types and absolute links" do
    assert {:docs_v1, _, _, _, %{"en" => _}, _, docs} = Code.fetch_docs(ExOpenAI.Chat)

    {{:function, :create_chat_completion, 3}, _, _, %{"en" => doc}, _} =
      Enum.find(docs, &match?({{:function, :create_chat_completion, 3}, _, _, _, _}, &1))

    assert doc =~ "ExOpenAI.Components.ChatCompletionRequestMessage.input()"
    refute doc =~ "{:%{},"
    refute doc =~ "](/"
  end
end
