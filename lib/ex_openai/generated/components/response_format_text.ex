defmodule ExOpenAI.Components.ResponseFormatText do
  use ExOpenAI.Jason

  @moduledoc """
  Default response format. Used to generate text responses.


  ## Fields

  * `:type` - **required** - `:text`
    The type of response format being defined. Always `text`.
    Allowed values: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :text}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :text | String.t()}
  defstruct [:type]
end
