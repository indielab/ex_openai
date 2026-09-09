defmodule ExOpenAI.Components.CreateEvalJsonlRunDataSource do
  use ExOpenAI.Jason

  @moduledoc """
  A JsonlRunDataSource object with that specifies a JSONL file that matches the eval


  ## Fields

  * `:source` - **required** - `ExOpenAI.Components.EvalJsonlFileContentSource.t() | ExOpenAI.Components.EvalJsonlFileIdSource.t()`
    Determines what populates the `item` namespace in the data source.

  * `:type` - **required** - `:jsonl`
    The type of data source. Always `jsonl`.
    Allowed values: `"jsonl"`
    Default: `"jsonl"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          source:
            ExOpenAI.Components.EvalJsonlFileContentSource.t()
            | ExOpenAI.Components.EvalJsonlFileIdSource.t(),
          type: :jsonl
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:source) =>
                ExOpenAI.Components.EvalJsonlFileContentSource.input()
                | ExOpenAI.Components.EvalJsonlFileIdSource.input(),
              required(:type) => :jsonl | String.t()
            }
  defstruct [:source, :type]
end
