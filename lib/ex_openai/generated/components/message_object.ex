defmodule ExOpenAI.Components.MessageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a message within a [thread](/docs/api-reference/threads).

  ## Fields

  * `:assistant_id` - **required** - `String.t() | any()`

  * `:attachments` - **required** - `[{:%{}, [], [{{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:tools]}, {:list, [], [{:|, [], [{{:., [], [ExOpenAI.Components.AssistantToolsCode, :t]}, [], []}, {{:., [], [ExOpenAI.Components.AssistantToolsFileSearchTypeOnly, :t]}, [], []}]}]}}]}] | any()`

  * `:completed_at` - **required** - `integer() | any()`

  * `:content` - **required** - `[ExOpenAI.Components.MessageContentImageFileObject.t() | ExOpenAI.Components.MessageContentImageUrlObject.t() | ExOpenAI.Components.MessageContentTextObject.t() | ExOpenAI.Components.MessageContentRefusalObject.t()]`  
    The content of the message in array of text and/or images.

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the message was created.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints.

  * `:incomplete_at` - **required** - `integer() | any()`

  * `:incomplete_details` - **required** - `{:%{}, [], [{{:required, [], [:reason]}, {:|, [], [{:|, [], [{:|, [], [{:|, [], [:content_filter, :max_tokens]}, :run_cancelled]}, :run_expired]}, :run_failed]}}]} | any()`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:object` - **required** - `:"thread.message"`  
    The object type, which is always `thread.message`.  
    Allowed values: `"thread.message"`

  * `:role` - **required** - `:user | :assistant`  
    The entity that produced the message. One of `user` or `assistant`.  
    Allowed values: `"user"`, `"assistant"`

  * `:run_id` - **required** - `String.t() | any()`

  * `:status` - **required** - `:in_progress | :incomplete | :completed`  
    The status of the message, which can be either `in_progress`, `incomplete`, or `completed`.  
    Allowed values: `"in_progress"`, `"incomplete"`, `"completed"`

  * `:thread_id` - **required** - `String.t()`  
    The [thread](/docs/api-reference/threads) ID that this message belongs to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assistant_id: String.t() | any(),
          attachments:
            list(%{
              optional(:file_id) => String.t(),
              optional(:tools) =>
                list(
                  ExOpenAI.Components.AssistantToolsCode.t()
                  | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.t()
                )
            })
            | any(),
          completed_at: integer() | any(),
          content:
            list(
              ((ExOpenAI.Components.MessageContentImageFileObject.t()
                | ExOpenAI.Components.MessageContentImageUrlObject.t())
               | ExOpenAI.Components.MessageContentTextObject.t())
              | ExOpenAI.Components.MessageContentRefusalObject.t()
            ),
          created_at: integer(),
          id: String.t(),
          incomplete_at: integer() | any(),
          incomplete_details:
            %{
              required(:reason) =>
                (((:content_filter | :max_tokens) | :run_cancelled) | :run_expired) | :run_failed
            }
            | any(),
          metadata: ExOpenAI.Components.Metadata.t(),
          object: :"thread.message",
          role: :user | :assistant,
          run_id: String.t() | any(),
          status: (:in_progress | :incomplete) | :completed,
          thread_id: String.t()
        }
  defstruct [
    :assistant_id,
    :attachments,
    :completed_at,
    :content,
    :created_at,
    :id,
    :incomplete_at,
    :incomplete_details,
    :metadata,
    :object,
    :role,
    :run_id,
    :status,
    :thread_id
  ]
end
