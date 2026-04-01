defmodule ExOpenAI.Components.GrammarSyntax1 do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema GrammarSyntax1.

  ## Type

  `:lark | :regex`

  ## Allowed Values

  `"lark"`, `"regex"`
  """
  @type t() :: :lark | :regex
end
