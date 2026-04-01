defmodule ExOpenAI.Components.ChatCompletionList do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing a list of Chat Completions.


  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.CreateChatCompletionResponse.t()]`  
    An array of chat completion objects.

  * `:first_id` - **required** - `String.t()`  
    The identifier of the first chat completion in the data array.

  * `:has_more` - **required** - `boolean()`  
    Indicates whether there are more Chat Completions available.

  * `:last_id` - **required** - `String.t()`  
    The identifier of the last chat completion in the data array.

  * `:object` - **required** - `:list`  
    The type of this object. It is always set to "list".  
    Allowed values: `"list"`  
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.CreateChatCompletionResponse.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
