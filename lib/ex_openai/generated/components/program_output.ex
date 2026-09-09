defmodule ExOpenAI.Components.ProgramOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProgramOutput.

  ## Fields

  * `:call_id` - **required** - `String.t()`
    The call ID of the program item.

  * `:id` - **required** - `String.t()`
    The unique ID of the program output item.

  * `:result` - **required** - `String.t()`
    The result produced by the program item.

  * `:status` - **required** - `ExOpenAI.Components.ProgramOutputStatus.t()`
    The terminal status of the program output item.

  * `:type` - **required** - `:program_output`
    The type of the item. Always `program_output`.
    Allowed values: `"program_output"`
    Default: `"program_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          call_id: String.t(),
          id: String.t(),
          result: String.t(),
          status: ExOpenAI.Components.ProgramOutputStatus.t(),
          type: :program_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:call_id) => String.t(),
              required(:id) => String.t(),
              required(:result) => String.t(),
              required(:status) => ExOpenAI.Components.ProgramOutputStatus.input(),
              required(:type) => :program_output | String.t()
            }
  defstruct [:call_id, :id, :result, :status, :type]
end
