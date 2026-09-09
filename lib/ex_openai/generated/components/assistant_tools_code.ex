defmodule ExOpenAI.Components.AssistantToolsCode do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AssistantToolsCode.

  ## Fields

  * `:type` - **required** - `:code_interpreter`
    The type of tool being defined: `code_interpreter`
    Allowed values: `"code_interpreter"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :code_interpreter}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :code_interpreter | String.t()}
  defstruct [:type]
end
