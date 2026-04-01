defmodule ExOpenAI.Components.RunStepDeltaStepDetailsMessageCreationObject do
  use ExOpenAI.Jason

  @moduledoc """
  Details of the message creation by the run step.

  ## Fields

  * `:message_creation` - **optional** - `{:%{}, [], [{{:optional, [], [:message_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:message_creation`  
    Always `message_creation`.  
    Allowed values: `"message_creation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          message_creation: %{optional(:message_id) => String.t()} | nil,
          type: :message_creation
        }
  defstruct [:message_creation, :type]
end
