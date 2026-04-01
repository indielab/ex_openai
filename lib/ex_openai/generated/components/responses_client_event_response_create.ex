defmodule ExOpenAI.Components.ResponsesClientEventResponseCreate do
  use ExOpenAI.Jason

  @moduledoc """
  Client event for creating a response over a persistent WebSocket connection.
  This payload uses the same top-level fields as `POST /v1/responses`.

  Notes:
  - `stream` is implicit over WebSocket and should not be sent.
  - `background` is not supported over WebSocket.


  ## Fields

  * `:background` - **optional** - `boolean() | any()`

  * `:context_management` - **optional** - `[ExOpenAI.Components.ContextManagementParam.t()] | any()`

  * `:conversation` - **optional** - `ExOpenAI.Components.ConversationParam.t() | any()`

  * `:include` - **optional** - `[ExOpenAI.Components.IncludeEnum.t()] | any()`

  * `:input` - **optional** - `ExOpenAI.Components.InputParam.t()`

  * `:instructions` - **optional** - `String.t() | any()`

  * `:max_output_tokens` - **optional** - `integer() | any()`

  * `:max_tool_calls` - **optional** - `integer() | any()`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `ExOpenAI.Components.ModelIdsResponses.t()`  
    Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model guide](/docs/models)
  to browse and compare available models.

  * `:parallel_tool_calls` - **optional** - `boolean() | any()`

  * `:previous_response_id` - **optional** - `String.t() | any()`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:prompt_cache_key` - **optional** - `String.t()`  
    Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).

  * `:prompt_cache_retention` - **optional** - `:"in-memory" | :"24h" | any()`

  * `:reasoning` - **optional** - `ExOpenAI.Components.Reasoning.t() | any()`

  * `:safety_identifier` - **optional** - `String.t()`  
    A stable identifier used to help detect users of your application that may be violating OpenAI's usage policies.
  The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
    Constraints: maxLength: 64

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:store` - **optional** - `boolean() | any()`

  * `:stream` - **optional** - `boolean() | any()`

  * `:stream_options` - **optional** - `ExOpenAI.Components.ResponseStreamOptions.t()`

  * `:temperature` - **optional** - `number() | any()`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t()`

  * `:tools` - **optional** - `ExOpenAI.Components.ToolsArray.t()`

  * `:top_logprobs` - **optional** - `integer()`  
    An integer between 0 and 20 specifying the number of most likely tokens to
  return at each token position, each with an associated log probability.  
    Constraints: minimum: 0, maximum: 20

  * `:top_p` - **optional** - `number() | any()`

  * `:truncation` - **optional** - `:auto | :disabled | any()`

  * `:type` - **required** - `:"response.create"`  
    The type of the client event. Always `response.create`.  
    Allowed values: `"response.create"`

  * `:user` - **optional** - `String.t()`  
    This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
  A stable identifier for your end-users.
  Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (boolean() | any()) | nil,
          context_management:
            (list(ExOpenAI.Components.ContextManagementParam.t()) | any()) | nil,
          conversation: (ExOpenAI.Components.ConversationParam.t() | any()) | nil,
          include: (list(ExOpenAI.Components.IncludeEnum.t()) | any()) | nil,
          input: ExOpenAI.Components.InputParam.t() | nil,
          instructions: (String.t() | any()) | nil,
          max_output_tokens: (integer() | any()) | nil,
          max_tool_calls: (integer() | any()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: ExOpenAI.Components.ModelIdsResponses.t() | nil,
          parallel_tool_calls: (boolean() | any()) | nil,
          previous_response_id: (String.t() | any()) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          prompt_cache_key: String.t() | nil,
          prompt_cache_retention: ((:"in-memory" | :"24h") | any()) | nil,
          reasoning: (ExOpenAI.Components.Reasoning.t() | any()) | nil,
          safety_identifier: String.t() | nil,
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          store: (boolean() | any()) | nil,
          stream: (boolean() | any()) | nil,
          stream_options: ExOpenAI.Components.ResponseStreamOptions.t() | nil,
          temperature: (number() | any()) | nil,
          text: ExOpenAI.Components.ResponseTextParam.t() | nil,
          tool_choice: ExOpenAI.Components.ToolChoiceParam.t() | nil,
          tools: ExOpenAI.Components.ToolsArray.t() | nil,
          top_logprobs: integer() | nil,
          top_p: (number() | any()) | nil,
          truncation: ((:auto | :disabled) | any()) | nil,
          type: :"response.create",
          user: String.t() | nil
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
    :parallel_tool_calls,
    :previous_response_id,
    :prompt,
    :prompt_cache_key,
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
    :type,
    :user
  ]
end
