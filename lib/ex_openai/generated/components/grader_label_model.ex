defmodule ExOpenAI.Components.GraderLabelModel do
  use ExOpenAI.Jason

  @moduledoc """
  A LabelModelGrader object which uses a model to assign labels to each item
  in the evaluation.


  ## Fields

  * `:input` - **required** - `[ExOpenAI.Components.EvalItem.t()]`

  * `:labels` - **required** - `[String.t()]`  
    The labels to assign to each item in the evaluation.

  * `:model` - **required** - `String.t()`  
    The model to use for the evaluation. Must support structured outputs.

  * `:name` - **required** - `String.t()`  
    The name of the grader.

  * `:passing_labels` - **required** - `[String.t()]`  
    The labels that indicate a passing result. Must be a subset of labels.

  * `:type` - **required** - `:label_model`  
    The object type, which is always `label_model`.  
    Allowed values: `"label_model"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: list(ExOpenAI.Components.EvalItem.t()),
          labels: list(String.t()),
          model: String.t(),
          name: String.t(),
          passing_labels: list(String.t()),
          type: :label_model
        }
  defstruct [:input, :labels, :model, :name, :passing_labels, :type]
end
