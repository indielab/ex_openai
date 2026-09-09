defmodule ExOpenAI.Components.ResponseLogProb do
  use ExOpenAI.Jason

  @moduledoc """
  A logprob is the logarithmic probability that the model assigns to producing
  a particular token at a given position in the sequence. Less-negative (higher)
  logprob values indicate greater model confidence in that token choice.


  ## Fields

  * `:logprob` - **required** - `number()`
    The log probability of this token.

  * `:token` - **required** - `String.t()`
    A possible text token.

  * `:top_logprobs` - **optional** - `list(%{optional(:logprob) => number(), optional(:token) => String.t()})`
    The log probabilities of up to 20 of the most likely tokens.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          logprob: number(),
          token: String.t(),
          top_logprobs:
            list(%{optional(:logprob) => number(), optional(:token) => String.t()}) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:logprob) => number(),
              required(:token) => String.t(),
              optional(:top_logprobs) =>
                list(%{optional(:logprob) => number(), optional(:token) => String.t()})
            }
  defstruct [:logprob, :token, :top_logprobs]
end
