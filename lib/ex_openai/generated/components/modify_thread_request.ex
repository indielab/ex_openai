defmodule ExOpenAI.Components.ModifyThreadRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyThreadRequest.

  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          tool_resources:
            (%{
               optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
               optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
             }
             | nil)
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:tool_resources) =>
                %{
                  optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                  optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
                }
                | nil
            }
  defstruct [:metadata, :tool_resources]
end
