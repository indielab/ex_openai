defmodule ExOpenAI.Components.ChatSessionHistory do
  use ExOpenAI.Jason

  @moduledoc """
  History retention preferences returned for the session.

  ## Fields

  * `:enabled` - **required** - `boolean()`
    Indicates if chat history is persisted for the session.

  * `:recent_threads` - **required** - `integer() | nil`
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean(), recent_threads: integer() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:enabled) => boolean(), required(:recent_threads) => integer() | nil}
  defstruct [:enabled, :recent_threads]
end
