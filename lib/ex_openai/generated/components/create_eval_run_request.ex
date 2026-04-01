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
  defstruct [:data_source, :metadata, :name]
end
