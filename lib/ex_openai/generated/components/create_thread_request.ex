defmodule ExOpenAI.Components.CreateThreadRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Options to create a new thread. If no thread is provided when running a
  request, an empty thread will be created.


  ## Fields

  * `:messages` - **optional** - `[ExOpenAI.Components.CreateMessageRequest.t()]`  
    A list of [messages](/docs/api-reference/messages) to start the thread with.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:tool_resources` - **optional** - `{:%{}, [], [{{:optional, [], [:code_interpreter]}, {:%{}, [], [{{:optional, [], [:file_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}, {{:optional, [], [:file_search]}, {:%{}, [], [{{:optional, [], [:vector_store_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}, {{:optional, [], [:vector_stores]}, {:list, [], [{:%{}, [], [{{:optional, [], [:chunking_strategy]}, {:map, [], []}}, {{:optional, [], [:file_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}, {{:optional, [], [:metadata]}, {{:., [], [ExOpenAI.Components.Metadata, :t]}, [], []}}]}]}}]}}]} | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          messages: list(ExOpenAI.Components.CreateMessageRequest.t()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          tool_resources:
            (%{
               optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
               optional(:file_search) => %{
                 optional(:vector_store_ids) => list(String.t()),
                 optional(:vector_stores) =>
                   list(%{
                     optional(:chunking_strategy) => map(),
                     optional(:file_ids) => list(String.t()),
                     optional(:metadata) => ExOpenAI.Components.Metadata.t()
                   })
               }
             }
             | any())
            | nil
        }
  defstruct [:messages, :metadata, :tool_resources]
end
