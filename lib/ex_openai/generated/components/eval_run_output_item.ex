defmodule ExOpenAI.Components.EvalRunOutputItem do
  use ExOpenAI.Jason

  @moduledoc """
  A schema representing an evaluation run output item.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the evaluation run was created.

  * `:datasource_item` - **required** - `map()`  
    Details of the input data source item.

  * `:datasource_item_id` - **required** - `integer()`  
    The identifier for the data source item.

  * `:eval_id` - **required** - `String.t()`  
    The identifier of the evaluation group.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the evaluation run output item.

  * `:object` - **required** - `:"eval.run.output_item"`  
    The type of the object. Always "eval.run.output_item".  
    Allowed values: `"eval.run.output_item"`  
    Default: `"eval.run.output_item"`

  * `:results` - **required** - `[ExOpenAI.Components.EvalRunOutputItemResult.t()]`  
    A list of grader results for this output item.

  * `:run_id` - **required** - `String.t()`  
    The identifier of the evaluation run associated with this output item.

  * `:sample` - **required** - `{:%{}, [], [{{:required, [], [:error]}, {{:., [], [ExOpenAI.Components.EvalApiError, :t]}, [], []}}, {{:required, [], [:finish_reason]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:input]}, {:list, [], [{:%{}, [], [{{:required, [], [:content]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:role]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]}}, {{:required, [], [:max_completion_tokens]}, {:integer, [], []}}, {{:required, [], [:model]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:output]}, {:list, [], [{:%{}, [], [{{:optional, [], [:content]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:role]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]}}, {{:required, [], [:seed]}, {:integer, [], []}}, {{:required, [], [:temperature]}, {:number, [], []}}, {{:required, [], [:top_p]}, {:number, [], []}}, {{:required, [], [:usage]}, {:%{}, [], [{{:required, [], [:cached_tokens]}, {:integer, [], []}}, {{:required, [], [:completion_tokens]}, {:integer, [], []}}, {{:required, [], [:prompt_tokens]}, {:integer, [], []}}, {{:required, [], [:total_tokens]}, {:integer, [], []}}]}}]}`  
    A sample containing the input and output of the evaluation run.

  * `:status` - **required** - `String.t()`  
    The status of the evaluation run.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          datasource_item: map(),
          datasource_item_id: integer(),
          eval_id: String.t(),
          id: String.t(),
          object: :"eval.run.output_item",
          results: list(ExOpenAI.Components.EvalRunOutputItemResult.t()),
          run_id: String.t(),
          sample: %{
            required(:error) => ExOpenAI.Components.EvalApiError.t(),
            required(:finish_reason) => String.t(),
            required(:input) =>
              list(%{required(:content) => String.t(), required(:role) => String.t()}),
            required(:max_completion_tokens) => integer(),
            required(:model) => String.t(),
            required(:output) =>
              list(%{optional(:content) => String.t(), optional(:role) => String.t()}),
            required(:seed) => integer(),
            required(:temperature) => number(),
            required(:top_p) => number(),
            required(:usage) => %{
              required(:cached_tokens) => integer(),
              required(:completion_tokens) => integer(),
              required(:prompt_tokens) => integer(),
              required(:total_tokens) => integer()
            }
          },
          status: String.t()
        }
  defstruct [
    :created_at,
    :datasource_item,
    :datasource_item_id,
    :eval_id,
    :id,
    :object,
    :results,
    :run_id,
    :sample,
    :status
  ]
end
