defmodule ExOpenAI.Components.ChatCompletionTokenLogprob do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionTokenLogprob.

  ## Fields

  * `:bytes` - **required** - `list(integer()) | nil`

  * `:logprob` - **required** - `number()`
    The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.

  * `:token` - **required** - `String.t()`
    The token.

  * `:top_logprobs` - **required** - `list(%{ required(:bytes) => list(integer()) | nil, required(:logprob) => number(), required(:token) => String.t() })`
    List of the most likely tokens and their log probability, at this token position. The number of entries may be fewer than the requested `top_logprobs`.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()) | nil,
          logprob: number(),
          token: String.t(),
          top_logprobs:
            list(%{
              required(:bytes) => list(integer()) | nil,
              required(:logprob) => number(),
              required(:token) => String.t()
            })
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:bytes) => list(integer()) | nil,
              required(:logprob) => number(),
              required(:token) => String.t(),
              required(:top_logprobs) =>
                list(%{
                  required(:bytes) => list(integer()) | nil,
                  required(:logprob) => number(),
                  required(:token) => String.t()
                })
            }
  defstruct [:bytes, :logprob, :token, :top_logprobs]
end
