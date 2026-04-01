defmodule ExOpenAI.Components.EvalRunOutputItemResult do
  use ExOpenAI.Jason

  @moduledoc """
  A single grader result for an evaluation run output item.


  ## Fields

  * `:name` - **required** - `String.t()`  
    The name of the grader.

  * `:passed` - **required** - `boolean()`  
    Whether the grader considered the output a pass.

  * `:sample` - **optional** - `map() | any()`  
    Optional sample or intermediate data produced by the grader.

  * `:score` - **required** - `number()`  
    The numeric score produced by the grader.

  * `:type` - **optional** - `String.t()`  
    The grader type (for example, "string-check-grader").
  """
  @type t() :: %{
          __struct__: __MODULE__,
          name: String.t(),
          passed: boolean(),
          sample: (map() | any()) | nil,
          score: number(),
          type: String.t() | nil
        }
  defstruct [:name, :passed, :sample, :score, :type]
end
