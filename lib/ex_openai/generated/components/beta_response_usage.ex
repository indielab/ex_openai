defmodule ExOpenAI.Components.BetaResponseUsage do
  use ExOpenAI.Jason

  @moduledoc """
  Represents token usage details including input tokens, output tokens,
  a breakdown of output tokens, and the total tokens used.


  ## Fields

  * `:input_tokens` - **required** - `integer()`
    The number of input tokens.

  * `:input_tokens_details` - **required** - `%{required(:cache_write_tokens) => integer(), required(:cached_tokens) => integer()}`
    A detailed breakdown of the input tokens.

  * `:output_tokens` - **required** - `integer()`
    The number of output tokens.

  * `:output_tokens_details` - **required** - `%{required(:reasoning_tokens) => integer()}`
    A detailed breakdown of the output tokens.

  * `:total_tokens` - **required** - `integer()`
    The total number of tokens used.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_tokens: integer(),
          input_tokens_details: %{
            required(:cache_write_tokens) => integer(),
            required(:cached_tokens) => integer()
          },
          output_tokens: integer(),
          output_tokens_details: %{required(:reasoning_tokens) => integer()},
          total_tokens: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input_tokens) => integer(),
              required(:input_tokens_details) => %{
                required(:cache_write_tokens) => integer(),
                required(:cached_tokens) => integer()
              },
              required(:output_tokens) => integer(),
              required(:output_tokens_details) => %{required(:reasoning_tokens) => integer()},
              required(:total_tokens) => integer()
            }
  defstruct [
    :input_tokens,
    :input_tokens_details,
    :output_tokens,
    :output_tokens_details,
    :total_tokens
  ]
end
