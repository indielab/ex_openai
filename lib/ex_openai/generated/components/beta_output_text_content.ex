defmodule ExOpenAI.Components.BetaOutputTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A text output from the model.

  ## Fields

  * `:annotations` - **required** - `list(ExOpenAI.Components.BetaAnnotation.t())`
    The annotations of the text output.

  * `:logprobs` - **required** - `list(ExOpenAI.Components.BetaLogProb.t())`

  * `:text` - **required** - `String.t()`
    The text output from the model.

  * `:type` - **required** - `:output_text`
    The type of the output text. Always `output_text`.
    Allowed values: `"output_text"`
    Default: `"output_text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations: list(ExOpenAI.Components.BetaAnnotation.t()),
          logprobs: list(ExOpenAI.Components.BetaLogProb.t()),
          text: String.t(),
          type: :output_text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:annotations) => list(ExOpenAI.Components.BetaAnnotation.input()),
              required(:logprobs) => list(ExOpenAI.Components.BetaLogProb.input()),
              required(:text) => String.t(),
              required(:type) => :output_text | String.t()
            }
  defstruct [:annotations, :logprobs, :text, :type]
end
