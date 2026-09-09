defmodule ExOpenAI.Components.LockedStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that a thread is locked and cannot accept new input.

  ## Fields

  * `:reason` - **required** - `String.t() | nil`

  * `:type` - **required** - `:locked`
    Status discriminator that is always `locked`.
    Allowed values: `"locked"`
    Default: `"locked"`
  """
  @type t() :: %{__struct__: __MODULE__, reason: String.t() | nil, type: :locked}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:reason) => String.t() | nil, required(:type) => :locked | String.t()}
  defstruct [:reason, :type]
end
