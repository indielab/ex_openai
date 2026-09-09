defmodule ExOpenAI.Components.DeleteFileResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteFileResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:file`
    Allowed values: `"file"`
  """
  @type t() :: %{__struct__: __MODULE__, deleted: boolean(), id: String.t(), object: :file}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :file | String.t()
            }
  defstruct [:deleted, :id, :object]
end
