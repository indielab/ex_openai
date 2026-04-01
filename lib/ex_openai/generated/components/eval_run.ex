defmodule ExOpenAI.Components.EvalRun do
  use ExOpenAI.Jason

  @moduledoc """
  A schema representing an evaluation run.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the evaluation run was created.

  * `:data_source` - **required** - `map()`  
    Information about the run's data source.

  * `:error` - **required** - `ExOpenAI.Components.EvalApiError.t()`

  * `:eval_id` - **required** - `String.t()`  
    The identifier of the associated evaluation.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the evaluation run.

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **required** - `String.t()`  
    The model that is evaluated, if applicable.

  * `:name` - **required** - `String.t()`  
    The name of the evaluation run.

  * `:object` - **required** - `:"eval.run"`  
    The type of the object. Always "eval.run".  
    Allowed values: `"eval.run"`  
    Default: `"eval.run"`

  * `:per_model_usage` - **required** - `[{:%{}, [], [{{:required, [], [:cached_tokens]}, {:integer, [], []}}, {{:required, [], [:completion_tokens]}, {:integer, [], []}}, {{:required, [], [:invocation_count]}, {:integer, [], []}}, {{:required, [], [:model_name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:prompt_tokens]}, {:integer, [], []}}, {{:required, [], [:total_tokens]}, {:integer, [], []}}]}]`  
    Usage statistics for each model during the evaluation run.

  * `:per_testing_criteria_results` - **required** - `[{:%{}, [], [{{:required, [], [:failed]}, {:integer, [], []}}, {{:required, [], [:passed]}, {:integer, [], []}}, {{:required, [], [:testing_criteria]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    Results per testing criteria applied during the evaluation run.

  * `:report_url` - **required** - `String.t()`  
    The URL to the rendered evaluation run report on the UI dashboard.

  * `:result_counts` - **required** - `{:%{}, [], [{{:required, [], [:errored]}, {:integer, [], []}}, {{:required, [], [:failed]}, {:integer, [], []}}, {{:required, [], [:passed]}, {:integer, [], []}}, {{:required, [], [:total]}, {:integer, [], []}}]}`  
    Counters summarizing the outcomes of the evaluation run.

  * `:status` - **required** - `String.t()`  
    The status of the evaluation run.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data_source: map(),
          error: ExOpenAI.Components.EvalApiError.t(),
          eval_id: String.t(),
          id: String.t(),
          metadata: ExOpenAI.Components.Metadata.t(),
          model: String.t(),
          name: String.t(),
          object: :"eval.run",
          per_model_usage:
            list(%{
              required(:cached_tokens) => integer(),
              required(:completion_tokens) => integer(),
              required(:invocation_count) => integer(),
              required(:model_name) => String.t(),
              required(:prompt_tokens) => integer(),
              required(:total_tokens) => integer()
            }),
          per_testing_criteria_results:
            list(%{
              required(:failed) => integer(),
              required(:passed) => integer(),
              required(:testing_criteria) => String.t()
            }),
          report_url: String.t(),
          result_counts: %{
            required(:errored) => integer(),
            required(:failed) => integer(),
            required(:passed) => integer(),
            required(:total) => integer()
          },
          status: String.t()
        }
  defstruct [
    :created_at,
    :data_source,
    :error,
    :eval_id,
    :id,
    :metadata,
    :model,
    :name,
    :object,
    :per_model_usage,
    :per_testing_criteria_results,
    :report_url,
    :result_counts,
    :status
  ]
end
