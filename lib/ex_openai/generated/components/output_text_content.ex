defmodule ExOpenAI.Components.OutputTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A text output from the model.

  ## Fields

  * `:annotations` - **required** - `[ExOpenAI.Components.Annotation.t()]`  
    The annotations of the text output.

  * `:logprobs` - **required** - `[ExOpenAI.Components.LogProb.t()]`

  * `:text` - **required** - `String.t()`  
    The text output from the model.

  * `:type` - **required** - `:output_text`  
    The type of the output text. Always `output_text`.  
    Allowed values: `"output_text"`  
    Default: `"output_text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations: list(ExOpenAI.Components.Annotation.t()),
          logprobs: list(ExOpenAI.Components.LogProb.t()),
          text: String.t(),
          type: :output_text
        }
  defstruct [:annotations, :logprobs, :text, :type]
end
