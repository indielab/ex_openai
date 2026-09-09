defmodule ExOpenAI do
  @moduledoc """
  ExOpenAI SDK - Auto-generated Elixir client for the OpenAI API.

  This module provides access to all OpenAI API endpoints through generated modules.

  Generated API and component modules live under `lib/ex_openai/generated`.

  ## Component Modules

  All request/response structs are available under `ExOpenAI.Components.*`

  ## API Modules

  API endpoints are organized by resource:
  - `ExOpenAI.Chat` - Chat completion endpoints
  - `ExOpenAI.Images` - Image generation endpoints
  - `ExOpenAI.Audio` - Audio transcription and generation
  - etc.
  """

  @typedoc "Per-request authentication, endpoint, streaming, and HTTP options."
  @type request_option() ::
          {:openai_api_key, String.t()}
          | {:openai_organization_key, String.t()}
          | {:base_url, String.t()}
          | {:stream_to, pid() | (term() -> term())}
          | {:timeout, timeout()}
          | {:recv_timeout, timeout()}
          | {:ssl, keyword()}
          | {:proxy, String.t() | tuple()}
          | {:proxy_auth, {String.t(), String.t()}}
          | {:hackney, keyword()}
          | {:follow_redirect, boolean()}
          | {:max_redirect, non_neg_integer()}
end
