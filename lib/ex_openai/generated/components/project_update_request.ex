defmodule ExOpenAI.Components.ProjectUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUpdateRequest.

  ## Fields

  * `:name` - **required** - `String.t()`  
    The updated name of the project, this name appears in reports.
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  defstruct [:name]
end
