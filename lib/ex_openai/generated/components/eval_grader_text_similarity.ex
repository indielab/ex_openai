defmodule ExOpenAI.Components.EvalGraderTextSimilarity do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalGraderTextSimilarity.

  ## Fields

  * `:evaluation_metric` - **required** - `:cosine | :fuzzy_match | :bleu | :gleu | :meteor | :rouge_1 | :rouge_2 | :rouge_3 | :rouge_4 | :rouge_5 | :rouge_l`
    The evaluation metric to use. One of `cosine`, `fuzzy_match`, `bleu`,
  `gleu`, `meteor`, `rouge_1`, `rouge_2`, `rouge_3`, `rouge_4`, `rouge_5`,
  or `rouge_l`.
    Allowed values: `"cosine"`, `"fuzzy_match"`, `"bleu"`, `"gleu"`, `"meteor"`, `"rouge_1"`, `"rouge_2"`, `"rouge_3"`, `"rouge_4"`, `"rouge_5"`, `"rouge_l"`

  * `:input` - **required** - `String.t()`
    The text being graded.

  * `:name` - **required** - `String.t()`
    The name of the grader.

  * `:pass_threshold` - **required** - `number()`
    The threshold for the score.

  * `:reference` - **required** - `String.t()`
    The text being graded against.

  * `:type` - **required** - `:text_similarity`
    The type of grader.
    Allowed values: `"text_similarity"`
    Default: `"text_similarity"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          evaluation_metric:
            (((((((((:cosine | :fuzzy_match) | :bleu) | :gleu) | :meteor) | :rouge_1) | :rouge_2)
               | :rouge_3)
              | :rouge_4)
             | :rouge_5)
            | :rouge_l,
          input: String.t(),
          name: String.t(),
          pass_threshold: number(),
          reference: String.t(),
          type: :text_similarity
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:evaluation_metric) =>
                ((((((((((:cosine | :fuzzy_match) | :bleu) | :gleu) | :meteor) | :rouge_1)
                     | :rouge_2)
                    | :rouge_3)
                   | :rouge_4)
                  | :rouge_5)
                 | :rouge_l)
                | String.t(),
              required(:input) => String.t(),
              required(:name) => String.t(),
              required(:pass_threshold) => number(),
              required(:reference) => String.t(),
              required(:type) => :text_similarity | String.t()
            }
  defstruct [:evaluation_metric, :input, :name, :pass_threshold, :reference, :type]
end
