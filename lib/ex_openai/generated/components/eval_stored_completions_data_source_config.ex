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
  defstruct [:metadata, :schema, :type]
end
