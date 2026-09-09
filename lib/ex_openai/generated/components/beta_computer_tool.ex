defmodule ExOpenAI.Components.BetaComputerTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).

  ## Fields

  * `:type` - **required** - `:computer`
    The type of the computer tool. Always `computer`.
    Allowed values: `"computer"`
    Default: `"computer"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :computer}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :computer | String.t()}
  defstruct [:type]
end
