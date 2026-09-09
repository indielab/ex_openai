defmodule ExOpenAI.Components.GraderMulti do
  use ExOpenAI.Jason

  @moduledoc """
  A MultiGrader object combines the output of multiple graders to produce a single score.

  ## Fields

  * `:calculate_output` - **required** - `String.t()`
    A formula to calculate the output based on grader results.

  * `:graders` - **required** - `ExOpenAI.Components.GraderStringCheck.t() | ExOpenAI.Components.GraderTextSimilarity.t() | ExOpenAI.Components.GraderPython.t() | ExOpenAI.Components.GraderScoreModel.t() | ExOpenAI.Components.GraderLabelModel.t()`

  * `:name` - **required** - `String.t()`
    The name of the grader.

  * `:type` - **required** - `:multi`
    The object type, which is always `multi`.
    Allowed values: `"multi"`
    Default: `"multi"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          calculate_output: String.t(),
          graders:
            (((ExOpenAI.Components.GraderStringCheck.t()
               | ExOpenAI.Components.GraderTextSimilarity.t())
              | ExOpenAI.Components.GraderPython.t())
             | ExOpenAI.Components.GraderScoreModel.t())
            | ExOpenAI.Components.GraderLabelModel.t(),
          name: String.t(),
          type: :multi
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:calculate_output) => String.t(),
              required(:graders) =>
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderLabelModel.input(),
              required(:name) => String.t(),
              required(:type) => :multi | String.t()
            }
  defstruct [:calculate_output, :graders, :name, :type]
end
