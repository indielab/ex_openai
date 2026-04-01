defmodule ExOpenAI.Components.ChatCompletionStreamOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionStreamOptions.

  ## Type

  `{:%{}, [], [{{:optional, [], [:include_obfuscation]}, {:boolean, [], []}}, {{:optional, [], [:include_usage]}, {:boolean, [], []}}]} | any()`
  """
  @type t() ::
          %{optional(:include_obfuscation) => boolean(), optional(:include_usage) => boolean()}
          | any()
end
