defmodule ExOpenAI.Components.GraderScoreModel do
  use ExOpenAI.Jason

  @moduledoc """
  A ScoreModelGrader object that uses a model to assign a score to the input.


  ## Fields

  * `:input` - **required** - `list(ExOpenAI.Components.EvalItem.t())`
    The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.

  * `:model` - **required** - `String.t()`
    The model to use for the evaluation.

  * `:name` - **required** - `String.t()`
    The name of the grader.

  * `:range` - **optional** - `list(number())`
    The range of the score. Defaults to `[0, 1]`.

  * `:sampling_params` - **optional** - `%{ optional(:max_completions_tokens) => integer() | nil, optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.t(), optional(:seed) => integer() | nil, optional(:temperature) => number() | nil, optional(:top_p) => number() | nil }`
    The sampling parameters for the model.

  * `:type` - **required** - `:score_model`
    The object type, which is always `score_model`.
    Allowed values: `"score_model"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: list(ExOpenAI.Components.EvalItem.t()),
          model: String.t(),
          name: String.t(),
          range: list(number()) | nil,
          sampling_params:
            %{
              optional(:max_completions_tokens) => integer() | nil,
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.t(),
              optional(:seed) => integer() | nil,
              optional(:temperature) => number() | nil,
              optional(:top_p) => number() | nil
            }
            | nil,
          type: :score_model
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) => list(ExOpenAI.Components.EvalItem.input()),
              required(:model) => String.t(),
              required(:name) => String.t(),
              optional(:range) => list(number()),
              optional(:sampling_params) => %{
                optional(:max_completions_tokens) => integer() | nil,
                optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.input(),
                optional(:seed) => integer() | nil,
                optional(:temperature) => number() | nil,
                optional(:top_p) => number() | nil
              },
              required(:type) => :score_model | String.t()
            }
  defstruct [:input, :model, :name, :range, :sampling_params, :type]
end
