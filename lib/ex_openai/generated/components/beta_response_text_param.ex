defmodule ExOpenAI.Components.BetaResponseTextParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration options for a text response from the model. Can be plain
  text or structured JSON data. Learn more:
  - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
  - [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)


  ## Fields

  * `:format` - **optional** - `ExOpenAI.Components.BetaTextResponseFormatConfiguration.t()`

  * `:verbosity` - **optional** - `ExOpenAI.Components.BetaVerbosity.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          format: ExOpenAI.Components.BetaTextResponseFormatConfiguration.t() | nil,
          verbosity: ExOpenAI.Components.BetaVerbosity.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:format) =>
                ExOpenAI.Components.BetaTextResponseFormatConfiguration.input(),
              optional(:verbosity) => ExOpenAI.Components.BetaVerbosity.input()
            }
  defstruct [:format, :verbosity]
end
