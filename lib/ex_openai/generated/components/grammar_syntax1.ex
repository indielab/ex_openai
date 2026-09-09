defmodule ExOpenAI.Components.GrammarSyntax1 do
  @moduledoc """
  Module for representing the OpenAI schema GrammarSyntax1.

  ## Type

  `:lark | :regex`

  ## Allowed Values

  `"lark"`, `"regex"`
  """
  @type t() :: :lark | :regex
  @type input() :: (:lark | :regex) | String.t()
end
