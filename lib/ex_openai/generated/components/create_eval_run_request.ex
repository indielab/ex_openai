defmodule ExOpenAI.Components.CreateEvalRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateEvalRunRequest.

  ## Fields

  * `:data_source` - **required** - `map()`
    Details about the run's data source.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **optional** - `String.t()`
    The name of the run.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data_source: map(),
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          name: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data_source) =>
                (ExOpenAI.Components.CreateEvalJsonlRunDataSource.input()
                 | ExOpenAI.Components.CreateEvalCompletionsRunDataSource.input())
                | ExOpenAI.Components.CreateEvalResponsesRunDataSource.input(),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:name) => String.t()
            }
  defstruct [:data_source, :metadata, :name]
end
