defmodule ExOpenAI.Components.BetaResponseError do
  @moduledoc """
  Module for representing the OpenAI schema BetaResponseError.

  ## Type

  `%{ required(:code) => ExOpenAI.Components.BetaResponseErrorCode.t(), required(:message) => String.t() } | nil`
  """
  @type t() ::
          %{
            required(:code) => ExOpenAI.Components.BetaResponseErrorCode.t(),
            required(:message) => String.t()
          }
          | nil
  @type input() ::
          %{
            required(:code) => ExOpenAI.Components.BetaResponseErrorCode.input(),
            required(:message) => String.t()
          }
          | nil
end
