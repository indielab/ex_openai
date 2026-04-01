defmodule ExOpenAI.Components.ItemReferenceParam do
  use ExOpenAI.Jason

  @moduledoc """
  An internal identifier for an item to reference.

  ## Fields

  * `:id` - **required** - `String.t()`  
    The ID of the item to reference.

  * `:type` - **optional** - `:item_reference | any()`
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t(), type: (:item_reference | any()) | nil}
  defstruct [:id, :type]
end
