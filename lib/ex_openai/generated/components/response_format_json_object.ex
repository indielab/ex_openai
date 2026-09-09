defmodule ExOpenAI.Components.ResponseFormatJsonObject do
  use ExOpenAI.Jason

  @moduledoc """
  JSON object response format. An older method of generating JSON responses.
  Using `json_schema` is recommended for models that support it. Note that the
  model will not generate JSON without a system or user message instructing it
  to do so.


  ## Fields

  * `:type` - **required** - `:json_object`
    The type of response format being defined. Always `json_object`.
    Allowed values: `"json_object"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :json_object}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :json_object | String.t()}
  defstruct [:type]
end
