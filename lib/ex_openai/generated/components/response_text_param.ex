defmodule ExOpenAI.Components.ResponseTextParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration options for a text response from the model. Can be plain
  text or structured JSON data. Learn more:
  - [Text inputs and outputs](/docs/guides/text)
  - [Structured Outputs](/docs/guides/structured-outputs)


  ## Fields

  * `:format` - **optional** - `ExOpenAI.Components.TextResponseFormatConfiguration.t()`

  * `:verbosity` - **optional** - `ExOpenAI.Components.Verbosity.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          format: ExOpenAI.Components.TextResponseFormatConfiguration.t() | nil,
          verbosity: ExOpenAI.Components.Verbosity.t() | nil
        }
  defstruct [:format, :verbosity]
end
