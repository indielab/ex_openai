defmodule ExOpenAI.Components.ChatCompletionRequestFunctionMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestFunctionMessage.

  ## Fields

  * `:content` - **required** - `String.t() | nil`

  * `:name` - **required** - `String.t()`
    The name of the function to call.

  * `:role` - **required** - `:function`
    The role of the messages author, in this case `function`.
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: String.t() | nil,
          name: String.t(),
          role: :function
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) => String.t() | nil,
              required(:name) => String.t(),
              required(:role) => :function | String.t()
            }
  defstruct [:content, :name, :role]
end
