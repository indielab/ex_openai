defmodule ExOpenAI.Components.BetaContextManagementParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaContextManagementParam.

  ## Fields

  * `:compact_threshold` - **optional** - `integer() | nil`

  * `:type` - **required** - `String.t()`
    The context management entry type. Currently only 'compaction' is supported.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          compact_threshold: (integer() | nil) | nil,
          type: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{optional(:compact_threshold) => integer() | nil, required(:type) => String.t()}
  defstruct [:compact_threshold, :type]
end
