defmodule ExOpenAI.Components.MessageContentTextObject do
  use ExOpenAI.Jason

  @moduledoc """
  The text content that is part of a message.

  ## Fields

  * `:text` - **required** - `%{ required(:annotations) => list( ExOpenAI.Components.MessageContentTextAnnotationsFileCitationObject.t() | ExOpenAI.Components.MessageContentTextAnnotationsFilePathObject.t() ), required(:value) => String.t() }`

  * `:type` - **required** - `:text`
    Always `text`.
    Allowed values: `"text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          text: %{
            required(:annotations) =>
              list(
                ExOpenAI.Components.MessageContentTextAnnotationsFileCitationObject.t()
                | ExOpenAI.Components.MessageContentTextAnnotationsFilePathObject.t()
              ),
            required(:value) => String.t()
          },
          type: :text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:text) => %{
                required(:annotations) =>
                  list(
                    ExOpenAI.Components.MessageContentTextAnnotationsFileCitationObject.input()
                    | ExOpenAI.Components.MessageContentTextAnnotationsFilePathObject.input()
                  ),
                required(:value) => String.t()
              },
              required(:type) => :text | String.t()
            }
  defstruct [:text, :type]
end
