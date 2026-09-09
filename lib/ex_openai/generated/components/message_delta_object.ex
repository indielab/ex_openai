defmodule ExOpenAI.Components.MessageDeltaObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a message delta i.e. any changed fields on a message during streaming.


  ## Fields

  * `:delta` - **required** - `%{ optional(:content) => list( ExOpenAI.Components.MessageDeltaContentImageFileObject.t() | ExOpenAI.Components.MessageDeltaContentTextObject.t() | ExOpenAI.Components.MessageDeltaContentRefusalObject.t() | ExOpenAI.Components.MessageDeltaContentImageUrlObject.t() ), optional(:role) => :user | :assistant }`
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:delta) => %{
                optional(:content) =>
                  list(
                    ((ExOpenAI.Components.MessageDeltaContentImageFileObject.input()
                      | ExOpenAI.Components.MessageDeltaContentTextObject.input())
                     | ExOpenAI.Components.MessageDeltaContentRefusalObject.input())
                    | ExOpenAI.Components.MessageDeltaContentImageUrlObject.input()
                  ),
                optional(:role) => (:user | :assistant) | String.t()
              },
              required(:id) => String.t(),
              required(:object) => :"thread.message.delta" | String.t()
            }
  defstruct [:delta, :id, :object]
end
