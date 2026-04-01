defmodule ExOpenAI.Components.RunStepCompletionUsage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepCompletionUsage.

  ## Type

  `{:%{}, [], [{{:required, [], [:completion_tokens]}, {:integer, [], []}}, {{:required, [], [:prompt_tokens]}, {:integer, [], []}}, {{:required, [], [:total_tokens]}, {:integer, [], []}}]} | any()`
  """
  @type t() ::
          %{
            required(:completion_tokens) => integer(),
            required(:prompt_tokens) => integer(),
            required(:total_tokens) => integer()
          }
          | any()
end
