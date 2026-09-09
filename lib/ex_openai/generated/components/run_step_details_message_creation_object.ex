defmodule ExOpenAI.Components.RunStepDetailsMessageCreationObject do
  use ExOpenAI.Jason

  @moduledoc """
  Details of the message creation by the run step.

  ## Fields

  * `:message_creation` - **required** - `%{required(:message_id) => String.t()}`

  * `:type` - **required** - `:message_creation`
    Always `message_creation`.
    Allowed values: `"message_creation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          message_creation: %{required(:message_id) => String.t()},
          type: :message_creation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:message_creation) => %{required(:message_id) => String.t()},
              required(:type) => :message_creation | String.t()
            }
  defstruct [:message_creation, :type]
end
