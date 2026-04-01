defmodule ExOpenAI.Components.EvalGraderScoreModel do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalGraderScoreModel.

  ## Fields

  * `:input` - **required** - `[ExOpenAI.Components.EvalItem.t()]`  
    The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.

  * `:model` - **required** - `String.t()`  
    The model to use for the evaluation.

  * `:name` - **required** - `String.t()`  
    The name of the grader.

  * `:pass_threshold` - **optional** - `number()`  
    The threshold for the score.

  * `:range` - **optional** - `[number()]`  
    The range of the score. Defaults to `[0, 1]`.

  * `:sampling_params` - **optional** - `{:%{}, [], [{{:optional, [], [:max_completions_tokens]}, {:|, [], [{:integer, [], []}, {:any, [], []}]}}, {{:optional, [], [:reasoning_effort]}, {{:., [], [ExOpenAI.Components.ReasoningEffort, :t]}, [], []}}, {{:optional, [], [:seed]}, {:|, [], [{:integer, [], []}, {:any, [], []}]}}, {{:optional, [], [:temperature]}, {:|, [], [{:number, [], []}, {:any, [], []}]}}, {{:optional, [], [:top_p]}, {:|, [], [{:number, [], []}, {:any, [], []}]}}]}`  
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
          pass_threshold: number() | nil,
          range: list(number()) | nil,
          sampling_params:
            %{
              optional(:max_completions_tokens) => integer() | any(),
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.t(),
              optional(:seed) => integer() | any(),
              optional(:temperature) => number() | any(),
              optional(:top_p) => number() | any()
            }
            | nil,
          type: :score_model
        }
  defstruct [:input, :model, :name, :pass_threshold, :range, :sampling_params, :type]
end
