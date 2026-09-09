defmodule ExOpenAI.Components.TranscriptTextUsageTokens do
  use ExOpenAI.Jason

  @moduledoc """
  Usage statistics for models billed by token usage.

  ## Fields

  * `:input_token_details` - **optional** - `%{optional(:audio_tokens) => integer(), optional(:text_tokens) => integer()}`
    Details about the input tokens billed for this request.

  * `:input_tokens` - **required** - `integer()`
    Number of input tokens billed for this request.

  * `:output_tokens` - **required** - `integer()`
    Number of output tokens generated.

  * `:total_tokens` - **required** - `integer()`
    Total number of tokens used (input + output).

  * `:type` - **required** - `:tokens`
    The type of the usage object. Always `tokens` for this variant.
    Allowed values: `"tokens"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_token_details:
            %{optional(:audio_tokens) => integer(), optional(:text_tokens) => integer()} | nil,
          input_tokens: integer(),
          output_tokens: integer(),
          total_tokens: integer(),
          type: :tokens
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input_token_details) => %{
                optional(:audio_tokens) => integer(),
                optional(:text_tokens) => integer()
              },
              required(:input_tokens) => integer(),
              required(:output_tokens) => integer(),
              required(:total_tokens) => integer(),
              required(:type) => :tokens | String.t()
            }
  defstruct [:input_token_details, :input_tokens, :output_tokens, :total_tokens, :type]
end
