defmodule ExOpenAI.Components.UserRoleUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UserRoleUpdateRequest.

  ## Fields

  * `:developer_persona` - **optional** - `String.t() | nil`
    Developer persona metadata.

  * `:role` - **optional** - `String.t() | nil`
    `owner` or `reader`

  * `:role_id` - **optional** - `String.t() | nil`
    Role ID to assign to the user.

  * `:technical_level` - **optional** - `String.t() | nil`
    Technical level metadata.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          developer_persona: (String.t() | nil) | nil,
          role: (String.t() | nil) | nil,
          role_id: (String.t() | nil) | nil,
          technical_level: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:developer_persona) => String.t() | nil,
              optional(:role) => String.t() | nil,
              optional(:role_id) => String.t() | nil,
              optional(:technical_level) => String.t() | nil
            }
  defstruct [:developer_persona, :role, :role_id, :technical_level]
end
