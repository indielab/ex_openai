defmodule ExOpenAI.Components.ContainerListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerListResource.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.ContainerResource.t())`
    A list of containers.

  * `:first_id` - **required** - `String.t()`
    The ID of the first container in the list.

  * `:has_more` - **required** - `boolean()`
    Whether there are more containers available.

  * `:last_id` - **required** - `String.t()`
    The ID of the last container in the list.

  * `:object` - **required** - `:list`
    The type of object returned, must be 'list'.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ContainerResource.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.ContainerResource.input()),
              required(:first_id) => String.t(),
              required(:has_more) => boolean(),
              required(:last_id) => String.t(),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
