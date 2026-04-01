defmodule ExOpenAI.Components.UserRoleUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UserRoleUpdateRequest.

  ## Fields

  * `:role` - **required** - `:owner | :reader`  
    `owner` or `reader`  
    Allowed values: `"owner"`, `"reader"`
  """
  @type t() :: %{__struct__: __MODULE__, role: :owner | :reader}
  defstruct [:role]
end
