defmodule ExOpenAI.Components.ResponseError do
  @moduledoc """
  Module for representing the OpenAI schema ResponseError.

  ## Type

  `%{required(:code) => ExOpenAI.Components.ResponseErrorCode.t(), required(:message) => String.t()} | nil`
  """
  @type t() ::
          %{
            required(:code) => ExOpenAI.Components.ResponseErrorCode.t(),
            required(:message) => String.t()
          }
          | nil
  @type input() ::
          %{
            required(:code) => ExOpenAI.Components.ResponseErrorCode.input(),
            required(:message) => String.t()
          }
          | nil
end
