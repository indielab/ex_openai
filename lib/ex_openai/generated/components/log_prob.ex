defmodule ExOpenAI.Components.LogProb do
  use ExOpenAI.Jason

  @moduledoc """
  The log probability of a token.

  ## Fields

  * `:bytes` - **required** - `[integer()]`

  * `:logprob` - **required** - `number()`

  * `:token` - **required** - `String.t()`

  * `:top_logprobs` - **required** - `[ExOpenAI.Components.TopLogProb.t()]`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()),
          logprob: number(),
          token: String.t(),
          top_logprobs: list(ExOpenAI.Components.TopLogProb.t())
        }
  defstruct [:bytes, :logprob, :token, :top_logprobs]
end
