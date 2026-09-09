defmodule ExOpenAI.Components.ValidateGraderRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ValidateGraderRequest.

  ## Fields

  * `:grader` - **required** - `map()`
    The grader used for the fine-tuning job.
  """
  @type t() :: %{__struct__: __MODULE__, grader: map()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:grader) =>
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input()
            }
  defstruct [:grader]
end
