defmodule ExOpenAI.Components.SubmitToolOutputsRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SubmitToolOutputsRunRequest.

  ## Fields

  * `:stream` - **optional** - `boolean() | nil`

  * `:tool_outputs` - **required** - `list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()})`
    A list of tools for which the outputs are being submitted.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          stream: (boolean() | nil) | nil,
          tool_outputs:
            list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()})
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:stream) => boolean() | nil,
              required(:tool_outputs) =>
                list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()})
            }
  defstruct [:stream, :tool_outputs]
end
