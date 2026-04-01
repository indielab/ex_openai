defmodule ExOpenAI.Components.MessageDeltaObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a message delta i.e. any changed fields on a message during streaming.


  ## Fields

  * `:delta` - **required** - `{:%{}, [], [{{:optional, [], [:content]}, {:list, [], [{:|, [], [{:|, [], [{:|, [], [{{:., [], [ExOpenAI.Components.MessageDeltaContentImageFileObject, :t]}, [], []}, {{:., [], [ExOpenAI.Components.MessageDeltaContentTextObject, :t]}, [], []}]}, {{:., [], [ExOpenAI.Components.MessageDeltaContentRefusalObject, :t]}, [], []}]}, {{:., [], [ExOpenAI.Components.MessageDeltaContentImageUrlObject, :t]}, [], []}]}]}}, {{:optional, [], [:role]}, {:|, [], [:user, :assistant]}}]}`  
    The delta containing the fields that have changed on the Message.

  * `:id` - **required** - `String.t()`  
    The identifier of the message, which can be referenced in API endpoints.

  * `:object` - **required** - `:"thread.message.delta"`  
    The object type, which is always `thread.message.delta`.  
    Allowed values: `"thread.message.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: %{
            optional(:content) =>
              list(
                ((ExOpenAI.Components.MessageDeltaContentImageFileObject.t()
                  | ExOpenAI.Components.MessageDeltaContentTextObject.t())
                 | ExOpenAI.Components.MessageDeltaContentRefusalObject.t())
                | ExOpenAI.Components.MessageDeltaContentImageUrlObject.t()
              ),
            optional(:role) => :user | :assistant
          },
          id: String.t(),
          object: :"thread.message.delta"
        }
  defstruct [:delta, :id, :object]
end
