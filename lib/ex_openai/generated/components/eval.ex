defmodule ExOpenAI.Components.Eval do
  use ExOpenAI.Jason

  @moduledoc """
  An Eval object with a data source config and testing criteria.
  An Eval represents a task to be done for your LLM integration.
  Like:
   - Improve the quality of my chatbot
   - See how well my chatbot handles customer support
   - Check if o4-mini is better at my usecase than gpt-4o


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the eval was created.
    Format: `unixtime`

  * `:data_source_config` - **required** - `map()`
    Configuration of data sources used in runs of the evaluation.

  * `:id` - **required** - `String.t()`
    Unique identifier for the evaluation.

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **required** - `String.t()`
    The name of the evaluation.

  * `:object` - **required** - `:eval`
    The object type.
    Allowed values: `"eval"`
    Default: `"eval"`

  * `:testing_criteria` - **required** - `list( ExOpenAI.Components.EvalGraderLabelModel.t() | ExOpenAI.Components.EvalGraderStringCheck.t() | ExOpenAI.Components.EvalGraderTextSimilarity.t() | ExOpenAI.Components.EvalGraderPython.t() | ExOpenAI.Components.EvalGraderScoreModel.t() )`
    A list of testing criteria.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data_source_config: map(),
          id: String.t(),
          metadata: ExOpenAI.Components.Metadata.t(),
          name: String.t(),
          object: :eval,
          testing_criteria:
            list(
              (((ExOpenAI.Components.EvalGraderLabelModel.t()
                 | ExOpenAI.Components.EvalGraderStringCheck.t())
                | ExOpenAI.Components.EvalGraderTextSimilarity.t())
               | ExOpenAI.Components.EvalGraderPython.t())
              | ExOpenAI.Components.EvalGraderScoreModel.t()
            )
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data_source_config) =>
                (ExOpenAI.Components.EvalCustomDataSourceConfig.input()
                 | ExOpenAI.Components.EvalLogsDataSourceConfig.input())
                | ExOpenAI.Components.EvalStoredCompletionsDataSourceConfig.input(),
              required(:id) => String.t(),
              required(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:name) => String.t(),
              required(:object) => :eval | String.t(),
              required(:testing_criteria) =>
                list(
                  (((ExOpenAI.Components.EvalGraderLabelModel.input()
                     | ExOpenAI.Components.EvalGraderStringCheck.input())
                    | ExOpenAI.Components.EvalGraderTextSimilarity.input())
                   | ExOpenAI.Components.EvalGraderPython.input())
                  | ExOpenAI.Components.EvalGraderScoreModel.input()
                )
            }
  defstruct [:created_at, :data_source_config, :id, :metadata, :name, :object, :testing_criteria]
end
