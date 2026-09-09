defmodule ExOpenAI.Components.CreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateResponse.

  ## Fields

  * `:background` - **optional** - `boolean() | nil`

  * `:context_management` - **optional** - `list(ExOpenAI.Components.ContextManagementParam.t()) | nil`

  * `:conversation` - **optional** - `ExOpenAI.Components.ConversationParam.t() | nil`

  * `:include` - **optional** - `list(ExOpenAI.Components.IncludeEnum.t()) | nil`

  * `:input` - **optional** - `ExOpenAI.Components.InputParam.t()`

  * `:instructions` - **optional** - `String.t() | nil`

  * `:max_output_tokens` - **optional** - `integer() | nil`

  * `:max_tool_calls` - **optional** - `integer() | nil`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `ExOpenAI.Components.ModelIdsResponses.t()`
    Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
  to browse and compare available models.

  * `:moderation` - **optional** - `ExOpenAI.Components.ModerationParam.t() | nil`

  * `:parallel_tool_calls` - **optional** - `boolean() | nil`

  * `:previous_response_id` - **optional** - `String.t() | nil`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:prompt_cache_key` - **optional** - `String.t() | nil`

  * `:prompt_cache_options` - **optional** - `ExOpenAI.Components.PromptCacheOptionsParam.t()`

  * `:prompt_cache_retention` - **optional** - `:in_memory | :"24h" | nil`

  * `:reasoning` - **optional** - `ExOpenAI.Components.Reasoning.t() | nil`

  * `:safety_identifier` - **optional** - `String.t() | nil`

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:store` - **optional** - `boolean() | nil`

  * `:stream` - **optional** - `boolean() | nil`

  * `:stream_options` - **optional** - `ExOpenAI.Components.ResponseStreamOptions.t()`

  * `:temperature` - **optional** - `number() | nil`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t()`

  * `:tools` - **optional** - `ExOpenAI.Components.ToolsArray.t()`

  * `:top_logprobs` - **optional** - `integer()`
    An integer between 0 and 20 specifying the maximum number of most likely
  tokens to return at each token position, each with an associated log
  probability. In some cases, the number of returned tokens may be fewer than
  requested.
    Constraints: minimum: 0, maximum: 20

  * `:top_p` - **optional** - `number() | nil`

  * `:truncation` - **optional** - `:auto | :disabled | nil`

  * `:user` - **optional** - `String.t()`
    This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
  A stable identifier for your end-users.
  Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (boolean() | nil) | nil,
          context_management: (list(ExOpenAI.Components.ContextManagementParam.t()) | nil) | nil,
          conversation: (ExOpenAI.Components.ConversationParam.t() | nil) | nil,
          include: (list(ExOpenAI.Components.IncludeEnum.t()) | nil) | nil,
          input: ExOpenAI.Components.InputParam.t() | nil,
          instructions: (String.t() | nil) | nil,
          max_output_tokens: (integer() | nil) | nil,
          max_tool_calls: (integer() | nil) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: ExOpenAI.Components.ModelIdsResponses.t() | nil,
          moderation: (ExOpenAI.Components.ModerationParam.t() | nil) | nil,
          parallel_tool_calls: (boolean() | nil) | nil,
          previous_response_id: (String.t() | nil) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          prompt_cache_key: (String.t() | nil) | nil,
          prompt_cache_options: ExOpenAI.Components.PromptCacheOptionsParam.t() | nil,
          prompt_cache_retention: ((:in_memory | :"24h") | nil) | nil,
          reasoning: (ExOpenAI.Components.Reasoning.t() | nil) | nil,
          safety_identifier: (String.t() | nil) | nil,
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          store: (boolean() | nil) | nil,
          stream: (boolean() | nil) | nil,
          stream_options: ExOpenAI.Components.ResponseStreamOptions.t() | nil,
          temperature: (number() | nil) | nil,
          text: ExOpenAI.Components.ResponseTextParam.t() | nil,
          tool_choice: ExOpenAI.Components.ToolChoiceParam.t() | nil,
          tools: ExOpenAI.Components.ToolsArray.t() | nil,
          top_logprobs: integer() | nil,
          top_p: (number() | nil) | nil,
          truncation: ((:auto | :disabled) | nil) | nil,
          user: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:background) => boolean() | nil,
              optional(:context_management) =>
                list(ExOpenAI.Components.ContextManagementParam.input()) | nil,
              optional(:conversation) => ExOpenAI.Components.ConversationParam.input() | nil,
              optional(:include) => list(ExOpenAI.Components.IncludeEnum.input()) | nil,
              optional(:input) => ExOpenAI.Components.InputParam.input(),
              optional(:instructions) => String.t() | nil,
              optional(:max_output_tokens) => integer() | nil,
              optional(:max_tool_calls) => integer() | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) => ExOpenAI.Components.ModelIdsResponses.input(),
              optional(:moderation) => ExOpenAI.Components.ModerationParam.input() | nil,
              optional(:parallel_tool_calls) => boolean() | nil,
              optional(:previous_response_id) => String.t() | nil,
              optional(:prompt) => ExOpenAI.Components.Prompt.input(),
              optional(:prompt_cache_key) => String.t() | nil,
              optional(:prompt_cache_options) =>
                ExOpenAI.Components.PromptCacheOptionsParam.input(),
              optional(:prompt_cache_retention) => ((:in_memory | :"24h") | String.t()) | nil,
              optional(:reasoning) => ExOpenAI.Components.Reasoning.input() | nil,
              optional(:safety_identifier) => String.t() | nil,
              optional(:service_tier) => ExOpenAI.Components.ServiceTier.input(),
              optional(:store) => boolean() | nil,
              optional(:stream) => boolean() | nil,
              optional(:stream_options) => ExOpenAI.Components.ResponseStreamOptions.input(),
              optional(:temperature) => number() | nil,
              optional(:text) => ExOpenAI.Components.ResponseTextParam.input(),
              optional(:tool_choice) => ExOpenAI.Components.ToolChoiceParam.input(),
              optional(:tools) => ExOpenAI.Components.ToolsArray.input(),
              optional(:top_logprobs) => integer(),
              optional(:top_p) => number() | nil,
              optional(:truncation) => ((:auto | :disabled) | String.t()) | nil,
              optional(:user) => String.t()
            }
  defstruct [
    :background,
    :context_management,
    :conversation,
    :include,
    :input,
    :instructions,
    :max_output_tokens,
    :max_tool_calls,
    :metadata,
    :model,
    :moderation,
    :parallel_tool_calls,
    :previous_response_id,
    :prompt,
    :prompt_cache_key,
    :prompt_cache_options,
    :prompt_cache_retention,
    :reasoning,
    :safety_identifier,
    :service_tier,
    :store,
    :stream,
    :stream_options,
    :temperature,
    :text,
    :tool_choice,
    :tools,
    :top_logprobs,
    :top_p,
    :truncation,
    :user
  ]
end
