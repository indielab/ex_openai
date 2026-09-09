defmodule ExOpenAI.Components.CreateEvalCustomDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  A CustomDataSourceConfig object that defines the schema for the data source used for the evaluation runs.
  This schema is used to define the shape of the data that will be:
  - Used to define your testing criteria and
  - What data is required when creating a run


  ## Fields

  * `:include_sample_schema` - **optional** - `boolean()`
    Whether the eval should expect you to populate the sample namespace (ie, by generating responses off of your data source)
    Default: `false`

  * `:item_schema` - **required** - `map()`
    The json schema for each row in the data source.

  * `:type` - **required** - `:custom`
    The type of data source. Always `custom`.
    Allowed values: `"custom"`
    Default: `"custom"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          include_sample_schema: boolean() | nil,
          item_schema: map(),
          type: :custom
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:include_sample_schema) => boolean(),
              required(:item_schema) => map(),
              required(:type) => :custom | String.t()
            }
  defstruct [:include_sample_schema, :item_schema, :type]
end
