defmodule ExOpenAI.Components.CreateFineTuningCheckpointPermissionRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateFineTuningCheckpointPermissionRequest.

  ## Fields

  * `:project_ids` - **required** - `[String.t()]`  
    The project identifiers to grant access to.
  """
  @type t() :: %{__struct__: __MODULE__, project_ids: list(String.t())}
  defstruct [:project_ids]
end
