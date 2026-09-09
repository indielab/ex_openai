defmodule ExOpenAI.Components.VideoCharacterResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VideoCharacterResource.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) when the character was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t() | nil`

  * `:name` - **required** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t() | nil,
          name: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t() | nil,
              required(:name) => String.t() | nil
            }
  defstruct [:created_at, :id, :name]
end
