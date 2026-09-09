# Streaming

Pass `stream: true` and `stream_to: callback_or_pid` to a supported endpoint.
The call returns `{:ok, stream_ref}`, where `stream_ref` is a reference.
Errors that occur before streaming begins return `{:error, reason}`.

The receiver gets `{:data, chunk}` for data, `{:error, reason}` for errors, and
`:finish` when the stream completes successfully. A terminal error can end the
stream without `:finish`.

## Chat callback

```elixir
callback = fn
  {:data, %ExOpenAI.Components.CreateChatCompletionStreamResponse{} = chunk} ->
    (chunk.choices || [])
    |> Enum.map_join("", fn choice -> Map.get(choice.delta || %{}, :content) || "" end)
    |> IO.write()

  {:error, reason} ->
    IO.inspect(reason, label: "Stream error")

  :finish ->
    IO.puts("\nDone")
end

{:ok, stream_ref} = ExOpenAI.Chat.create_chat_completion(
  [%{role: :user, content: "Write a short poem"}],
  "gpt-4o-mini",
  stream: true,
  stream_to: callback
)
IO.inspect(stream_ref)
```

Chat chunks have atom keys. Some deltas contain only a role, tool-call fragment,
or completion information, so `content` may be absent or `nil`.
Legacy `ExOpenAI.Completions` streams use
`ExOpenAI.Components.CreateCompletionResponse` chunks instead.

## Responses events

Responses streams preserve the event type and sequence number. The final
`ResponseCompletedEvent` contains the completed response in its `response` field.

```elixir
callback = fn
  {:data, %ExOpenAI.Components.ResponseTextDeltaEvent{delta: text}} ->
    IO.write(text)

  {:data, %ExOpenAI.Components.ResponseCompletedEvent{response: response}} ->
    IO.inspect(response.id, label: "Response ID")

  {:data, _event} ->
    :ok

  {:error, reason} ->
    IO.inspect(reason, label: "Stream error")

  :finish ->
    IO.puts("\nDone")
end

{:ok, _ref} = ExOpenAI.Responses.create_response(
  input: "Tell me a short story",
  model: "gpt-4o-mini",
  stream: true,
  stream_to: callback
)
```

## Collecting a reply in a process

Callbacks execute in the HTTP stream helper process. Capture the caller's PID
before creating a callback if it needs to send results back. Rebinding a variable
inside a callback does not retain its value across invocations.

A receiver process can accumulate text and notify its owner:

```elixir
defmodule ChatCollector do
  use ExOpenAI.StreamingClient

  @impl true
  def handle_data(%ExOpenAI.Components.CreateChatCompletionStreamResponse{} = chunk, state) do
    text = Enum.map_join(chunk.choices || [], "", fn choice ->
      Map.get(choice.delta || %{}, :content) || ""
    end)
    {:noreply, %{state | text: state.text <> text}}
  end

  @impl true
  def handle_error(reason, state) do
    send(state.owner, {:chat_error, reason})
    {:noreply, state}
  end

  @impl true
  def handle_finish(state) do
    send(state.owner, {:chat_finished, state.text})
    {:noreply, state}
  end
end

{:ok, receiver} = ChatCollector.start_link(%{owner: self(), text: ""})
{:ok, _ref} = ExOpenAI.Chat.create_chat_completion(
  [%{role: :user, content: "Say hello"}],
  "gpt-4o-mini",
  stream: true,
  stream_to: receiver
)

receive do
  {:chat_finished, text} -> IO.puts(text)
  {:chat_error, reason} -> IO.inspect(reason)
after
  60_000 -> IO.puts("Timed out waiting for the reply")
end

GenServer.stop(receiver)
```

The HTTP helper stops when the request ends. A receiver created with
`use ExOpenAI.StreamingClient` remains under the application's control, so it can
retain results or handle subsequent requests. Stop it when it is no longer needed.
