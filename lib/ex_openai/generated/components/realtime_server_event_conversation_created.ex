defmodule ExOpenAI.Components.RealtimeServerEventConversationCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a conversation is created. Emitted right after session creation.


  ## Fields

  * `:conversation` - **required** - `{:%{}, [], [{{:optional, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:object]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    The conversation resource.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:type` - **required** - `:"conversation.created"`  
    The event type, must be `conversation.created`.  
    Allowed values: `"conversation.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          conversation: %{optional(:id) => String.t(), optional(:object) => String.t()},
          event_id: String.t(),
          type: :"conversation.created"
        }
  defstruct [:conversation, :event_id, :type]
end
