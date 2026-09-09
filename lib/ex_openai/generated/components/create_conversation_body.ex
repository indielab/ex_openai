defmodule ExOpenAI.Components.CreateConversationBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateConversationBody.

  ## Fields

  * `:items` - **optional** - `list(ExOpenAI.Components.InputItem.t()) | nil`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          items: (list(ExOpenAI.Components.InputItem.t()) | nil) | nil,
          metadata: (ExOpenAI.Components.Metadata.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:items) => list(ExOpenAI.Components.InputItem.input()) | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input() | nil
            }
  defstruct [:items, :metadata]
end
