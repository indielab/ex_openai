defmodule ExOpenAI.Components.EvalStoredCompletionsDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  Deprecated in favor of LogsDataSourceConfig.


  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:schema` - **required** - `map()`
    The json schema for the run data source items.
  Learn how to build JSON schemas [here](https://json-schema.org/).

  * `:type` - **required** - `:stored_completions`
    The type of data source. Always `stored_completions`.
    Allowed values: `"stored_completions"`
    Default: `"stored_completions"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          schema: map(),
          type: :stored_completions
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:schema) => map(),
              required(:type) => :stored_completions | String.t()
            }
  defstruct [:metadata, :schema, :type]
end
