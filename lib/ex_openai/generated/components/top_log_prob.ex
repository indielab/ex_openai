defmodule ExOpenAI.Components.TopLogProb do
  use ExOpenAI.Jason

  @moduledoc """
  The top log probability of a token.

  ## Fields

  * `:bytes` - **required** - `list(integer())`

  * `:logprob` - **required** - `number()`

  * `:token` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()),
          logprob: number(),
          token: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:bytes) => list(integer()),
              required(:logprob) => number(),
              required(:token) => String.t()
            }
  defstruct [:bytes, :logprob, :token]
end
