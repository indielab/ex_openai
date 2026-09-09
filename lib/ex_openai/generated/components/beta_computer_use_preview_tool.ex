defmodule ExOpenAI.Components.BetaComputerUsePreviewTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).

  ## Fields

  * `:display_height` - **required** - `integer()`
    The height of the computer display.

  * `:display_width` - **required** - `integer()`
    The width of the computer display.

  * `:environment` - **required** - `ExOpenAI.Components.BetaComputerEnvironment.t()`
    The type of computer environment to control.

  * `:type` - **required** - `:computer_use_preview`
    The type of the computer use tool. Always `computer_use_preview`.
    Allowed values: `"computer_use_preview"`
    Default: `"computer_use_preview"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          display_height: integer(),
          display_width: integer(),
          environment: ExOpenAI.Components.BetaComputerEnvironment.t(),
          type: :computer_use_preview
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:display_height) => integer(),
              required(:display_width) => integer(),
              required(:environment) => ExOpenAI.Components.BetaComputerEnvironment.input(),
              required(:type) => :computer_use_preview | String.t()
            }
  defstruct [:display_height, :display_width, :environment, :type]
end
