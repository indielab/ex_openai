defmodule ExOpenAI.Components.BetaTokenCountsResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaTokenCountsResource.

  ## Fields

  * `:input_tokens` - **required** - `integer()`

  * `:object` - **required** - `:"response.input_tokens"`
    Allowed values: `"response.input_tokens"`
    Default: `"response.input_tokens"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_tokens: integer(),
          object: :"response.input_tokens"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input_tokens) => integer(),
              required(:object) => :"response.input_tokens" | String.t()
            }
  defstruct [:input_tokens, :object]
end
