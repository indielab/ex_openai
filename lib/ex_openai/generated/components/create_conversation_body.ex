defmodule ExOpenAI.Components.CreateConversationBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateConversationBody.

  ## Fields

  * `:items` - **optional** - `[ExOpenAI.Components.InputItem.t()] | any()`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          items: (list(ExOpenAI.Components.InputItem.t()) | any()) | nil,
          metadata: (ExOpenAI.Components.Metadata.t() | any()) | nil
        }
  defstruct [:items, :metadata]
end
