defmodule :"Elixir.ExOpenAI.Components.ConversationParam-2" do
  use ExOpenAI.Jason

  @moduledoc """
  The conversation that this response belongs to.

  ## Fields

  * `:id` - **required** - `String.t()`  
    The unique ID of the conversation.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t()}
  defstruct [:id]
end
