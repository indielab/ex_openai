defmodule ExOpenAI.Components.RealtimeConversationItemWithReference do
  use ExOpenAI.Jason

  @moduledoc """
  The item to add to the conversation.

  ## Fields

  * `:arguments` - **optional** - `String.t()`  
    The arguments of the function call (for `function_call` items).

  * `:call_id` - **optional** - `String.t()`  
    The ID of the function call (for `function_call` and 
  `function_call_output` items). If passed on a `function_call_output` 
  item, the server will check that a `function_call` item with the same 
  ID exists in the conversation history.

  * `:content` - **optional** - `[{:%{}, [], [{{:optional, [], [:audio]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:transcript]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:type]}, {:|, [], [{:|, [], [{:|, [], [:input_audio, :input_text]}, :item_reference]}, :text]}}]}]`  
    The content of the message, applicable for `message` items. 
  - Message items of role `system` support only `input_text` content
  - Message items of role `user` support `input_text` and `input_audio` 
    content
  - Message items of role `assistant` support `text` content.

  * `:id` - **optional** - `String.t()`  
    For an item of type (`message` | `function_call` | `function_call_output`)
  this field allows the client to assign the unique ID of the item. It is
  not required because the server will generate one if not provided.

  For an item of type `item_reference`, this field is required and is a
  reference to any item that has previously existed in the conversation.

  * `:name` - **optional** - `String.t()`  
    The name of the function being called (for `function_call` items).

  * `:object` - **optional** - `:"realtime.item"`  
    Identifier for the API object being returned - always `realtime.item`.  
    Allowed values: `"realtime.item"`

  * `:output` - **optional** - `String.t()`  
    The output of the function call (for `function_call_output` items).

  * `:role` - **optional** - `:user | :assistant | :system`  
    The role of the message sender (`user`, `assistant`, `system`), only 
  applicable for `message` items.  
    Allowed values: `"user"`, `"assistant"`, `"system"`

  * `:status` - **optional** - `:completed | :incomplete | :in_progress`  
    The status of the item (`completed`, `incomplete`, `in_progress`). These have no effect 
  on the conversation, but are accepted for consistency with the 
  `conversation.item.created` event.  
    Allowed values: `"completed"`, `"incomplete"`, `"in_progress"`

  * `:type` - **optional** - `:message | :function_call | :function_call_output`  
    The type of the item (`message`, `function_call`, `function_call_output`, `item_reference`).  
    Allowed values: `"message"`, `"function_call"`, `"function_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t() | nil,
          call_id: String.t() | nil,
          content:
            list(%{
              optional(:audio) => String.t(),
              optional(:id) => String.t(),
              optional(:text) => String.t(),
              optional(:transcript) => String.t(),
              optional(:type) => ((:input_audio | :input_text) | :item_reference) | :text
            })
            | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          object: :"realtime.item" | nil,
          output: String.t() | nil,
          role: ((:user | :assistant) | :system) | nil,
          status: ((:completed | :incomplete) | :in_progress) | nil,
          type: ((:message | :function_call) | :function_call_output) | nil
        }
  defstruct [:arguments, :call_id, :content, :id, :name, :object, :output, :role, :status, :type]
end
