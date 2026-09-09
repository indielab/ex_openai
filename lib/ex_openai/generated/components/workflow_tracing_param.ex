defmodule ExOpenAI.Components.WorkflowTracingParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls diagnostic tracing during the session.

  ## Fields

  * `:enabled` - **optional** - `boolean()`
    Whether tracing is enabled during the session. Defaults to true.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:enabled) => boolean()}
  defstruct [:enabled]
end
