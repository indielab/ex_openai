defmodule ExOpenAI.Components.InferenceOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Model and tool overrides applied when generating the assistant response.

  ## Fields

  * `:model` - **required** - `String.t() | any()`

  * `:tool_choice` - **required** - `ExOpenAI.Components.ToolChoice.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          model: String.t() | any(),
          tool_choice: ExOpenAI.Components.ToolChoice.t() | any()
        }
  defstruct [:model, :tool_choice]
end
