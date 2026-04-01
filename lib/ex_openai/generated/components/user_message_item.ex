defmodule ExOpenAI.Components.UserMessageItem do
  use ExOpenAI.Jason

  @moduledoc """
  User-authored messages within a thread.

  ## Fields

  * `:attachments` - **required** - `[ExOpenAI.Components.Attachment.t()]`  
    Attachments associated with the user message. Defaults to an empty list.

  * `:content` - **required** - `[ExOpenAI.Components.UserMessageInputText.t() | ExOpenAI.Components.UserMessageQuotedText.t()]`  
    Ordered content elements supplied by the user.

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) for when the item was created.

  * `:id` - **required** - `String.t()`  
    Identifier of the thread item.

  * `:inference_options` - **required** - `ExOpenAI.Components.InferenceOptions.t() | any()`

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
          inference_options: ExOpenAI.Components.InferenceOptions.t() | any(),
          object: :"chatkit.thread_item",
          thread_id: String.t(),
          type: :"chatkit.user_message"
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
