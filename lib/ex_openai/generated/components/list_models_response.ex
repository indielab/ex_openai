defmodule ExOpenAI.Components.ListModelsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListModelsResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.Model.t())`

  * `:object` - **required** - `:list`
    Allowed values: `"list"`
  """
  @type t() :: %{__struct__: __MODULE__, data: list(ExOpenAI.Components.Model.t()), object: :list}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.Model.input()),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :object]
end
