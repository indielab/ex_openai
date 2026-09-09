defmodule ExOpenAI.Components.RunGraderRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunGraderRequest.

  ## Fields

  * `:grader` - **required** - `map()`
    The grader used for the fine-tuning job.

  * `:item` - **optional** - `map()`
    The dataset item provided to the grader. This will be used to populate
  the `item` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.

  * `:model_sample` - **required** - `String.t()`
    The model sample to be evaluated. This value will be used to populate
  the `sample` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
  The `output_json` variable will be populated if the model sample is a
  valid JSON string.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          grader: map(),
          item: map() | nil,
          model_sample: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:grader) =>
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input(),
              optional(:item) => map(),
              required(:model_sample) => String.t()
            }
  defstruct [:grader, :item, :model_sample]
end
