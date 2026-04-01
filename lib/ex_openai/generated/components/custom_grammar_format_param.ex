defmodule ExOpenAI.Components.CustomGrammarFormatParam do
  use ExOpenAI.Jason

  @moduledoc """
  A grammar defined by the user.

  ## Fields

  * `:definition` - **required** - `String.t()`  
    The grammar definition.

  * `:syntax` - **required** - `ExOpenAI.Components.GrammarSyntax1.t()`  
    The syntax of the grammar definition. One of `lark` or `regex`.

  * `:type` - **required** - `:grammar`  
    Grammar format. Always `grammar`.  
    Allowed values: `"grammar"`  
    Default: `"grammar"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          definition: String.t(),
          syntax: ExOpenAI.Components.GrammarSyntax1.t(),
          type: :grammar
        }
  defstruct [:definition, :syntax, :type]
end
