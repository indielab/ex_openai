defmodule ExOpenAI.Components.MessageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).

  ## Fields

  * `:assistant_id` - **required** - `String.t() | nil`

  * `:attachments` - **required** - `list(%{ optional(:file_id) => String.t(), optional(:tools) => list( ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.t() ) }) | nil`

  * `:completed_at` - **required** - `integer() | nil`

  * `:content` - **required** - `list( ExOpenAI.Components.MessageContentImageFileObject.t() | ExOpenAI.Components.MessageContentImageUrlObject.t() | ExOpenAI.Components.MessageContentTextObject.t() | ExOpenAI.Components.MessageContentRefusalObject.t() )`
    The content of the message in array of text and/or images.

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the message was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:incomplete_at` - **required** - `integer() | nil`

  * `:incomplete_details` - **required** - `%{ required(:reason) => :content_filter | :max_tokens | :run_cancelled | :run_expired | :run_failed } | nil`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:object` - **required** - `:"thread.message"`
    The object type, which is always `thread.message`.
    Allowed values: `"thread.message"`

  * `:role` - **required** - `:user | :assistant`
    The entity that produced the message. One of `user` or `assistant`.
    Allowed values: `"user"`, `"assistant"`

  * `:run_id` - **required** - `String.t() | nil`

  * `:status` - **required** - `:in_progress | :incomplete | :completed`
    The status of the message, which can be either `in_progress`, `incomplete`, or `completed`.
    Allowed values: `"in_progress"`, `"incomplete"`, `"completed"`

  * `:thread_id` - **required** - `String.t()`
    The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assistant_id: String.t() | nil,
          attachments:
            list(%{
              optional(:file_id) => String.t(),
              optional(:tools) =>
                list(
                  ExOpenAI.Components.AssistantToolsCode.t()
                  | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.t()
                )
            })
            | nil,
          completed_at: integer() | nil,
          content:
            list(
              ((ExOpenAI.Components.MessageContentImageFileObject.t()
                | ExOpenAI.Components.MessageContentImageUrlObject.t())
               | ExOpenAI.Components.MessageContentTextObject.t())
              | ExOpenAI.Components.MessageContentRefusalObject.t()
            ),
          created_at: integer(),
          id: String.t(),
          incomplete_at: integer() | nil,
          incomplete_details:
            %{
              required(:reason) =>
                (((:content_filter | :max_tokens) | :run_cancelled) | :run_expired) | :run_failed
            }
            | nil,
          metadata: ExOpenAI.Components.Metadata.t(),
          object: :"thread.message",
          role: :user | :assistant,
          run_id: String.t() | nil,
          status: (:in_progress | :incomplete) | :completed,
          thread_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:assistant_id) => String.t() | nil,
              required(:attachments) =>
                list(%{
                  optional(:file_id) => String.t(),
                  optional(:tools) =>
                    list(
                      ExOpenAI.Components.AssistantToolsCode.input()
                      | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.input()
                    )
                })
                | nil,
              required(:completed_at) => integer() | nil,
              required(:content) =>
                list(
                  ((ExOpenAI.Components.MessageContentImageFileObject.input()
                    | ExOpenAI.Components.MessageContentImageUrlObject.input())
                   | ExOpenAI.Components.MessageContentTextObject.input())
                  | ExOpenAI.Components.MessageContentRefusalObject.input()
                ),
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:incomplete_at) => integer() | nil,
              required(:incomplete_details) =>
                %{
                  required(:reason) =>
                    ((((:content_filter | :max_tokens) | :run_cancelled) | :run_expired)
                     | :run_failed)
                    | String.t()
                }
                | nil,
              required(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:object) => :"thread.message" | String.t(),
              required(:role) => (:user | :assistant) | String.t(),
              required(:run_id) => String.t() | nil,
              required(:status) => ((:in_progress | :incomplete) | :completed) | String.t(),
              required(:thread_id) => String.t()
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
