defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsFunctionObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDeltaStepDetailsToolCallsFunctionObject.

  ## Fields

  * `:function` - **optional** - `%{ optional(:arguments) => String.t(), optional(:name) => String.t(), optional(:output) => String.t() | nil }`
    The definition of the function that was called.

  * `:id` - **optional** - `String.t()`
    The ID of the tool call object.

  * `:index` - **required** - `integer()`
    The index of the tool call in the tool calls array.

  * `:type` - **required** - `:function`
    The type of tool call. This is always going to be `function` for this type of tool call.
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function:
            %{
              optional(:arguments) => String.t(),
              optional(:name) => String.t(),
              optional(:output) => String.t() | nil
            }
            | nil,
          id: String.t() | nil,
          index: integer(),
          type: :function
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:function) => %{
                optional(:arguments) => String.t(),
                optional(:name) => String.t(),
                optional(:output) => String.t() | nil
              },
              optional(:id) => String.t(),
              required(:index) => integer(),
              required(:type) => :function | String.t()
            }
  defstruct [:function, :id, :index, :type]
end
