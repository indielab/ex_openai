defmodule ExOpenAI.Components.BetaTextResponseFormatConfiguration do
  @moduledoc """
  An object specifying the format that the model must output.

  Configuring `{ "type": "json_schema" }` enables Structured Outputs,
  which ensures the model will match your supplied JSON schema. Learn more in the
  [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).

  The default format is `{ "type": "text" }` with no additional options.

  **Not recommended for gpt-4o and newer models:**

  Setting to `{ "type": "json_object" }` enables the older JSON mode, which
  ensures the message the model generates is valid JSON. Using `json_schema`
  is preferred for models that support it.


  ## Type

  `ExOpenAI.Components.BetaResponseFormatText.t() | ExOpenAI.Components.BetaTextResponseFormatJsonSchema.t() | ExOpenAI.Components.BetaResponseFormatJsonObject.t()`
  """
  @type t() ::
          (ExOpenAI.Components.BetaResponseFormatText.t()
           | ExOpenAI.Components.BetaTextResponseFormatJsonSchema.t())
          | ExOpenAI.Components.BetaResponseFormatJsonObject.t()
  @type input() ::
          (ExOpenAI.Components.BetaResponseFormatText.input()
           | ExOpenAI.Components.BetaTextResponseFormatJsonSchema.input())
          | ExOpenAI.Components.BetaResponseFormatJsonObject.input()
end
