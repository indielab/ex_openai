defmodule ExOpenAI.Components.ContainerFileListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerFileListResource.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.ContainerFileResource.t())`
    A list of container files.

  * `:first_id` - **required** - `String.t()`
    The ID of the first file in the list.

  * `:has_more` - **required** - `boolean()`
    Whether there are more files available.

  * `:last_id` - **required** - `String.t()`
    The ID of the last file in the list.

  * `:object` - **required** - `:list`
    The type of object returned, must be 'list'.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ContainerFileResource.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.ContainerFileResource.input()),
              required(:first_id) => String.t(),
              required(:has_more) => boolean(),
              required(:last_id) => String.t(),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
