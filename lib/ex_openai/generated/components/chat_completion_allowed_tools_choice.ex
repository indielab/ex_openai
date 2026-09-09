defmodule ExOpenAI.Components.ChatCompletionAllowedToolsChoice do
  use ExOpenAI.Jason

  @moduledoc """
  Constrains the tools available to the model to a pre-defined set.


  ## Fields

  * `:allowed_tools` - **required** - `ExOpenAI.Components.ChatCompletionAllowedTools.t()`

  * `:type` - **required** - `:allowed_tools`
    Allowed tool configuration type. Always `allowed_tools`.
    Allowed values: `"allowed_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_tools: ExOpenAI.Components.ChatCompletionAllowedTools.t(),
          type: :allowed_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:allowed_tools) => ExOpenAI.Components.ChatCompletionAllowedTools.input(),
              required(:type) => :allowed_tools | String.t()
            }
  defstruct [:allowed_tools, :type]
end
