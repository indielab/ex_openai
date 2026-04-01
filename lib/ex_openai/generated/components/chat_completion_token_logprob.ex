defmodule ExOpenAI.Components.ChatCompletionTokenLogprob do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionTokenLogprob.

  ## Fields

  * `:bytes` - **required** - `[integer()] | any()`

  * `:logprob` - **required** - `number()`  
    The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.

  * `:token` - **required** - `String.t()`  
    The token.

  * `:top_logprobs` - **required** - `[{:%{}, [], [{{:required, [], [:bytes]}, {:|, [], [{:list, [], [{:integer, [], []}]}, {:any, [], []}]}}, {{:required, [], [:logprob]}, {:number, [], []}}, {{:required, [], [:token]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: list(integer()) | any(),
          logprob: number(),
          token: String.t(),
          top_logprobs:
            list(%{
              required(:bytes) => list(integer()) | any(),
              required(:logprob) => number(),
              required(:token) => String.t()
            })
        }
  defstruct [:bytes, :logprob, :token, :top_logprobs]
end
