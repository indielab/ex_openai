# Elixir SDK for OpenAI APIs

[![Hex.pm Version](https://img.shields.io/hexpm/v/ex_openai)](https://hex.pm/packages/ex_openai)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ex_openai)
[![Hex.pm Download Total](https://img.shields.io/hexpm/dt/ex_openai)](https://hex.pm/packages/ex_openai)

ExOpenAI is an (unofficial) Elixir SDK for interacting with the [OpenAI APIs](https://platform.openai.com/docs/api-reference/introduction). Its API modules and types are generated from the bundled OpenAPI specification.

## Features

- Generated API modules for the bundled OpenAI specification
- Generated typespecs and API documentation
- Elixir-style API with required arguments as function parameters and optional arguments as keyword lists
- Support for streaming responses with SSE
- Editor features: autocompletion, typechecking, and inline documentation
- Support with OpenAI-compatible APIs (like OpenRouter)

<img src="images/functiondocs.png" width="500" />

<img src="images/diagnostics.png" width="500" />

## Installation

Add **_:ex_openai_** as a dependency in your mix.exs file:

```elixir
def deps do
  [
    {:ex_openai, "~> 2.0.0-beta3"}
  ]
end
```

## Quick Start

### Configuration

```elixir
import Config

config :ex_openai,
  api_key: System.get_env("OPENAI_API_KEY"),
  organization_key: System.get_env("OPENAI_ORGANIZATION_KEY"),
  # Optional settings
  base_url: System.get_env("OPENAI_API_URL"),
  http_options: [recv_timeout: 50_000],
  http_headers: [{"OpenAI-Beta", "assistants=v2"}]
```

### Basic Usage

```elixir
# List available models
{:ok, models} = ExOpenAI.Models.list_models()

# Create a chat completion
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
{:ok, chat_response} = ExOpenAI.Chat.create_chat_completion(messages, "gpt-4o-mini")

# Responses
{:ok, response} = ExOpenAI.Responses.create_response(
  input: "Tell me a joke about programming",
  model: "gpt-4o-mini"
)

# Continue the conversation
{:ok, follow_up} = ExOpenAI.Responses.create_response(
  input: "Explain why that joke is funny",
  model: "gpt-4o-mini",
  previous_response_id: response.id
)
```

More examples in [Examples](docs/examples.md)

## API Overview

The API is organized into resource modules, including:

- **Assistants** - Create and manage assistants
- **Audio** - Speech, transcription, and translation
- **Chat** - Chat completions API
- **Completions** - Text completion API
- **Embeddings** - Vector embeddings
- **Files** - File management
- **Images** - Image generation and editing
- **Models** - Model management
- **Responses** - Stateful conversation API
- **Threads** - Thread-based conversations
- **Vector Stores** - Vector database operations

For detailed documentation on each module, see the [API Documentation](https://hexdocs.pm/ex_openai).

## Advanced Usage

### Streaming Responses

```elixir
# Using a callback function
callback = fn
  :finish ->
    IO.puts("\nDone")

  {:data, %ExOpenAI.Components.CreateChatCompletionStreamResponse{} = chunk} ->
    (chunk.choices || [])
    |> Enum.map_join("", fn choice -> Map.get(choice.delta || %{}, :content) || "" end)
    |> IO.write()

  {:error, err} ->
    IO.puts("Error: #{inspect(err)}")
end

messages = [
  %ExOpenAI.Components.ChatCompletionRequestUserMessage{
    role: :user,
    content: "Tell me a short story"
  }
]

ExOpenAI.Chat.create_chat_completion(
  messages,
  "gpt-4o-mini",
  stream: true,
  stream_to: callback
)
```

For more advanced streaming options, see the [Streaming Guide](docs/streaming.md).

### File Uploads

```elixir
# Simple file upload
image_data = File.read!("path/to/image.png")
{:ok, result} = ExOpenAI.Images.create_image_variation(image_data)

# With filename information
audio_data = File.read!("path/to/audio.wav")
{:ok, transcript} = ExOpenAI.Audio.create_transcription({"audio.wav", audio_data}, "whisper-1")
```

## Documentation

- [Complete API Reference](https://hexdocs.pm/ex_openai)
- [Explanation on codegen](docs/codegen.md)
- [Streaming Guide](docs/streaming.md)
- [Configuration Options](docs/configuration.md)
- [Examples](docs/examples.md)

## Types and response data

Request components accept structs or atom-keyed maps through their `input()` types.
Response components use `t()` and return structs with atom keys. Dynamic objects,
such as metadata and JSON Schema properties, retain their string keys.

Dialyzer catches incompatible positional arguments and explicitly typed schemas,
but does not validate every keyword option or nested union. The SDK does not
perform runtime JSON Schema validation.

Streaming calls return `{:ok, reference()}`. Chat chunks and Responses events use
their generated structs; applications accumulate deltas themselves. See the
[Streaming Guide](docs/streaming.md) for callback and process examples.

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a PR.

To update the SDK when OpenAI changes their API:

```bash
mise exec -- mix update_openai_docs
mise run generate_openai
mise run check
mise run test
mise run lint
```

## Projects Using ExOpenAI

- [Elixir ChatGPT](https://github.com/dvcrn/elixir-chatgpt)
- [FixMyJP](https://fixmyjapanese.com)
- [GPT Slack Bot](https://github.com/dvcrn/gpt-slack-bot)

_Add yours with a PR!_

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
