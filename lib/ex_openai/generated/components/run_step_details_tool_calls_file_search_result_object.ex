defmodule ExOpenAI.Components.RunStepDetailsToolCallsFileSearchResultObject do
  use ExOpenAI.Jason

  @moduledoc """
  A result instance of the file search.

  ## Fields

  * `:content` - **optional** - `[{:%{}, [], [{{:optional, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:type]}, :text}]}]`  
    The content of the result that was found. The content is only included if requested via the include query parameter.

  * `:file_id` - **required** - `String.t()`  
    The ID of the file that result was found in.

  * `:file_name` - **required** - `String.t()`  
    The name of the file that result was found in.

  * `:score` - **required** - `number()`  
    The score of the result. All values must be a floating point number between 0 and 1.  
    Constraints: minimum: 0, maximum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: list(%{optional(:text) => String.t(), optional(:type) => :text}) | nil,
          file_id: String.t(),
          file_name: String.t(),
          score: number()
        }
  defstruct [:content, :file_id, :file_name, :score]
end
