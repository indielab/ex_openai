defmodule ExOpenAI.Components.BetaContainerFileCitationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaContainerFileCitationParam.

  ## Fields

  * `:container_id` - **required** - `String.t()`
    The ID of the container.

  * `:end_index` - **required** - `integer()`
    The index of the last character of the citation in the message.
    Constraints: minimum: 0

  * `:file_id` - **required** - `String.t()`
    The ID of the container file.

  * `:filename` - **required** - `String.t()`
    The filename of the container file cited.

  * `:start_index` - **required** - `integer()`
    The index of the first character of the citation in the message.
    Constraints: minimum: 0

  * `:type` - **required** - `:container_file_citation`
    The citation type. Always `container_file_citation`.
    Allowed values: `"container_file_citation"`
    Default: `"container_file_citation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          container_id: String.t(),
          end_index: integer(),
          file_id: String.t(),
          filename: String.t(),
          start_index: integer(),
          type: :container_file_citation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:container_id) => String.t(),
              required(:end_index) => integer(),
              required(:file_id) => String.t(),
              required(:filename) => String.t(),
              required(:start_index) => integer(),
              required(:type) => :container_file_citation | String.t()
            }
  defstruct [:container_id, :end_index, :file_id, :filename, :start_index, :type]
end
