defmodule ExOpenAI.Components.MessageDeltaContentTextObject do
  use ExOpenAI.Jason

  @moduledoc """
  The text content that is part of a message.

  ## Fields

  * `:index` - **required** - `integer()`
    The index of the content part in the message.

  * `:text` - **optional** - `%{ optional(:annotations) => list( ExOpenAI.Components.MessageDeltaContentTextAnnotationsFileCitationObject.t() | ExOpenAI.Components.MessageDeltaContentTextAnnotationsFilePathObject.t() ), optional(:value) => String.t() }`

  * `:type` - **required** - `:text`
    Always `text`.
    Allowed values: `"text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          index: integer(),
          text:
            %{
              optional(:annotations) =>
                list(
                  ExOpenAI.Components.MessageDeltaContentTextAnnotationsFileCitationObject.t()
                  | ExOpenAI.Components.MessageDeltaContentTextAnnotationsFilePathObject.t()
                ),
              optional(:value) => String.t()
            }
            | nil,
          type: :text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:index) => integer(),
              optional(:text) => %{
                optional(:annotations) =>
                  list(
                    ExOpenAI.Components.MessageDeltaContentTextAnnotationsFileCitationObject.input()
                    | ExOpenAI.Components.MessageDeltaContentTextAnnotationsFilePathObject.input()
                  ),
                optional(:value) => String.t()
              },
              required(:type) => :text | String.t()
            }
  defstruct [:index, :text, :type]
end
