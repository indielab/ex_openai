defmodule ExOpenAI.Components.FunctionParameters do
  use ExOpenAI.Jason

  @moduledoc """
  The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format. 

  Omitting `parameters` defines a function with an empty parameter list.
  """
  @type t() :: map()
end
