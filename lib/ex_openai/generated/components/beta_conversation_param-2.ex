defmodule :"Elixir.ExOpenAI.Components.BetaConversationParam-2" do
  use ExOpenAI.Jason

  @moduledoc """
  The conversation that this response belongs to.

  ## Fields

  * `:id` - **required** - `String.t()`
    The unique ID of the conversation.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:id) => String.t()}
  defstruct [:id]
end
