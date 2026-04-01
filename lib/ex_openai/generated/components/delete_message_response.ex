defmodule ExOpenAI.Components.DeleteMessageResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteMessageResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"thread.message.deleted"`  
    Allowed values: `"thread.message.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"thread.message.deleted"
        }
  defstruct [:deleted, :id, :object]
end
