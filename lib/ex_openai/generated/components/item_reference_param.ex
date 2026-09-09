defmodule ExOpenAI.Components.ItemReferenceParam do
  use ExOpenAI.Jason

  @moduledoc """
  An internal identifier for an item to reference.

  ## Fields

  * `:id` - **required** - `String.t()`
    The ID of the item to reference.

  * `:type` - **optional** - `:item_reference | nil`
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t(), type: (:item_reference | nil) | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:id) => String.t(),
              optional(:type) => (:item_reference | String.t()) | nil
            }
  defstruct [:id, :type]
end
