defmodule ExOpenAI.Components.GroupUser do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual user returned when inspecting group membership.

  ## Fields

  * `:email` - **required** - `String.t() | nil`
    The email address of the user.

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`
    The name of the user.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          email: String.t() | nil,
          id: String.t(),
          name: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:email) => String.t() | nil,
              required(:id) => String.t(),
              required(:name) => String.t()
            }
  defstruct [:email, :id, :name]
end
