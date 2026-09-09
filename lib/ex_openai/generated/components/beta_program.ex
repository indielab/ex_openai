defmodule ExOpenAI.Components.BetaProgram do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaProgram.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t()`
    The stable call ID of the program item.

  * `:code` - **required** - `String.t()`
    The JavaScript source executed by programmatic tool calling.

  * `:fingerprint` - **required** - `String.t()`
    Opaque program replay fingerprint that must be round-tripped.

  * `:id` - **required** - `String.t()`
    The unique ID of the program item.

  * `:type` - **required** - `:program`
    The type of the item. Always `program`.
    Allowed values: `"program"`
    Default: `"program"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
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
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:call_id) => String.t(),
              required(:code) => String.t(),
              required(:fingerprint) => String.t(),
              required(:id) => String.t(),
              required(:type) => :program | String.t()
            }
  defstruct [:agent, :call_id, :code, :fingerprint, :id, :type]
end
