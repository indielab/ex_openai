defmodule ExOpenAI.Components.ResponseError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ResponseError.

  ## Type

  `{:%{}, [], [{{:required, [], [:code]}, {{:., [], [ExOpenAI.Components.ResponseErrorCode, :t]}, [], []}}, {{:required, [], [:message]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`
  """
  @type t() ::
          %{
            required(:code) => ExOpenAI.Components.ResponseErrorCode.t(),
            required(:message) => String.t()
          }
          | any()
end
