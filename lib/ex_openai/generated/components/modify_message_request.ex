defmodule ExOpenAI.Components.ModifyMessageRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyMessageRequest.

  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`
  """
  @type t() :: %{__struct__: __MODULE__, metadata: ExOpenAI.Components.Metadata.t() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:metadata) => ExOpenAI.Components.Metadata.input()}
  defstruct [:metadata]
end
