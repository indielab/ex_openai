# Usage examples

These examples use the configured API key. Handle `{:error, reason}` in application
code; the matches below keep each example focused on the successful response.

## Chat completions

```elixir
messages = [
  %ExOpenAI.Components.ChatCompletionRequestSystemMessage{
    role: :system,
    content: "You are a concise assistant."
  },
  %ExOpenAI.Components.ChatCompletionRequestUserMessage{
    role: :user,
    content: "What is the capital of France?"
  }
]

{:ok, response} = ExOpenAI.Chat.create_chat_completion(messages, "gpt-4o-mini")
IO.puts(List.first(response.choices).message.content)
```

Atom-keyed maps are also accepted:

```elixir
{:ok, response} = ExOpenAI.Chat.create_chat_completion(
  [%{role: "user", content: "Hello"}],
  "gpt-4o-mini"
)
IO.inspect(response.choices)
```

### Function tools

```elixir
messages = [%{role: "user", content: "What's the weather in Tokyo?"}]
tools = [
  %{
    type: "function",
    function: %{
      name: "get_weather",
      description: "Get the weather in a city",
      parameters: %{
        type: "object",
        properties: %{city: %{type: "string"}},
        required: ["city"]
      }
    }
  }
]

{:ok, response} = ExOpenAI.Chat.create_chat_completion(messages, "gpt-4o-mini", tools: tools)
message = List.first(response.choices).message

case Map.get(message, :tool_calls) do
  calls when is_list(calls) and calls != [] ->
    Enum.each(calls, fn call ->
      IO.inspect({call.function.name, Jason.decode!(call.function.arguments)})
    end)

  _ ->
    IO.puts(message.content || "")
end
```

Execute only functions your application supports. Return each result as a message
with `role: "tool"`, its `tool_call_id`, and a string `content`, then send the
updated conversation to `create_chat_completion/3`.

## Responses

```elixir
{:ok, response} = ExOpenAI.Responses.create_response(
  input: "Tell me a joke about programming",
  model: "gpt-4o-mini"
)

{:ok, follow_up} = ExOpenAI.Responses.create_response(
  input: "Explain why that joke is funny",
  model: "gpt-4o-mini",
  previous_response_id: response.id
)

for %{type: :message, content: parts} <- follow_up.output,
    %{type: :output_text, text: text} <- parts do
  IO.puts(text)
end
```

### Built-in tools

```elixir
{:ok, response} = ExOpenAI.Responses.create_response(
  input: "Find recent news about Elixir",
  model: "gpt-4o-mini",
  tools: [%{type: "web_search_preview"}]
)
IO.inspect(response.output)
```

### Conversations

```elixir
{:ok, conversation} = ExOpenAI.Conversations.create_conversation()

{:ok, items} = ExOpenAI.Conversations.create_conversation_items(
  conversation.id,
  [%{type: "message", role: "user", content: "Hello"}]
)
IO.inspect(items)
```

## Assistants and threads

```elixir
{:ok, assistant} = ExOpenAI.Assistants.create_assistant(
  "gpt-4o-mini",
  name: "Research assistant",
  tools: [%{type: "file_search"}]
)
{:ok, thread} = ExOpenAI.Threads.create_thread()
{:ok, _message} = ExOpenAI.Threads.create_message("Explain quantum computing", :user, thread.id)
{:ok, run} = ExOpenAI.Threads.create_run(assistant.id, thread.id)
{:ok, current} = ExOpenAI.Threads.get_run(run.id, thread.id)

case current.status do
  :completed ->
    {:ok, messages} = ExOpenAI.Threads.list_messages(thread.id)
    IO.inspect(messages.data)

  status ->
    IO.inspect(status, label: "Run status")
end
```

Poll `get_run/3` while the status is `:queued` or `:in_progress`. Handle
`:requires_action`, failure, and cancellation in the application before assuming
a result is available.

## Images

```elixir
{:ok, response} = ExOpenAI.Images.create_image("A mountain lake at sunset", n: 1)
IO.inspect(response.data)
```

Image edits use multipart uploads. Pass a binary, a filename/content tuple, or a
list of uploads for the image argument. The mask is a keyword option.

```elixir
image = {"image.png", File.read!("path/to/image.png")}
mask = {"mask.png", File.read!("path/to/mask.png")}
{:ok, edited} = ExOpenAI.Images.create_image_edit(image, "Add a cat", mask: mask, n: 1)
IO.inspect(edited.data)
```

```elixir
{:ok, variations} = ExOpenAI.Images.create_image_variation(
  {"image.png", File.read!("path/to/image.png")},
  n: 2
)
IO.inspect(variations.data)
```

## Audio

```elixir
audio = {"audio.mp3", File.read!("path/to/audio.mp3")}
{:ok, transcription} = ExOpenAI.Audio.create_transcription(audio, "whisper-1")
{:ok, translation} = ExOpenAI.Audio.create_translation(audio, "whisper-1")
IO.inspect({transcription, translation})
```

```elixir
{:ok, audio} = ExOpenAI.Audio.create_speech("Hello world", "tts-1", :alloy, response_format: "mp3")
File.write!("output.mp3", audio)
```

## Embeddings

```elixir
{:ok, response} = ExOpenAI.Embeddings.create_embedding(
  ["The food was delicious", "The service was excellent"],
  "text-embedding-3-small"
)
IO.inspect(Enum.map(response.data, & &1.embedding))
```

## Files

```elixir
{:ok, file} = ExOpenAI.Files.create_file(
  {"data.jsonl", File.read!("path/to/data.jsonl")},
  :batch,
  expires_after: %{anchor: :created_at, seconds: 3600}
)
{:ok, files} = ExOpenAI.Files.list_files(limit: 10)
Enum.each(files.data, fn item -> IO.puts("#{item.id}: #{item.filename}") end)
{:ok, content} = ExOpenAI.Files.download_file(file.id)
IO.inspect(content)
{:ok, deleted} = ExOpenAI.Files.delete_file(file.id)
IO.inspect(deleted.deleted)
```

## Streaming

See the [streaming guide](streaming.md) for typed chat callbacks, Responses events,
and a process that collects a complete reply.
