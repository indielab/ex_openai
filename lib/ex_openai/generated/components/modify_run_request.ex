defmodule ExOpenAI.Components.ModifyRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyRunRequest.

  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`
  """
  @type t() :: %{__struct__: __MODULE__, metadata: ExOpenAI.Components.Metadata.t() | nil}
  defstruct [:metadata]
end
