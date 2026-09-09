defmodule ExOpenAI.Components.ProjectUserUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUserUpdateRequest.

  ## Fields

  * `:role` - **optional** - `String.t() | nil`
    `owner` or `member`
  """
  @type t() :: %{__struct__: __MODULE__, role: (String.t() | nil) | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:role) => String.t() | nil}
  defstruct [:role]
end
