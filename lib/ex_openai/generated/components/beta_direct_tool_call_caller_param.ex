defmodule ExOpenAI.Components.BetaDirectToolCallCallerParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaDirectToolCallCallerParam.

  ## Fields

  * `:type` - **required** - `:direct`
    The caller type. Always `direct`.
    Allowed values: `"direct"`
    Default: `"direct"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :direct}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :direct | String.t()}
  defstruct [:type]
end
