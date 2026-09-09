defmodule ExOpenAI.Components.ConversationResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ConversationResource.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The time at which the conversation was created, measured in seconds since the Unix epoch.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The unique ID of the conversation.

  * `:metadata` - **required** - `any()`
    Set of 16 key-value pairs that can be attached to an object. This can be         useful for storing additional information about the object in a structured         format, and querying for objects via API or the dashboard.
          Keys are strings with a maximum length of 64 characters. Values are strings         with a maximum length of 512 characters.

  * `:object` - **required** - `:conversation`
    The object type, which is always `conversation`.
    Allowed values: `"conversation"`
    Default: `"conversation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          metadata: any(),
          object: :conversation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:metadata) => any(),
              required(:object) => :conversation | String.t()
            }
  defstruct [:created_at, :id, :metadata, :object]
end
