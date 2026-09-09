defmodule ExOpenAI.Components.LogProb do
  use ExOpenAI.Jason

  @moduledoc """
  The log probability of a token.

  ## Fields

  * `:bytes` - **required** - `list(integer())`

  * `:logprob` - **required** - `number()`

  * `:token` - **required** - `String.t()`

  * `:top_logprobs` - **required** - `list(ExOpenAI.Components.TopLogProb.t())`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()),
          logprob: number(),
          token: String.t(),
          top_logprobs: list(ExOpenAI.Components.TopLogProb.t())
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:bytes) => list(integer()),
              required(:logprob) => number(),
              required(:token) => String.t(),
              required(:top_logprobs) => list(ExOpenAI.Components.TopLogProb.input())
            }
  defstruct [:bytes, :logprob, :token, :top_logprobs]
end
