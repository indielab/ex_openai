defmodule ExOpenAI.Components.DoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Occurs when a stream ends.

  ## Fields

  * `:data` - **required** - `:"[DONE]"`
    Allowed values: `"[DONE]"`

  * `:event` - **required** - `:done`
    Allowed values: `"done"`
  """
  @type t() :: %{__struct__: __MODULE__, data: :"[DONE]", event: :done}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{required(:data) => :"[DONE]" | String.t(), required(:event) => :done | String.t()}
  defstruct [:data, :event]
end
