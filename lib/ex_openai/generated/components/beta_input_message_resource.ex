defmodule ExOpenAI.Components.BetaInputMessageResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaInputMessageResource.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:content` - **required** - `ExOpenAI.Components.BetaInputMessageContentList.t()`

  * `:id` - **required** - `String.t()`
    The unique ID of the message input.

  * `:role` - **required** - `:user | :system | :developer`
    The role of the message input. One of `user`, `system`, or `developer`.
    Allowed values: `"user"`, `"system"`, `"developer"`

  * `:status` - **optional** - `:in_progress | :completed | :incomplete`
    The status of item. One of `in_progress`, `completed`, or
  `incomplete`. Populated when items are returned via API.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:type` - **required** - `:message`
    The type of the message input. Always set to `message`.
    Allowed values: `"message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content: ExOpenAI.Components.BetaInputMessageContentList.t(),
          id: String.t(),
          role: (:user | :system) | :developer,
          status: ((:in_progress | :completed) | :incomplete) | nil,
          type: :message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content) => ExOpenAI.Components.BetaInputMessageContentList.input(),
              required(:id) => String.t(),
              required(:role) => ((:user | :system) | :developer) | String.t(),
              optional(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:type) => :message | String.t()
            }
  defstruct [:agent, :content, :id, :role, :status, :type]
end
