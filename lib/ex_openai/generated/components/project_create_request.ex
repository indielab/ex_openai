defmodule ExOpenAI.Components.ProjectCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectCreateRequest.

  ## Fields

  * `:geography` - **optional** - `:US | :EU | :JP | :IN | :KR | :CA | :AU | :SG`  
    Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.  
    Allowed values: `"US"`, `"EU"`, `"JP"`, `"IN"`, `"KR"`, `"CA"`, `"AU"`, `"SG"`

  * `:name` - **required** - `String.t()`  
    The friendly name of the project, this name appears in reports.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          geography: (((((((:US | :EU) | :JP) | :IN) | :KR) | :CA) | :AU) | :SG) | nil,
          name: String.t()
        }
  defstruct [:geography, :name]
end
