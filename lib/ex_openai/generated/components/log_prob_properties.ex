defmodule ExOpenAI.Components.LogProbProperties do
  use ExOpenAI.Jason

  @moduledoc """
  A log probability object.


  ## Fields

  * `:bytes` - **required** - `list(integer())`
    The bytes that were used to generate the log probability.

  * `:logprob` - **required** - `number()`
    The log probability of the token.

  * `:token` - **required** - `String.t()`
    The token that was used to generate the log probability.
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
