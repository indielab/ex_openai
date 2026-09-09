defmodule ExOpenAI.Components.EvalJsonlFileIdSource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalJsonlFileIdSource.

  ## Fields

  * `:id` - **required** - `String.t()`
    The identifier of the file.

  * `:type` - **required** - `:file_id`
    The type of jsonl source. Always `file_id`.
    Allowed values: `"file_id"`
    Default: `"file_id"`
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t(), type: :file_id}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:id) => String.t(), required(:type) => :file_id | String.t()}
  defstruct [:id, :type]
end
