defmodule ExOpenAI.Components.TopLogProb do
  use ExOpenAI.Jason

  @moduledoc """
  The top log probability of a token.

  ## Fields

  * `:bytes` - **required** - `[integer()]`

  * `:logprob` - **required** - `number()`

  * `:token` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()),
          logprob: number(),
          token: String.t()
        }
  defstruct [:bytes, :logprob, :token]
end
