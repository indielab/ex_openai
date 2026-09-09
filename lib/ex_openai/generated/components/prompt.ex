defmodule ExOpenAI.Components.Prompt do
  @moduledoc """
  Module for representing the OpenAI schema Prompt.

  ## Type

  `%{ required(:id) => String.t(), optional(:variables) => ExOpenAI.Components.ResponsePromptVariables.t(), optional(:version) => String.t() | nil } | nil`
  """
  @type t() ::
          %{
            required(:id) => String.t(),
            optional(:variables) => ExOpenAI.Components.ResponsePromptVariables.t(),
            optional(:version) => String.t() | nil
          }
          | nil
  @type input() ::
          %{
            required(:id) => String.t(),
            optional(:variables) => ExOpenAI.Components.ResponsePromptVariables.input(),
            optional(:version) => String.t() | nil
          }
          | nil
end
