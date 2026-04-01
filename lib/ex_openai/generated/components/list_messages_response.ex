defmodule ExOpenAI.Components.ListMessagesResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListMessagesResponse.

  ## Type

  `any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.MessageObject.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: String.t()
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
