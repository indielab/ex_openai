defmodule ExOpenAI.Components.CreateEvalLogsDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  A data source config which specifies the metadata property of your logs query.
  This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.


  ## Fields

  * `:metadata` - **optional** - `map()`  
    Metadata filters for the logs data source.

  * `:type` - **required** - `:logs`  
    The type of data source. Always `logs`.  
    Allowed values: `"logs"`  
    Default: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, metadata: map() | nil, type: :logs}
  defstruct [:metadata, :type]
end
