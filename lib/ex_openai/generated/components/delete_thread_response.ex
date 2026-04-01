defmodule ExOpenAI.Components.DeleteThreadResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteThreadResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"thread.deleted"`  
    Allowed values: `"thread.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"thread.deleted"
        }
  defstruct [:deleted, :id, :object]
end
