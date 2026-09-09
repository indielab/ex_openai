defmodule ExOpenAI.Components.BetaResponseInjectEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Injects input items into an active response over a WebSocket connection.
  The items are validated and committed atomically. Currently, the server
  accepts client-owned tool outputs that resume a waiting agent.


  ## Fields

  * `:input` - **required** - `list(ExOpenAI.Components.BetaInputItem.t())`
    Input items to inject into the active response.
    Constraints: maxItems: 16384

  * `:response_id` - **required** - `String.t()`
    The ID of the active response that should receive the input.

  * `:type` - **required** - `:"response.inject"`
    The event discriminator. Always `response.inject`.
    Allowed values: `"response.inject"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: list(ExOpenAI.Components.BetaInputItem.t()),
          response_id: String.t(),
          type: :"response.inject"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) => list(ExOpenAI.Components.BetaInputItem.input()),
              required(:response_id) => String.t(),
              required(:type) => :"response.inject" | String.t()
            }
  defstruct [:input, :response_id, :type]
end
