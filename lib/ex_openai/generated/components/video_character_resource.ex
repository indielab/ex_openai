defmodule ExOpenAI.Components.VideoCharacterResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VideoCharacterResource.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the character was created.

  * `:id` - **required** - `String.t() | any()`

  * `:name` - **required** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t() | any(),
          name: String.t() | any()
        }
  defstruct [:created_at, :id, :name]
end
