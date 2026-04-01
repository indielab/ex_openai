defmodule ExOpenAI.Components.ThreadObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a thread that contains [messages](/docs/api-reference/messages).

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the thread was created.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints.

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:object` - **required** - `:thread`  
    The object type, which is always `thread`.  
    Allowed values: `"thread"`

  * `:tool_resources` - **required** - `{:%{}, [], [{{:optional, [], [:code_interpreter]}, {:%{}, [], [{{:optional, [], [:file_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}, {{:optional, [], [:file_search]}, {:%{}, [], [{{:optional, [], [:vector_store_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}]} | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          metadata: ExOpenAI.Components.Metadata.t(),
          object: :thread,
          tool_resources:
            %{
              optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
              optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
            }
            | any()
        }
  defstruct [:created_at, :id, :metadata, :object, :tool_resources]
end
