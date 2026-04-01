defmodule ExOpenAI.Components.MessageContentTextObject do
  use ExOpenAI.Jason

  @moduledoc """
  The text content that is part of a message.

  ## Fields

  * `:text` - **required** - `{:%{}, [], [{{:required, [], [:annotations]}, {:list, [], [{:|, [], [{{:., [], [ExOpenAI.Components.MessageContentTextAnnotationsFileCitationObject, :t]}, [], []}, {{:., [], [ExOpenAI.Components.MessageContentTextAnnotationsFilePathObject, :t]}, [], []}]}]}}, {{:required, [], [:value]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

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
  defstruct [:text, :type]
end
