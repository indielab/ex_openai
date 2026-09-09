defmodule ExOpenAI.Components.ResponseProperties do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ResponseProperties.

  ## Fields

  * `:background` - **optional** - `boolean() | nil`

  * `:max_tool_calls` - **optional** - `integer() | nil`

  * `:model` - **optional** - `ExOpenAI.Components.ModelIdsResponses.t()`
    Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
  to browse and compare available models.

  * `:previous_response_id` - **optional** - `String.t() | nil`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t()`

  * `:tools` - **optional** - `ExOpenAI.Components.ToolsArray.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (boolean() | nil) | nil,
          max_tool_calls: (integer() | nil) | nil,
          model: ExOpenAI.Components.ModelIdsResponses.t() | nil,
          previous_response_id: (String.t() | nil) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          text: ExOpenAI.Components.ResponseTextParam.t() | nil,
          tool_choice: ExOpenAI.Components.ToolChoiceParam.t() | nil,
          tools: ExOpenAI.Components.ToolsArray.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:background) => boolean() | nil,
              optional(:max_tool_calls) => integer() | nil,
              optional(:model) => ExOpenAI.Components.ModelIdsResponses.input(),
              optional(:previous_response_id) => String.t() | nil,
              optional(:prompt) => ExOpenAI.Components.Prompt.input(),
              optional(:text) => ExOpenAI.Components.ResponseTextParam.input(),
              optional(:tool_choice) => ExOpenAI.Components.ToolChoiceParam.input(),
              optional(:tools) => ExOpenAI.Components.ToolsArray.input()
            }
  defstruct [
    :background,
    :max_tool_calls,
    :model,
    :previous_response_id,
    :prompt,
    :text,
    :tool_choice,
    :tools
  ]
end
