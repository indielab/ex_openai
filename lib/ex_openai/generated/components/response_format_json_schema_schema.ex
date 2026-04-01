defmodule ExOpenAI.Components.ResponseFormatJsonSchemaSchema do
  use ExOpenAI.Jason

  @moduledoc """
  The schema for the response format, described as a JSON Schema object.
  Learn how to build JSON schemas [here](https://json-schema.org/).

  """
  @type t() :: map()
end
