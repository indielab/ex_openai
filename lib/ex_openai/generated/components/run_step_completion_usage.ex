defmodule ExOpenAI.Components.RunStepCompletionUsage do
  @moduledoc """
  Module for representing the OpenAI schema RunStepCompletionUsage.

  ## Type

  `%{ required(:completion_tokens) => integer(), required(:prompt_tokens) => integer(), required(:total_tokens) => integer() } | nil`
  """
  @type t() ::
          %{
            required(:completion_tokens) => integer(),
            required(:prompt_tokens) => integer(),
            required(:total_tokens) => integer()
          }
          | nil
  @type input() ::
          %{
            required(:completion_tokens) => integer(),
            required(:prompt_tokens) => integer(),
            required(:total_tokens) => integer()
          }
          | nil
end
