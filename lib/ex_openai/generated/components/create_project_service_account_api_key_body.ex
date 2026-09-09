defmodule ExOpenAI.Components.CreateProjectServiceAccountApiKeyBody do
  use ExOpenAI.Jason

  @moduledoc """
  The service account API key create request payload.

  ## Fields

  * `:name` - **optional** - `String.t()`
    API key name.

  * `:scopes` - **optional** - `list(String.t())`
    API key scopes.
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t() | nil, scopes: list(String.t()) | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:name) => String.t(), optional(:scopes) => list(String.t())}
  defstruct [:name, :scopes]
end
