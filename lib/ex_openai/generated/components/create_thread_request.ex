defmodule ExOpenAI.Components.CreateThreadRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Options to create a new thread. If no thread is provided when running a
  request, an empty thread will be created.


  ## Fields

  * `:messages` - **optional** - `list(ExOpenAI.Components.CreateMessageRequest.t())`
    A list of [messages](https://platform.openai.com/docs/api-reference/messages) to start the thread with.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{ optional(:vector_store_ids) => list(String.t()), optional(:vector_stores) => list(%{ optional(:chunking_strategy) => map(), optional(:file_ids) => list(String.t()), optional(:metadata) => ExOpenAI.Components.Metadata.t() }) } } | nil`
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
             | nil)
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:messages) => list(ExOpenAI.Components.CreateMessageRequest.input()),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:tool_resources) =>
                %{
                  optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                  optional(:file_search) => %{
                    optional(:vector_store_ids) => list(String.t()),
                    optional(:vector_stores) =>
                      list(%{
                        optional(:chunking_strategy) =>
                          %{required(:type) => :auto | String.t()}
                          | %{
                              required(:static) => %{
                                required(:chunk_overlap_tokens) => integer(),
                                required(:max_chunk_size_tokens) => integer()
                              },
                              required(:type) => :static | String.t()
                            },
                        optional(:file_ids) => list(String.t()),
                        optional(:metadata) => ExOpenAI.Components.Metadata.input()
                      })
                  }
                }
                | nil
            }
  defstruct [:messages, :metadata, :tool_resources]
end
