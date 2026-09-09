defmodule ExOpenAI.DocumentationExamplesTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO

  defmodule ExampleFiles do
    def read!(path) do
      if String.ends_with?(path, ".jsonl"), do: "{}\n", else: <<137, 80, 78, 71>>
    end

    def write!(_path, data) when is_binary(data), do: :ok
  end

  defmodule ExampleClient do
    def api_call(method, url, body, _content_type, opts, convert) do
      path = URI.parse(url).path
      payload = response(method, path, body)

      if opts[:stream] do
        chunks =
          case path do
            "/chat/completions" ->
              for delta <- [
                    %{"role" => "assistant"},
                    %{"content" => "Hello"},
                    %{"content" => nil}
                  ] do
                %{
                  "id" => "chatcmpl_test",
                  "object" => "chat.completion.chunk",
                  "choices" => [%{"index" => 0, "delta" => delta}]
                }
              end

            "/responses" ->
              [
                %{
                  "type" => "response.output_text.delta",
                  "delta" => "Hello",
                  "sequence_number" => 1
                },
                %{"type" => "response.completed", "sequence_number" => 2, "response" => payload}
              ]
          end

        Enum.each(chunks, fn chunk ->
          {:ok, data} = convert.({:ok, chunk})
          ExOpenAI.StreamingClient.forward_response(opts[:stream_to], {:data, data})
        end)

        ExOpenAI.StreamingClient.forward_response(opts[:stream_to], :finish)
        {:ok, make_ref()}
      else
        convert.({:ok, payload})
      end
    end

    defp response(_, "/models", _), do: fixture("list_models")
    defp response(_, "/responses", _), do: fixture("responses_basic_usage")

    defp response(_, "/chat/completions", body) do
      payload = fixture("chat_basic_completion")

      if body[:tools] do
        put_in(payload, ["choices", Access.at(0), "message", "tool_calls"], [
          %{
            "id" => "call_1",
            "type" => "function",
            "function" => %{"name" => "get_weather", "arguments" => "{\"city\":\"Tokyo\"}"}
          }
        ])
      else
        payload
      end
    end

    defp response(_, "/assistants", _), do: fixture("math_assistant", 0)
    defp response(_, "/threads", _), do: fixture("math_assistant", 1)

    defp response(:post, "/threads/" <> path, _) do
      if String.ends_with?(path, "/messages"),
        do: fixture("math_assistant", 2),
        else: fixture("math_assistant", 3)
    end

    defp response(:get, "/threads/" <> path, _) do
      if String.ends_with?(path, "/messages"),
        do: fixture("math_assistant", 4),
        else: Map.put(fixture("math_assistant", 3), "status", "completed")
    end

    defp response(_, "/conversations", _),
      do: %{"id" => "conv_1", "object" => "conversation", "created_at" => 1, "metadata" => %{}}

    defp response(_, "/conversations/conv_1/items", _),
      do: %{"object" => "list", "data" => [], "has_more" => false}

    defp response(_, "/images/" <> _, _), do: fixture("image_variation")
    defp response(_, "/audio/speech", _), do: <<0, 1, 2, 3>>
    defp response(_, "/audio/" <> _, _), do: fixture("audio_transcription")

    defp response(_, "/embeddings", _),
      do: %{
        "object" => "list",
        "model" => "text-embedding-3-small",
        "data" => [%{"object" => "embedding", "index" => 0, "embedding" => [0.1, 0.2]}]
      }

    defp response(:post, "/files", _), do: file()
    defp response(:get, "/files", _), do: %{"object" => "list", "data" => [file()]}
    defp response(:get, "/files/file_1/content", _), do: "{}\n"

    defp response(:delete, "/files/file_1", _),
      do: %{"id" => "file_1", "object" => "file", "deleted" => true}

    defp file,
      do: %{
        "id" => "file_1",
        "object" => "file",
        "filename" => "data.jsonl",
        "purpose" => "batch",
        "bytes" => 3,
        "created_at" => 1
      }

    defp fixture(name, index \\ 0) do
      "test/fixture/vcr_cassettes/#{name}.json"
      |> File.read!()
      |> Jason.decode!()
      |> Enum.at(index)
      |> get_in(["response", "body"])
      |> Jason.decode!()
    end
  end

  setup do
    previous = Application.fetch_env(:ex_openai, :http_client)
    Application.put_env(:ex_openai, :http_client, ExampleClient)

    on_exit(fn ->
      case previous do
        {:ok, value} -> Application.put_env(:ex_openai, :http_client, value)
        :error -> Application.delete_env(:ex_openai, :http_client)
      end
    end)

    :ok
  end

  for path <- [
        "README.md",
        "docs/examples.md",
        "docs/streaming.md",
        "docs/configuration.md",
        "docs/parsingv2.md"
      ] do
    test "Elixir examples in #{path} execute with a fixture transport" do
      path = unquote(path)
      blocks = Regex.scan(~r/```elixir\n(.*?)```/s, File.read!(path), capture: :all_but_first)
      assert blocks != []

      capture_io(fn ->
        Enum.each(blocks, fn [code] ->
          Code.string_to_quoted!(code, file: path)

          unless String.contains?(code, "import Config") or String.starts_with?(code, "def deps") do
            Code.eval_string(
              "alias ExOpenAI.DocumentationExamplesTest.ExampleFiles, as: File\n" <> code,
              [],
              file: path
            )
          end
        end)
      end)
    end
  end
end
