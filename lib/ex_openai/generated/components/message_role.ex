defmodule ExOpenAI.Components.MessageRole do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema MessageRole.

  ## Type

  `:unknown | :user | :assistant | :system | :critic | :discriminator | :developer | :tool`

  ## Allowed Values

  `"unknown"`, `"user"`, `"assistant"`, `"system"`, `"critic"`, `"discriminator"`, `"developer"`, `"tool"`
  """
  @type t() ::
          ((((((:unknown | :user) | :assistant) | :system) | :critic) | :discriminator)
           | :developer)
          | :tool
end
