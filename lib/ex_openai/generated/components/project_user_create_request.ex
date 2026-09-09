defmodule ExOpenAI.Components.ProjectUserCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUserCreateRequest.

  ## Fields

  * `:email` - **optional** - `String.t() | nil`
    Email of the user to add.

  * `:role` - **required** - `String.t()`
    `owner` or `member`

  * `:user_id` - **optional** - `String.t() | nil`
    The ID of the user.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          email: (String.t() | nil) | nil,
          role: String.t(),
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:email) => String.t() | nil,
              required(:role) => String.t(),
              optional(:user_id) => String.t() | nil
            }
  defstruct [:email, :role, :user_id]
end
