defmodule ExOpenAI.Components.BetaSpecificProgrammaticToolCallingParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaSpecificProgrammaticToolCallingParam.

  ## Fields

  * `:type` - **required** - `:programmatic_tool_calling`
    The tool to call. Always `programmatic_tool_calling`.
    Allowed values: `"programmatic_tool_calling"`
    Default: `"programmatic_tool_calling"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :programmatic_tool_calling}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :programmatic_tool_calling | String.t()}
  defstruct [:type]
end
