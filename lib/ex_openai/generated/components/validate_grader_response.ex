defmodule ExOpenAI.Components.ValidateGraderResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ValidateGraderResponse.

  ## Fields

  * `:grader` - **optional** - `map()`
    The grader used for the fine-tuning job.
  """
  @type t() :: %{__struct__: __MODULE__, grader: map() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:grader) =>
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input()
            }
  defstruct [:grader]
end
