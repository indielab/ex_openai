defmodule ExOpenAI.Components.SubmitToolOutputsRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SubmitToolOutputsRunRequest.

  ## Fields

  * `:stream` - **optional** - `boolean() | any()`

  * `:tool_outputs` - **required** - `[{:%{}, [], [{{:optional, [], [:output]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:tool_call_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    A list of tools for which the outputs are being submitted.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          stream: (boolean() | any()) | nil,
          tool_outputs:
            list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()})
        }
  defstruct [:stream, :tool_outputs]
end
