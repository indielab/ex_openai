defmodule ExOpenAI.Components.UserMessageItem do
  use ExOpenAI.Jason

  @moduledoc """
  User-authored messages within a thread.

  ## Fields

  * `:attachments` - **required** - `list(ExOpenAI.Components.Attachment.t())`
    Attachments associated with the user message. Defaults to an empty list.

  * `:content` - **required** - `list(ExOpenAI.Components.UserMessageInputText.t() | ExOpenAI.Components.UserMessageQuotedText.t())`
    Ordered content elements supplied by the user.

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the item was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier of the thread item.

  * `:inference_options` - **required** - `ExOpenAI.Components.InferenceOptions.t() | nil`

  * `:object` - **required** - `:"chatkit.thread_item"`
    Type discriminator that is always `chatkit.thread_item`.
    Allowed values: `"chatkit.thread_item"`
    Default: `"chatkit.thread_item"`

  * `:thread_id` - **required** - `String.t()`
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.user_message"`
    Allowed values: `"chatkit.user_message"`
    Default: `"chatkit.user_message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attachments: list(ExOpenAI.Components.Attachment.t()),
          content:
            list(
              ExOpenAI.Components.UserMessageInputText.t()
              | ExOpenAI.Components.UserMessageQuotedText.t()
            ),
          created_at: integer(),
          id: String.t(),
          inference_options: ExOpenAI.Components.InferenceOptions.t() | nil,
          object: :"chatkit.thread_item",
          thread_id: String.t(),
          type: :"chatkit.user_message"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:attachments) => list(ExOpenAI.Components.Attachment.input()),
              required(:content) =>
                list(
                  ExOpenAI.Components.UserMessageInputText.input()
                  | ExOpenAI.Components.UserMessageQuotedText.input()
                ),
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:inference_options) => ExOpenAI.Components.InferenceOptions.input() | nil,
              required(:object) => :"chatkit.thread_item" | String.t(),
              required(:thread_id) => String.t(),
              required(:type) => :"chatkit.user_message" | String.t()
            }
  defstruct [
    :attachments,
    :content,
    :created_at,
    :id,
    :inference_options,
    :object,
    :thread_id,
    :type
  ]
end
