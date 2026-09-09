defmodule ExOpenAI.Components.BetaProgramOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaProgramOutputItemParam.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:call_id` - **required** - `String.t()`
    The call ID of the program item.
    Constraints: minLength: 1, maxLength: 64

  * `:id` - **required** - `String.t()`
    The unique ID of this program output item.

  * `:result` - **required** - `String.t()`
    The result produced by the program item.
    Constraints: maxLength: 10485760

  * `:status` - **required** - `ExOpenAI.Components.BetaProgramOutputItemStatus.t()`
    The terminal status of the program output.

  * `:type` - **required** - `:program_output`
    The item type. Always `program_output`.
    Allowed values: `"program_output"`
    Default: `"program_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          call_id: String.t(),
          id: String.t(),
          result: String.t(),
          status: ExOpenAI.Components.BetaProgramOutputItemStatus.t(),
          type: :program_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:call_id) => String.t(),
              required(:id) => String.t(),
              required(:result) => String.t(),
              required(:status) => ExOpenAI.Components.BetaProgramOutputItemStatus.input(),
              required(:type) => :program_output | String.t()
            }
  defstruct [:agent, :call_id, :id, :result, :status, :type]
end
