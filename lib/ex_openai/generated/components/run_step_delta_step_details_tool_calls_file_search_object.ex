defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsFileSearchObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDeltaStepDetailsToolCallsFileSearchObject.

  ## Fields

  * `:file_search` - **required** - `map()`
    For now, this is always going to be an empty object.

  * `:id` - **optional** - `String.t()`
    The ID of the tool call object.

  * `:index` - **required** - `integer()`
    The index of the tool call in the tool calls array.

  * `:type` - **required** - `:file_search`
    The type of tool call. This is always going to be `file_search` for this type of tool call.
    Allowed values: `"file_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_search: map(),
          id: String.t() | nil,
          index: integer(),
          type: :file_search
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:file_search) => map(),
              optional(:id) => String.t(),
              required(:index) => integer(),
              required(:type) => :file_search | String.t()
            }
  defstruct [:file_search, :id, :index, :type]
end
