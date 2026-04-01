defmodule ExOpenAI.Components.ContextManagementParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContextManagementParam.

  ## Fields

  * `:compact_threshold` - **optional** - `integer() | any()`

  * `:type` - **required** - `String.t()`  
    The context management entry type. Currently only 'compaction' is supported.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          compact_threshold: (integer() | any()) | nil,
          type: String.t()
        }
  defstruct [:compact_threshold, :type]
end
