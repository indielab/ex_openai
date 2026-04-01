defmodule ExOpenAI.Components.GraderTextSimilarity do
  use ExOpenAI.Jason

  @moduledoc """
  A TextSimilarityGrader object which grades text based on similarity metrics.


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
          reference: String.t(),
          type: :text_similarity
        }
  defstruct [:evaluation_metric, :input, :name, :reference, :type]
end
