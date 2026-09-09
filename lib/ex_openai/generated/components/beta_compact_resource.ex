defmodule ExOpenAI.Components.BetaCompactResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaCompactResource.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) when the compacted conversation was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The unique identifier for the compacted response.

  * `:object` - **required** - `:"response.compaction"`
    The object type. Always `response.compaction`.
    Allowed values: `"response.compaction"`
    Default: `"response.compaction"`

  * `:output` - **required** - `list(ExOpenAI.Components.BetaItemField.t())`
    The compacted list of output items.

  * `:usage` - **required** - `ExOpenAI.Components.BetaResponseUsage.t()`
    Token accounting for the compaction pass, including cached, reasoning, and total tokens.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"response.compaction",
          output: list(ExOpenAI.Components.BetaItemField.t()),
          usage: ExOpenAI.Components.BetaResponseUsage.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"response.compaction" | String.t(),
              required(:output) => list(ExOpenAI.Components.BetaItemField.input()),
              required(:usage) => ExOpenAI.Components.BetaResponseUsage.input()
            }
  defstruct [:created_at, :id, :object, :output, :usage]
end
