defmodule ExOpenAI.Components.PredictionContent do
  use ExOpenAI.Jason

  @moduledoc """
  Static predicted output content, such as the content of a text file that is
  being regenerated.


  ## Fields

  * `:content` - **required** - `String.t() | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t())`
    The content that should be matched when generating a model response.
  If generated tokens would match this content, the entire model response
  can be returned much more quickly.

  * `:type` - **required** - `:content`
    The type of the predicted content you want to provide. This type is
  currently always `content`.
    Allowed values: `"content"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            String.t() | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()),
          type: :content
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) =>
                String.t()
                | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.input()),
              required(:type) => :content | String.t()
            }
  defstruct [:content, :type]
end
