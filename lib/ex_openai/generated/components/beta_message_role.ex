defmodule ExOpenAI.Components.BetaMessageRole do
  @moduledoc """
  Module for representing the OpenAI schema BetaMessageRole.

  ## Type

  `:unknown | :user | :assistant | :system | :critic | :discriminator | :developer | :tool`

  ## Allowed Values

  `"unknown"`, `"user"`, `"assistant"`, `"system"`, `"critic"`, `"discriminator"`, `"developer"`, `"tool"`
  """
  @type t() ::
          ((((((:unknown | :user) | :assistant) | :system) | :critic) | :discriminator)
           | :developer)
          | :tool
  @type input() ::
          (((((((:unknown | :user) | :assistant) | :system) | :critic) | :discriminator)
            | :developer)
           | :tool)
          | String.t()
end
