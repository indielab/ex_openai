defmodule ExOpenAI.Components.BetaPrompt do
  @moduledoc """
  Module for representing the OpenAI schema BetaPrompt.

  ## Type

  `%{ required(:id) => String.t(), optional(:variables) => ExOpenAI.Components.BetaResponsePromptVariables.t(), optional(:version) => String.t() | nil } | nil`
  """
  @type t() ::
          %{
            required(:id) => String.t(),
            optional(:variables) => ExOpenAI.Components.BetaResponsePromptVariables.t(),
            optional(:version) => String.t() | nil
          }
          | nil
  @type input() ::
          %{
            required(:id) => String.t(),
            optional(:variables) => ExOpenAI.Components.BetaResponsePromptVariables.input(),
            optional(:version) => String.t() | nil
          }
          | nil
end
