defmodule ExOpenAI.Components.DeletedConversation do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeletedConversation.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"conversation.deleted"`  
    Allowed values: `"conversation.deleted"`  
    Default: `"conversation.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"conversation.deleted"
        }
  defstruct [:deleted, :id, :object]
end
