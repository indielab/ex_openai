defmodule ExOpenAI.Components.BetaProgramItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaProgramItemParam.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:call_id` - **required** - `String.t()`
    The stable call ID of the program item.
    Constraints: minLength: 1, maxLength: 64

  * `:code` - **required** - `String.t()`
    The JavaScript source executed by programmatic tool calling.
    Constraints: maxLength: 10485760

  * `:fingerprint` - **required** - `String.t()`
    Opaque program replay fingerprint that must be round-tripped.
    Constraints: maxLength: 10485760

  * `:id` - **required** - `String.t()`
    The unique ID of this program item.

  * `:type` - **required** - `:program`
    The item type. Always `program`.
    Allowed values: `"program"`
    Default: `"program"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          call_id: String.t(),
          code: String.t(),
          fingerprint: String.t(),
          id: String.t(),
          type: :program
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:call_id) => String.t(),
              required(:code) => String.t(),
              required(:fingerprint) => String.t(),
              required(:id) => String.t(),
              required(:type) => :program | String.t()
            }
  defstruct [:agent, :call_id, :code, :fingerprint, :id, :type]
end
