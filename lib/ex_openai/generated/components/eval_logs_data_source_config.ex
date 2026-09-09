defmodule ExOpenAI.Components.EvalLogsDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  A LogsDataSourceConfig which specifies the metadata property of your logs query.
  This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
  The schema returned by this data source config is used to defined what variables are available in your evals.
  `item` and `sample` are both defined when using this data source config.


  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:schema` - **required** - `map()`
    The json schema for the run data source items.
  Learn how to build JSON schemas [here](https://json-schema.org/).

  * `:type` - **required** - `:logs`
    The type of data source. Always `logs`.
    Allowed values: `"logs"`
    Default: `"logs"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          schema: map(),
          type: :logs
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:schema) => map(),
              required(:type) => :logs | String.t()
            }
  defstruct [:metadata, :schema, :type]
end
