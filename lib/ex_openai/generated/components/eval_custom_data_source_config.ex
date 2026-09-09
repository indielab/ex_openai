defmodule ExOpenAI.Components.EvalCustomDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  A CustomDataSourceConfig which specifies the schema of your `item` and optionally `sample` namespaces.
  The response schema defines the shape of the data that will be:
  - Used to define your testing criteria and
  - What data is required when creating a run


  ## Fields

  * `:schema` - **required** - `map()`
    The json schema for the run data source items.
  Learn how to build JSON schemas [here](https://json-schema.org/).

  * `:type` - **required** - `:custom`
    The type of data source. Always `custom`.
    Allowed values: `"custom"`
    Default: `"custom"`
  """
  @type t() :: %{__struct__: __MODULE__, schema: map(), type: :custom}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:schema) => map(), required(:type) => :custom | String.t()}
  defstruct [:schema, :type]
end
