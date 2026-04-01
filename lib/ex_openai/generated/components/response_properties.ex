defmodule ExOpenAI.Components.ResponseProperties do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ResponseProperties.

  ## Fields

  * `:background` - **optional** - `boolean() | any()`

  * `:max_output_tokens` - **optional** - `integer() | any()`

  * `:max_tool_calls` - **optional** - `integer() | any()`

  * `:model` - **optional** - `ExOpenAI.Components.ModelIdsResponses.t()`  
    Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model guide](/docs/models)
  to browse and compare available models.

  * `:previous_response_id` - **optional** - `String.t() | any()`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:reasoning` - **optional** - `ExOpenAI.Components.Reasoning.t() | any()`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t()`

  * `:tools` - **optional** - `ExOpenAI.Components.ToolsArray.t()`

  * `:truncation` - **optional** - `:auto | :disabled | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (boolean() | any()) | nil,
          max_output_tokens: (integer() | any()) | nil,
          max_tool_calls: (integer() | any()) | nil,
          model: ExOpenAI.Components.ModelIdsResponses.t() | nil,
          previous_response_id: (String.t() | any()) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          reasoning: (ExOpenAI.Components.Reasoning.t() | any()) | nil,
          text: ExOpenAI.Components.ResponseTextParam.t() | nil,
          tool_choice: ExOpenAI.Components.ToolChoiceParam.t() | nil,
          tools: ExOpenAI.Components.ToolsArray.t() | nil,
          truncation: ((:auto | :disabled) | any()) | nil
        }
  defstruct [
    :background,
    :max_output_tokens,
    :max_tool_calls,
    :model,
    :previous_response_id,
    :prompt,
    :reasoning,
    :text,
    :tool_choice,
    :tools,
    :truncation
  ]
end
