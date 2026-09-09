defmodule ExOpenAI.Components.ProgramToolCallCallerParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProgramToolCallCallerParam.

  ## Fields

  * `:caller_id` - **required** - `String.t()`
    The call ID of the program item that produced this tool call.
    Constraints: minLength: 1, maxLength: 64

  * `:type` - **required** - `:program`
    The caller type. Always `program`.
    Allowed values: `"program"`
    Default: `"program"`
  """
  @type t() :: %{__struct__: __MODULE__, caller_id: String.t(), type: :program}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:caller_id) => String.t(), required(:type) => :program | String.t()}
  defstruct [:caller_id, :type]
end
