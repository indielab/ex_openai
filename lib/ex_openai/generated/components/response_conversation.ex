defmodule ExOpenAI.Components.ResponseConversation do
  use ExOpenAI.Jason

  @moduledoc """
  The conversation that this response belonged to. Input items and output items from this response were automatically added to this conversation.

  ## Fields

  * `:id` - **required** - `String.t()`
    The unique ID of the conversation that this response was associated with.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:id) => String.t()}
  defstruct [:id]
end
