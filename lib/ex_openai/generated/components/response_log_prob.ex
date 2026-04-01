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

  * `:top_logprobs` - **optional** - `[{:%{}, [], [{{:optional, [], [:logprob]}, {:number, [], []}}, {{:optional, [], [:token]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    The log probability of the top 20 most likely tokens.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          logprob: number(),
          token: String.t(),
          top_logprobs:
            list(%{optional(:logprob) => number(), optional(:token) => String.t()}) | nil
        }
  defstruct [:logprob, :token, :top_logprobs]
end
