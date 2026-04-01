defmodule ExOpenAI.Components.ProjectUserUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUserUpdateRequest.

  ## Fields

  * `:role` - **required** - `:owner | :member`  
    `owner` or `member`  
    Allowed values: `"owner"`, `"member"`
  """
  @type t() :: %{__struct__: __MODULE__, role: :owner | :member}
  defstruct [:role]
end
