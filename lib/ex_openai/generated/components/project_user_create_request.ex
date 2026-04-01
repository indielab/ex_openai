defmodule ExOpenAI.Components.ProjectUserCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUserCreateRequest.

  ## Fields

  * `:role` - **required** - `:owner | :member`  
    `owner` or `member`  
    Allowed values: `"owner"`, `"member"`

  * `:user_id` - **required** - `String.t()`  
    The ID of the user.
  """
  @type t() :: %{__struct__: __MODULE__, role: :owner | :member, user_id: String.t()}
  defstruct [:role, :user_id]
end
