defmodule ExOpenAI.Components.TokenCountsResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TokenCountsResource.

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
  defstruct [:input_tokens, :object]
end
