defmodule ExOpenAI.Components.EvalStoredCompletionsSource do
  use ExOpenAI.Jason

  @moduledoc """
  A StoredCompletionsRunDataSource configuration describing a set of filters


  ## Fields

  * `:created_after` - **optional** - `integer() | any()`

  * `:created_before` - **optional** - `integer() | any()`

  * `:limit` - **optional** - `integer() | any()`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:stored_completions`  
    The type of source. Always `stored_completions`.  
    Allowed values: `"stored_completions"`  
    Default: `"stored_completions"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_after: (integer() | any()) | nil,
          created_before: (integer() | any()) | nil,
          limit: (integer() | any()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: (String.t() | any()) | nil,
          type: :stored_completions
        }
  defstruct [:created_after, :created_before, :limit, :metadata, :model, :type]
end
