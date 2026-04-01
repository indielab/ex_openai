defmodule ExOpenAI.Components.LocalEnvironmentResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the use of a local environment to perform shell actions.

  ## Fields

  * `:type` - **required** - `:local`  
    The environment type. Always `local`.  
    Allowed values: `"local"`  
    Default: `"local"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :local}
  defstruct [:type]
end
