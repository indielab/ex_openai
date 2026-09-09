defmodule ExOpenAI.Components.ClientToolCallItem do
  use ExOpenAI.Jason

  @moduledoc """
  Record of a client side tool invocation initiated by the assistant.

  ## Fields

  * `:arguments` - **required** - `String.t()`
    JSON-encoded arguments that were sent to the tool.

  * `:call_id` - **required** - `String.t()`
    Identifier for the client tool call.

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the item was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier of the thread item.

  * `:name` - **required** - `String.t()`
    Tool name that was invoked.

  * `:object` - **required** - `:"chatkit.thread_item"`
    Type discriminator that is always `chatkit.thread_item`.
    Allowed values: `"chatkit.thread_item"`
    Default: `"chatkit.thread_item"`

  * `:output` - **required** - `String.t() | nil`

  * `:status` - **required** - `ExOpenAI.Components.ClientToolCallStatus.t()`
    Execution status for the tool call.

  * `:thread_id` - **required** - `String.t()`
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.client_tool_call"`
    Type discriminator that is always `chatkit.client_tool_call`.
    Allowed values: `"chatkit.client_tool_call"`
    Default: `"chatkit.client_tool_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t(),
          call_id: String.t(),
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"chatkit.thread_item",
          output: String.t() | nil,
          status: ExOpenAI.Components.ClientToolCallStatus.t(),
          thread_id: String.t(),
          type: :"chatkit.client_tool_call"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:arguments) => String.t(),
              required(:call_id) => String.t(),
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :"chatkit.thread_item" | String.t(),
              required(:output) => String.t() | nil,
              required(:status) => ExOpenAI.Components.ClientToolCallStatus.input(),
              required(:thread_id) => String.t(),
              required(:type) => :"chatkit.client_tool_call" | String.t()
            }
  defstruct [
    :arguments,
    :call_id,
    :created_at,
    :id,
    :name,
    :object,
    :output,
    :status,
    :thread_id,
    :type
  ]
end
