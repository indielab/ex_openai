defmodule ExOpenAI.Components.WidgetMessageItem do
  use ExOpenAI.Jason

  @moduledoc """
  Thread item that renders a widget payload.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) for when the item was created.

  * `:id` - **required** - `String.t()`  
    Identifier of the thread item.

  * `:object` - **required** - `:"chatkit.thread_item"`  
    Type discriminator that is always `chatkit.thread_item`.  
    Allowed values: `"chatkit.thread_item"`  
    Default: `"chatkit.thread_item"`

  * `:thread_id` - **required** - `String.t()`  
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.widget"`  
    Type discriminator that is always `chatkit.widget`.  
    Allowed values: `"chatkit.widget"`  
    Default: `"chatkit.widget"`

  * `:widget` - **required** - `String.t()`  
    Serialized widget payload rendered in the UI.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"chatkit.thread_item",
          thread_id: String.t(),
          type: :"chatkit.widget",
          widget: String.t()
        }
  defstruct [:created_at, :id, :object, :thread_id, :type, :widget]
end
