defmodule ExOpenAI.MultipartRegressionTest do
  use ExUnit.Case, async: false

  test "uploads UTF-8 JSONL, enums, and structured fields through Hackney" do
    request =
      capture_request(fn base_url ->
        assert {:ok, _} =
                 ExOpenAI.Files.create_file({"data.jsonl", "{\"messages\":[]}\n"}, :batch,
                   expires_after: %{anchor: :created_at, seconds: 3600},
                   base_url: base_url,
                   openai_api_key: "test"
                 )
      end)

    assert request =~ ~s(name="file"; filename="data.jsonl")
    assert request =~ "{\"messages\":[]}\n"
    assert request =~ "name=\"purpose\"\r\n\r\nbatch"
    assert request =~ "name=\"expires_after[seconds]\"\r\n\r\n3600"
  end

  test "raw UTF-8 file contents have a filename disposition" do
    request =
      capture_request(fn base_url ->
        assert {:ok, _} =
                 ExOpenAI.Files.create_file("plain text", :assistants,
                   base_url: base_url,
                   openai_api_key: "test"
                 )
      end)

    assert request =~ ~s(name="file"; filename="file")
    assert request =~ "plain text"
  end

  test "image edit files and numeric options share a multipart schema" do
    request =
      capture_request(fn base_url ->
        assert {:ok, _} =
                 ExOpenAI.Images.create_image_edit(
                   [{"a.png", <<137, 80, 78, 71>>}, {"b.png", <<137, 80, 78, 71>>}],
                   "combine",
                   n: 1,
                   base_url: base_url,
                   openai_api_key: "test"
                 )
      end)

    assert request =~ ~s(name="image[]"; filename="a.png")
    assert request =~ ~s(name="image[]"; filename="b.png")
    assert request =~ "name=\"n\"\r\n\r\n1"
  end

  test "realtime multipart parts use their declared content types" do
    request =
      capture_request(fn base_url ->
        assert {:ok, _} =
                 ExOpenAI.Realtime.create_realtime_call("v=0",
                   session: %{type: :realtime, model: "gpt-realtime"},
                   base_url: base_url,
                   openai_api_key: "test"
                 )
      end)

    assert request =~ "application/sdp"
    assert request =~ "application/json"
    assert request =~ Jason.encode!(%{type: :realtime, model: "gpt-realtime"})
  end

  test "downloads preserve JSON-looking bytes" do
    for body <- ["{}\n", "42"] do
      capture_request(
        fn base_url ->
          assert {:ok, ^body} =
                   ExOpenAI.Files.download_file("file_1",
                     base_url: base_url,
                     openai_api_key: "test"
                   )
        end,
        "application/octet-stream",
        body
      )
    end
  end

  defp capture_request(call, content_type \\ "application/json", response_body \\ "{}") do
    {:ok, listener} =
      :gen_tcp.listen(0, [:binary, active: false, reuseaddr: true, ip: {127, 0, 0, 1}])

    {:ok, {_, port}} = :inet.sockname(listener)

    server =
      Task.async(fn ->
        {:ok, socket} = :gen_tcp.accept(listener, 5000)

        try do
          request = read_request(socket, "")

          :ok =
            :gen_tcp.send(
              socket,
              "HTTP/1.1 200 OK\r\nContent-Type: #{content_type}\r\nContent-Length: #{byte_size(response_body)}\r\nConnection: close\r\n\r\n#{response_body}"
            )

          request
        after
          :gen_tcp.close(socket)
        end
      end)

    try do
      call.("http://127.0.0.1:#{port}")
      Task.await(server, 5000)
    after
      :gen_tcp.close(listener)
      Task.shutdown(server, :brutal_kill)
    end
  end

  defp read_request(socket, buffer) do
    case String.split(buffer, "\r\n\r\n", parts: 2) do
      [headers, body] ->
        length =
          case Regex.run(~r/content-length: (\d+)/i, headers) do
            [_, length] -> String.to_integer(length)
            nil -> 0
          end

        if byte_size(body) >= length,
          do: buffer,
          else: receive_more(socket, buffer)

      _ ->
        receive_more(socket, buffer)
    end
  end

  defp receive_more(socket, buffer) do
    {:ok, chunk} = :gen_tcp.recv(socket, 0, 5000)
    read_request(socket, buffer <> chunk)
  end
end
