defmodule ExOpenAI.Components.ListModelsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListModelsResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.Model.t()]`

  * `:object` - **required** - `:list`  
    Allowed values: `"list"`
  """
  @type t() :: %{__struct__: __MODULE__, data: list(ExOpenAI.Components.Model.t()), object: :list}
  defstruct [:data, :object]
end
