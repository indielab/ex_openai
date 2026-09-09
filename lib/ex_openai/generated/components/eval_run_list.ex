defmodule ExOpenAI.Components.EvalRunList do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing a list of runs for an evaluation.


  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.EvalRun.t())`
    An array of eval run objects.

  * `:first_id` - **required** - `String.t()`
    The identifier of the first eval run in the data array.

  * `:has_more` - **required** - `boolean()`
    Indicates whether there are more evals available.

  * `:last_id` - **required** - `String.t()`
    The identifier of the last eval run in the data array.

  * `:object` - **required** - `:list`
    The type of this object. It is always set to "list".
    Allowed values: `"list"`
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.EvalRun.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.EvalRun.input()),
              required(:first_id) => String.t(),
              required(:has_more) => boolean(),
              required(:last_id) => String.t(),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
