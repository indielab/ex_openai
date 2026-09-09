defmodule ExOpenAI.Components.ProjectUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUpdateRequest.

  ## Fields

  * `:external_key_id` - **optional** - `String.t() | nil`
    External key ID to associate with the project.

  * `:geography` - **optional** - `String.t() | nil`
    Geography for the project.

  * `:name` - **optional** - `String.t() | nil`
    The updated name of the project, this name appears in reports.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          external_key_id: (String.t() | nil) | nil,
          geography: (String.t() | nil) | nil,
          name: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:external_key_id) => String.t() | nil,
              optional(:geography) => String.t() | nil,
              optional(:name) => String.t() | nil
            }
  defstruct [:external_key_id, :geography, :name]
end
