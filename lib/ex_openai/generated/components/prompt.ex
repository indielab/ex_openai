defmodule ExOpenAI.Components.Prompt do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Prompt.

  ## Type

  `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:variables]}, {{:., [], [ExOpenAI.Components.ResponsePromptVariables, :t]}, [], []}}, {{:optional, [], [:version]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}]} | any()`
  """
  @type t() ::
          %{
            required(:id) => String.t(),
            optional(:variables) => ExOpenAI.Components.ResponsePromptVariables.t(),
            optional(:version) => String.t() | any()
          }
          | any()
end
