defmodule ExOpenAI.Components.ProjectCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectCreateRequest.

  ## Fields

  * `:external_key_id` - **optional** - `String.t() | nil`
    External key ID to associate with the project.

  * `:geography` - **optional** - `String.t() | nil`
    Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.

  * `:name` - **required** - `String.t()`
    The friendly name of the project, this name appears in reports.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          external_key_id: (String.t() | nil) | nil,
          geography: (String.t() | nil) | nil,
          name: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:external_key_id) => String.t() | nil,
              optional(:geography) => String.t() | nil,
              required(:name) => String.t()
            }
  defstruct [:external_key_id, :geography, :name]
end
