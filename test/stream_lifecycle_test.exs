defmodule ExOpenAI.StreamLifecycleTest do
  use ExUnit.Case, async: true

  alias ExOpenAI.Codegen.{DocsParser.Schema, ResponseConverter}
  alias ExOpenAI.StreamingClient

  defp client(converter \\ &Function.identity/1) do
    parent = self()
    callback = fn event -> send(parent, event) end

    pid =
      start_supervised!(%{
        id: make_ref(),
        start: {StreamingClient, :start_link, [callback, converter]},
        restart: :temporary
      })

    {pid, Process.monitor(pid)}
  end

  test "DONE completes exactly once and releases the helper" do
    {pid, monitor} = client()
    send(pid, %HTTPoison.AsyncChunk{chunk: "data: {}\n\ndata: [DONE]\n\ndata: {}\n\n"})
    send(pid, %HTTPoison.AsyncEnd{})
    assert_receive {:data, %{}}
    assert_receive :finish
    assert_receive {:DOWN, ^monitor, :process, ^pid, :normal}
    refute_receive :finish
    refute_receive {:data, _}
  end

  test "Responses completion retains its event and finishes at transport end" do
    converter =
      &ResponseConverter.convert_response(&1, %Schema{
        ref: "#/components/schemas/ResponseStreamEvent"
      })

    {pid, monitor} = client(converter)

    payload = %{
      "type" => "response.completed",
      "sequence_number" => 1,
      "response" => %{"id" => "resp_1", "object" => "response", "error" => nil}
    }

    send(pid, %HTTPoison.AsyncChunk{
      chunk: "event: response.completed\ndata: #{Jason.encode!(payload)}\n\n"
    })

    send(pid, %HTTPoison.AsyncEnd{})

    assert_receive {:data,
                    %ExOpenAI.Components.ResponseCompletedEvent{
                      response: %ExOpenAI.Components.Response{id: "resp_1"}
                    }},
                   1000

    assert_receive :finish
    assert_receive {:DOWN, ^monitor, :process, ^pid, :normal}
  end

  test "SSE errors are delivered without crashing the linked caller" do
    {pid, monitor} = client()
    send(pid, %HTTPoison.AsyncChunk{chunk: "data: {\"error\":{\"message\":\"failed\"}}\n\n"})
    assert_receive {:error, %{"message" => "failed"}}
    assert_receive {:DOWN, ^monitor, :process, ^pid, :normal}
  end

  test "CRLF delimiters and multiline data survive chunk boundaries" do
    {pid, monitor} = client()
    send(pid, %HTTPoison.AsyncChunk{chunk: "data: {\"id\":\"one\",\r"})
    send(pid, %HTTPoison.AsyncChunk{chunk: "\ndata: \"text\":\"hello\"}\r\n\r"})
    send(pid, %HTTPoison.AsyncChunk{chunk: "\n"})
    send(pid, %HTTPoison.AsyncEnd{})
    assert_receive {:data, %{"id" => "one", "text" => "hello"}}
    assert_receive :finish
    assert_receive {:DOWN, ^monitor, :process, ^pid, :normal}
  end

  test "HTTP transport errors release the helper" do
    {pid, monitor} = client()
    send(pid, %HTTPoison.Error{reason: :closed})
    assert_receive {:error, :closed}
    assert_receive {:DOWN, ^monitor, :process, ^pid, :normal}
  end
end
