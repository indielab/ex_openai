defmodule ExOpenAI.Components.InferenceOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Model and tool overrides applied when generating the assistant response.

  ## Fields

  * `:model` - **required** - `String.t() | nil`

  * `:tool_choice` - **required** - `ExOpenAI.Components.ToolChoice.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          model: String.t() | nil,
          tool_choice: ExOpenAI.Components.ToolChoice.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:model) => String.t() | nil,
              required(:tool_choice) => ExOpenAI.Components.ToolChoice.input() | nil
            }
  defstruct [:model, :tool_choice]
end
