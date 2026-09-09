# Configuration

Set application configuration explicitly. Environment variables are read only
when referenced by configuration; setting `OPENAI_API_KEY` alone does not
configure the client.

```elixir
import Config

config :ex_openai,
  api_key: System.get_env("OPENAI_API_KEY"),
  organization_key: System.get_env("OPENAI_ORGANIZATION_KEY"),
  base_url: System.get_env("OPENAI_API_URL"),
  http_options: [recv_timeout: 50_000],
  http_headers: [{"OpenAI-Beta", "assistants=v2"}]
```

`api_key` authenticates requests. `organization_key` is optional. If `base_url`
is unset or `nil`, the client uses `https://api.openai.com/v1`.

## Runtime environment lookup

Use a `{:system, name}` value to look up an environment variable on each request.
A missing variable raises `ArgumentError`.

```elixir
import Config

config :ex_openai,
  api_key: {:system, "OPENAI_API_KEY"}
```

The client reads application configuration for each request. Changes made with
`Application.put_env/3` apply to subsequent calls.

## HTTP options and headers

`http_options` passes options to HTTPoison. For example:

```elixir
import Config

config :ex_openai,
  http_options: [timeout: 10_000, recv_timeout: 50_000],
  http_headers: [{"User-Agent", "MyApp/1.0"}]
```

Timeouts are in milliseconds. `ssl`, `proxy`, and `hackney` options can also be
passed through to HTTPoison.

## Per-request overrides

```elixir
{:ok, models} = ExOpenAI.Models.list_models(
  openai_api_key: "request-specific-key",
  openai_organization_key: "request-specific-organization",
  base_url: "https://your-proxy.example.com/v1",
  recv_timeout: 30_000
)
IO.inspect(models.data)
```

## Custom HTTP client

Set `http_client` to a module implementing `ExOpenAI.Client.api_call/6`. A test
client can return a fixture through the supplied response converter:

```elixir
defmodule MyMockOpenAIClient do
  @behaviour ExOpenAI.Client

  @impl true
  def api_call(:get, "/models", _params, _content_type, _opts, convert) do
    convert.({:ok, %{"object" => "list", "data" => []}})
  end

  def api_call(_method, _url, _params, _content_type, _opts, _convert) do
    {:error, :not_implemented}
  end
end

Application.put_env(:ex_openai, :http_client, MyMockOpenAIClient)
```

Restore the previous client after a test that changes application configuration.
Tests changing this global setting must run with `async: false`.
