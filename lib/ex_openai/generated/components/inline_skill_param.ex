defmodule ExOpenAI.Components.InlineSkillParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InlineSkillParam.

  ## Fields

  * `:description` - **required** - `String.t()`  
    The description of the skill.

  * `:name` - **required** - `String.t()`  
    The name of the skill.

  * `:source` - **required** - `ExOpenAI.Components.InlineSkillSourceParam.t()`  
    Inline skill payload

  * `:type` - **required** - `:inline`  
    Defines an inline skill for this request.  
    Allowed values: `"inline"`  
    Default: `"inline"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t(),
          name: String.t(),
          source: ExOpenAI.Components.InlineSkillSourceParam.t(),
          type: :inline
        }
  defstruct [:description, :name, :source, :type]
end
