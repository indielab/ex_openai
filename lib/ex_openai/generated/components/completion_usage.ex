defmodule ExOpenAI.Components.CompletionUsage do
  use ExOpenAI.Jason

  @moduledoc """
  Usage statistics for the completion request.

  ## Fields

  * `:completion_tokens` - **required** - `integer()`
    Number of tokens in the generated completion.
    Default: `0`

  * `:completion_tokens_details` - **optional** - `%{ optional(:accepted_prediction_tokens) => integer(), optional(:audio_tokens) => integer(), optional(:reasoning_tokens) => integer(), optional(:rejected_prediction_tokens) => integer() }`
    Breakdown of tokens used in a completion.

  * `:prompt_tokens` - **required** - `integer()`
    Number of tokens in the prompt.
    Default: `0`

  * `:prompt_tokens_details` - **optional** - `%{ optional(:audio_tokens) => integer(), optional(:cache_write_tokens) => integer(), optional(:cached_tokens) => integer() }`
    Breakdown of tokens used in the prompt.

  * `:total_tokens` - **required** - `integer()`
    Total number of tokens used in the request (prompt + completion).
    Default: `0`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          completion_tokens: integer(),
          completion_tokens_details:
            %{
              optional(:accepted_prediction_tokens) => integer(),
              optional(:audio_tokens) => integer(),
              optional(:reasoning_tokens) => integer(),
              optional(:rejected_prediction_tokens) => integer()
            }
            | nil,
          prompt_tokens: integer(),
          prompt_tokens_details:
            %{
              optional(:audio_tokens) => integer(),
              optional(:cache_write_tokens) => integer(),
              optional(:cached_tokens) => integer()
            }
            | nil,
          total_tokens: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:completion_tokens) => integer(),
              optional(:completion_tokens_details) => %{
                optional(:accepted_prediction_tokens) => integer(),
                optional(:audio_tokens) => integer(),
                optional(:reasoning_tokens) => integer(),
                optional(:rejected_prediction_tokens) => integer()
              },
              required(:prompt_tokens) => integer(),
              optional(:prompt_tokens_details) => %{
                optional(:audio_tokens) => integer(),
                optional(:cache_write_tokens) => integer(),
                optional(:cached_tokens) => integer()
              },
              required(:total_tokens) => integer()
            }
  defstruct [
    :completion_tokens,
    :completion_tokens_details,
    :prompt_tokens,
    :prompt_tokens_details,
    :total_tokens
  ]
end
