defmodule ExOpenAI.TransportContractRegressionTest do
  use ExUnit.Case, async: false

  def serve(content_type, body, call, status \\ 200) do
    {:ok, listener} = :gen_tcp.listen(0, [:binary, active: false, ip: {127, 0, 0, 1}])
    {:ok, {_, port}} = :inet.sockname(listener)

    server =
      Task.async(fn ->
        {:ok, socket} = :gen_tcp.accept(listener, 5000)
        request = read(socket, "")

        :ok =
          :gen_tcp.send(
            socket,
            "HTTP/1.1 #{status} Response\r\nContent-Type: #{content_type}\r\nContent-Length: #{byte_size(body)}\r\nConnection: close\r\n\r\n#{body}"
          )

        :gen_tcp.close(socket)
        request
      end)

    try do
      result = call.(base_url: "http://127.0.0.1:#{port}", openai_api_key: "test")
      {result, Task.await(server, 5000)}
    after
      :gen_tcp.close(listener)
      Task.shutdown(server, :brutal_kill)
    end
  end

  defp read(socket, buffer) do
    complete =
      case String.split(buffer, "\r\n\r\n", parts: 2) do
        [headers, body] ->
          size =
            case Regex.run(~r/content-length: (\d+)/i, headers) do
              [_, n] -> String.to_integer(n)
              nil -> 0
            end

          byte_size(body) >= size

        _ ->
          false
      end

    if complete do
      buffer
    else
      {:ok, chunk} = :gen_tcp.recv(socket, 0, 5000)
      read(socket, buffer <> chunk)
    end
  end

  setup do
    previous_headers = Application.fetch_env(:ex_openai, :http_headers)
    previous = Application.fetch_env(:ex_openai, :http_client)
    Application.put_env(:ex_openai, :http_client, ExOpenAI.Client)

    on_exit(fn ->
      case previous_headers do
        {:ok, headers} -> Application.put_env(:ex_openai, :http_headers, headers)
        :error -> Application.delete_env(:ex_openai, :http_headers)
      end

      case previous do
        {:ok, client} -> Application.put_env(:ex_openai, :http_client, client)
        :error -> Application.delete_env(:ex_openai, :http_client)
      end
    end)

    :ok
  end

  test "JSON file downloads preserve every byte" do
    for bytes <- ["{}\n", "[1,2]\n", "null\n"] do
      assert {{:ok, ^bytes}, _} =
               serve("application/json", bytes, fn opts ->
                 ExOpenAI.Files.download_file("file_1", opts)
               end)
    end
  end

  test "raw downloads still decode JSON API errors" do
    assert {{:error, %{"error" => %{"message" => "missing"}}}, _} =
             serve(
               "application/json",
               ~s({"error":{"message":"missing"}}),
               fn opts ->
                 ExOpenAI.Files.download_file("file_missing", opts)
               end,
               404
             )
  end

  test "audio text formats return bytes and JSON retains its struct" do
    for format <- [:text, :srt, :vtt], call <- [:create_transcription, :create_translation] do
      assert {{:ok, "hello\n"}, _} =
               serve("text/plain", "hello\n", fn opts ->
                 apply(ExOpenAI.Audio, call, [
                   {"audio.wav", "test"},
                   "whisper-1",
                   [response_format: format] ++ opts
                 ])
               end)
    end

    assert {{:ok, %ExOpenAI.Components.CreateTranscriptionResponseJson{text: "hello"}}, _} =
             serve("application/json", ~s({"text":"hello"}), fn opts ->
               ExOpenAI.Audio.create_transcription({"audio.wav", "test"}, "whisper-1", opts)
             end)
  end

  test "speech streaming preserves the caller-selected format without sending a stream body field" do
    parent = self()

    payload =
      "data: {\"type\":\"speech.audio.delta\",\"audio\":\"aGk=\",\"sequence_number\":1}\n\n"

    assert {{:ok, ref}, request} =
             serve("text/event-stream", payload, fn opts ->
               ExOpenAI.Audio.create_speech(
                 "hello",
                 "gpt-4o-mini-tts",
                 :alloy,
                 [stream: true, stream_format: :sse, stream_to: fn e -> send(parent, e) end] ++
                   opts
               )
             end)

    assert is_reference(ref)
    [_, body] = String.split(request, "\r\n\r\n", parts: 2)
    assert %{"stream_format" => "sse"} = decoded = Jason.decode!(body)
    refute Map.has_key?(decoded, "stream")
    assert_receive {:data, %ExOpenAI.Components.SpeechAudioDeltaEvent{audio: "aGk="}}, 1000
    assert_receive :finish, 1000
  end

  test "Assistants stream callbacks preserve event names and typed delta data" do
    # Payload shape from the createThreadAndRun SSE example in docs.yaml.
    data = %{
      "id" => "msg_1",
      "object" => "thread.message.delta",
      "delta" => %{
        "content" => [
          %{"index" => 0, "type" => "text", "text" => %{"value" => "Hello", "annotations" => []}}
        ]
      }
    }

    parent = self()

    for call <- [
          fn opts -> ExOpenAI.Threads.create_thread_and_run("asst_1", opts) end,
          fn opts -> ExOpenAI.Threads.create_run("asst_1", "thread_1", opts) end,
          fn opts -> ExOpenAI.Threads.submit_tool_ouputs_to_run("run_1", "thread_1", [], opts) end
        ] do
      payload = "event: thread.message.delta\ndata: #{Jason.encode!(data)}\n\ndata: [DONE]\n\n"

      assert {{:ok, ref}, _} =
               serve("text/event-stream", payload, fn opts ->
                 call.([stream: true, stream_to: fn e -> send(parent, e) end] ++ opts)
               end)

      assert is_reference(ref)

      assert_receive {:data,
                      %{
                        event: :"thread.message.delta",
                        data: %ExOpenAI.Components.MessageDeltaObject{} = message
                      }},
                     1000

      assert [%{text: %{value: "Hello"}}] = message.delta.content
      assert_receive :finish, 1000
    end
  end

  test "unknown Assistants events retain their payload" do
    payload = %{"event" => "thread.future", "data" => %{"id" => "future_1"}}

    assert {:ok, ^payload} =
             ExOpenAI.Codegen.ResponseConverter.convert_response(
               {:ok, payload},
               %ExOpenAI.Codegen.DocsParser.Schema{
                 ref: "#/components/schemas/AssistantStreamEvent"
               }
             )
  end

  test "schema header arrays reach HTTP and override matching headers case insensitively" do
    assert ExOpenAI.Client.merge_request_headers(
             [{"OpenAI-Beta", "assistants=v2"}, {"X-Trace", "keep"}],
             [{"openai-beta", "responses_multi_agent=v1"}]
           ) ==
             [{"openai-beta", "responses_multi_agent=v1"}, {"X-Trace", "keep"}]

    Application.put_env(:ex_openai, :http_headers, [
      {"OpenAI-Beta", "assistants=v2"},
      {"X-Trace", "keep"}
    ])

    {_, request} =
      serve("application/json", "{}", fn opts ->
        ExOpenAI.Responses.beta_create_response(
          [model: "example", input: "hello", "openai-beta": ["responses_multi_agent=v1"]] ++ opts
        )
      end)

    [headers, body] = String.split(request, "\r\n\r\n", parts: 2)
    assert String.downcase(headers) =~ "openai-beta: responses_multi_agent=v1"
    refute String.downcase(headers) =~ "assistants=v2"
    assert String.downcase(headers) =~ "x-trace: keep"
    assert length(Regex.scan(~r/openai-beta:/i, headers)) == 1
    refute Map.has_key?(Jason.decode!(body), "openai-beta")
  end
end
