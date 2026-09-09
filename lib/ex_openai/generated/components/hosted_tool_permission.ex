defmodule ExOpenAI.Components.HostedToolPermission do
  use ExOpenAI.Jason

  @moduledoc """
  Permission state for a single hosted tool on a project.

  ## Fields

  * `:enabled` - **required** - `boolean()`
    Whether the hosted tool is enabled for the project.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:enabled) => boolean()}
  defstruct [:enabled]
end
