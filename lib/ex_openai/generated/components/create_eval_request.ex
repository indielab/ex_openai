defmodule ExOpenAI.Components.CreateEvalRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateEvalRequest.

  ## Fields

  * `:data_source_config` - **required** - `map()`  
    The configuration for the data source used for the evaluation runs. Dictates the schema of the data used in the evaluation.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **optional** - `String.t()`  
    The name of the evaluation.

  * `:testing_criteria` - **required** - `[ExOpenAI.Components.CreateEvalLabelModelGrader.t() | ExOpenAI.Components.EvalGraderStringCheck.t() | ExOpenAI.Components.EvalGraderTextSimilarity.t() | ExOpenAI.Components.EvalGraderPython.t() | ExOpenAI.Components.EvalGraderScoreModel.t()]`  
    A list of graders for all eval runs in this group. Graders can reference variables in the data source using double curly braces notation, like `{{item.variable_name}}`. To reference the model's output, use the `sample` namespace (ie, `{{sample.output_text}}`).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data_source_config: map(),
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          name: String.t() | nil,
          testing_criteria:
            list(
              (((ExOpenAI.Components.CreateEvalLabelModelGrader.t()
                 | ExOpenAI.Components.EvalGraderStringCheck.t())
                | ExOpenAI.Components.EvalGraderTextSimilarity.t())
               | ExOpenAI.Components.EvalGraderPython.t())
              | ExOpenAI.Components.EvalGraderScoreModel.t()
            )
        }
  defstruct [:data_source_config, :metadata, :name, :testing_criteria]
end
