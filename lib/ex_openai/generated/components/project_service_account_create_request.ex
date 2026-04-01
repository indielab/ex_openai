defmodule ExOpenAI.Components.ProjectServiceAccountCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountCreateRequest.

  ## Fields

  * `:name` - **required** - `String.t()`  
    The name of the service account being created.
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  defstruct [:name]
end
