defmodule ExOpenAI.Components.ChatCompletionStreamOptions do
  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionStreamOptions.

  ## Type

  `%{optional(:include_obfuscation) => boolean(), optional(:include_usage) => boolean()} | nil`
  """
  @type t() ::
          %{optional(:include_obfuscation) => boolean(), optional(:include_usage) => boolean()}
          | nil
  @type input() ::
          %{optional(:include_obfuscation) => boolean(), optional(:include_usage) => boolean()}
          | nil
end
