defmodule ExOpenAI.Components.AssistantMessageItem do
  use ExOpenAI.Jason

  @moduledoc """
  Assistant-authored message within a thread.

  ## Fields

  * `:content` - **required** - `list(ExOpenAI.Components.ResponseOutputText.t())`
    Ordered assistant response segments.

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the item was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier of the thread item.

  * `:object` - **required** - `:"chatkit.thread_item"`
    Type discriminator that is always `chatkit.thread_item`.
    Allowed values: `"chatkit.thread_item"`
    Default: `"chatkit.thread_item"`

  * `:thread_id` - **required** - `String.t()`
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.assistant_message"`
    Type discriminator that is always `chatkit.assistant_message`.
    Allowed values: `"chatkit.assistant_message"`
    Default: `"chatkit.assistant_message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: list(ExOpenAI.Components.ResponseOutputText.t()),
          created_at: integer(),
          id: String.t(),
          object: :"chatkit.thread_item",
          thread_id: String.t(),
          type: :"chatkit.assistant_message"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) => list(ExOpenAI.Components.ResponseOutputText.input()),
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"chatkit.thread_item" | String.t(),
              required(:thread_id) => String.t(),
              required(:type) => :"chatkit.assistant_message" | String.t()
            }
  defstruct [:content, :created_at, :id, :object, :thread_id, :type]
end
