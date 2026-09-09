defmodule ExOpenAI.Responses do
  @moduledoc """
  Functions for the OpenAI responses API.
  """
  (
    @doc """
    Creates a model response. Provide [text](https://platform.openai.com/docs/guides/text) or
    [image](https://platform.openai.com/docs/guides/images) inputs to generate [text](https://platform.openai.com/docs/guides/text)
    or [JSON](https://platform.openai.com/docs/guides/structured-outputs) outputs. Have the model call
    your own [custom code](https://platform.openai.com/docs/guides/function-calling) or use built-in
    [tools](https://platform.openai.com/docs/guides/tools) like [web search](https://platform.openai.com/docs/guides/tools-web-search)
    or [file search](https://platform.openai.com/docs/guides/tools-file-search) to use your own data
    as input for the model's response.


    ## Options

    * `background` - **optional** - `boolean() | nil`

    * `context_management` - **optional** - `list(ExOpenAI.Components.ContextManagementParam.input()) | nil`

    * `conversation` - **optional** - `ExOpenAI.Components.ConversationParam.input() | nil`

    * `include` - **optional** - `list(ExOpenAI.Components.IncludeEnum.input()) | nil`

    * `input` - **optional** - `ExOpenAI.Components.InputParam.input()`

    * `instructions` - **optional** - `String.t() | nil`

    * `max_output_tokens` - **optional** - `integer() | nil`

    * `max_tool_calls` - **optional** - `integer() | nil`

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `model` - **optional** - `ExOpenAI.Components.ModelIdsResponses.input()`
      Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
    offers a wide range of models with different capabilities, performance
    characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
    to browse and compare available models.

    * `moderation` - **optional** - `ExOpenAI.Components.ModerationParam.input() | nil`

    * `parallel_tool_calls` - **optional** - `boolean() | nil`

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `prompt` - **optional** - `ExOpenAI.Components.Prompt.input()`

    * `prompt_cache_key` - **optional** - `String.t() | nil`

    * `prompt_cache_options` - **optional** - `ExOpenAI.Components.PromptCacheOptionsParam.input()`

    * `prompt_cache_retention` - **optional** - `:in_memory | :"24h" | String.t() | nil`

    * `reasoning` - **optional** - `ExOpenAI.Components.Reasoning.input() | nil`

    * `safety_identifier` - **optional** - `String.t() | nil`

    * `service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.input()`

    * `store` - **optional** - `boolean() | nil`

    * `stream` - **optional** - `boolean() | nil`

    * `stream_options` - **optional** - `ExOpenAI.Components.ResponseStreamOptions.input()`

    * `temperature` - **optional** - `number() | nil`

    * `text` - **optional** - `ExOpenAI.Components.ResponseTextParam.input()`

    * `tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.input()`

    * `tools` - **optional** - `ExOpenAI.Components.ToolsArray.input()`

    * `top_logprobs` - **optional** - `integer()`
      An integer between 0 and 20 specifying the maximum number of most likely
    tokens to return at each token position, each with an associated log
    probability. In some cases, the number of returned tokens may be fewer than
    requested.
      Constraints: minimum: 0, maximum: 20

    * `top_p` - **optional** - `number() | nil`

    * `truncation` - **optional** - `:auto | :disabled | String.t() | nil`

    * `user` - **optional** - `String.t()`
      This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
    A stable identifier for your end-users.
    Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
      Example: `"user-1234"`
    """
    (
      @type create_response_opt() ::
              (((((((((((((((((((((((((((((({:background, boolean() | nil}
                                            | {:context_management,
                                               list(
                                                 ExOpenAI.Components.ContextManagementParam.input()
                                               )
                                               | nil})
                                           | {:conversation,
                                              ExOpenAI.Components.ConversationParam.input() | nil})
                                          | {:include,
                                             list(ExOpenAI.Components.IncludeEnum.input()) | nil})
                                         | {:input, ExOpenAI.Components.InputParam.input()})
                                        | {:instructions, String.t() | nil})
                                       | {:max_output_tokens, integer() | nil})
                                      | {:max_tool_calls, integer() | nil})
                                     | {:metadata, ExOpenAI.Components.Metadata.input()})
                                    | {:model, ExOpenAI.Components.ModelIdsResponses.input()})
                                   | {:moderation,
                                      ExOpenAI.Components.ModerationParam.input() | nil})
                                  | {:parallel_tool_calls, boolean() | nil})
                                 | {:previous_response_id, String.t() | nil})
                                | {:prompt, ExOpenAI.Components.Prompt.input()})
                               | {:prompt_cache_key, String.t() | nil})
                              | {:prompt_cache_options,
                                 ExOpenAI.Components.PromptCacheOptionsParam.input()})
                             | {:prompt_cache_retention,
                                ((:in_memory | :"24h") | String.t()) | nil})
                            | {:reasoning, ExOpenAI.Components.Reasoning.input() | nil})
                           | {:safety_identifier, String.t() | nil})
                          | {:service_tier, ExOpenAI.Components.ServiceTier.input()})
                         | {:store, boolean() | nil})
                        | {:stream, boolean() | nil})
                       | {:stream_options, ExOpenAI.Components.ResponseStreamOptions.input()})
                      | {:temperature, number() | nil})
                     | {:text, ExOpenAI.Components.ResponseTextParam.input()})
                    | {:tool_choice, ExOpenAI.Components.ToolChoiceParam.input()})
                   | {:tools, ExOpenAI.Components.ToolsArray.input()})
                  | {:top_logprobs, integer()})
                 | {:top_p, number() | nil})
                | {:truncation, ((:auto | :disabled) | String.t()) | nil})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec create_response(opts :: [create_response_opt()]) ::
              {:ok, ExOpenAI.Components.Response.t() | reference()} | {:error, any()}
    )

    def create_response(opts \\ []) do
      url = "/responses"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
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
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
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
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ResponseStreamEvent"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Response"}
            )
          end
        end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Compact a conversation. Returns a compacted response object.

    Learn when and how to compact long-running conversations in the [conversation state guide](https://platform.openai.com/docs/guides/conversation-state#managing-the-context-window). For ZDR-compatible compaction details, see [Compaction (advanced)](https://platform.openai.com/docs/guides/conversation-state#compaction-advanced).

    ## Options

    * `input` - **optional** - `String.t() | list(ExOpenAI.Components.InputItem.input()) | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `model` - **optional** - `ExOpenAI.Components.ModelIdsCompaction.input()`

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `prompt_cache_key` - **optional** - `String.t() | nil`

    * `prompt_cache_options` - **optional** - `ExOpenAI.Components.PromptCacheOptionsParam.input() | nil`

    * `prompt_cache_retention` - **optional** - `ExOpenAI.Components.PromptCacheRetentionEnum.input() | nil`

    * `service_tier` - **optional** - `ExOpenAI.Components.ServiceTierEnum.input() | nil`
    """
    (
      @type compactconversation_opt() ::
              ((((((({:input, (String.t() | list(ExOpenAI.Components.InputItem.input())) | nil}
                     | {:instructions, String.t() | nil})
                    | {:model, ExOpenAI.Components.ModelIdsCompaction.input()})
                   | {:previous_response_id, String.t() | nil})
                  | {:prompt_cache_key, String.t() | nil})
                 | {:prompt_cache_options,
                    ExOpenAI.Components.PromptCacheOptionsParam.input() | nil})
                | {:prompt_cache_retention,
                   ExOpenAI.Components.PromptCacheRetentionEnum.input() | nil})
               | {:service_tier, ExOpenAI.Components.ServiceTierEnum.input() | nil})
              | ExOpenAI.request_option()
      @spec compactconversation(opts :: [compactconversation_opt()]) ::
              {:ok, ExOpenAI.Components.CompactResource.t()} | {:error, any()}
    )

    def compactconversation(opts \\ []) do
      url = "/responses/compact"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :input,
          :instructions,
          :model,
          :previous_response_id,
          :prompt_cache_key,
          :prompt_cache_options,
          :prompt_cache_retention,
          :service_tier
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :input,
          :instructions,
          :model,
          :previous_response_id,
          :prompt_cache_key,
          :prompt_cache_options,
          :prompt_cache_retention,
          :service_tier
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/CompactResource"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Compact a conversation. Returns a compacted response object.

    Learn when and how to compact long-running conversations in the [conversation state guide](https://platform.openai.com/docs/guides/conversation-state#managing-the-context-window). For ZDR-compatible compaction details, see [Compaction (advanced)](https://platform.openai.com/docs/guides/conversation-state#compaction-advanced).

    ## Options

    * `input` - **optional** - `String.t() | list(ExOpenAI.Components.BetaInputItem.input()) | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `model` - **optional** - `ExOpenAI.Components.BetaModelIdsCompaction.input()`

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `prompt_cache_key` - **optional** - `String.t() | nil`

    * `prompt_cache_options` - **optional** - `ExOpenAI.Components.BetaPromptCacheOptionsParam.input() | nil`

    * `prompt_cache_retention` - **optional** - `ExOpenAI.Components.BetaPromptCacheRetentionEnum.input() | nil`

    * `service_tier` - **optional** - `ExOpenAI.Components.BetaServiceTierEnum.input() | nil`

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_compactconversation_opt() ::
              ((((((({:input,
                      (String.t() | list(ExOpenAI.Components.BetaInputItem.input())) | nil}
                     | {:instructions, String.t() | nil})
                    | {:model, ExOpenAI.Components.BetaModelIdsCompaction.input()})
                   | {:previous_response_id, String.t() | nil})
                  | {:prompt_cache_key, String.t() | nil})
                 | {:prompt_cache_options,
                    ExOpenAI.Components.BetaPromptCacheOptionsParam.input() | nil})
                | {:prompt_cache_retention,
                   ExOpenAI.Components.BetaPromptCacheRetentionEnum.input() | nil})
               | {:service_tier, ExOpenAI.Components.BetaServiceTierEnum.input() | nil})
              | ExOpenAI.request_option()
      @spec beta_compactconversation(opts :: [beta_compactconversation_opt()]) ::
              {:ok, ExOpenAI.Components.BetaCompactResource.t()} | {:error, any()}
    )

    def beta_compactconversation(opts \\ []) do
      url = "/responses/compact?beta=true"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :input,
          :instructions,
          :model,
          :previous_response_id,
          :prompt_cache_key,
          :prompt_cache_options,
          :prompt_cache_retention,
          :service_tier
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :input,
          :instructions,
          :model,
          :previous_response_id,
          :prompt_cache_key,
          :prompt_cache_options,
          :prompt_cache_retention,
          :service_tier
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaCompactResource"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns input token counts of the request.

    Returns an object with `object` set to `response.input_tokens` and an `input_tokens` count.

    ## Options

    * `conversation` - **optional** - `ExOpenAI.Components.ConversationParam.input() | nil`

    * `input` - **optional** - `String.t() | list(ExOpenAI.Components.InputItem.input()) | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `model` - **optional** - `String.t() | nil`

    * `parallel_tool_calls` - **optional** - `boolean() | nil`

    * `personality` - **optional** - `ExOpenAI.Components.PersonalityEnum.input()`
      A model-owned style preset to apply to this request. Omit this parameter to use the model's default style. Supported values may expand over time. Values must be at most 64 characters.

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `reasoning` - **optional** - `ExOpenAI.Components.Reasoning.input() | nil`

    * `text` - **optional** - `ExOpenAI.Components.ResponseTextParam.input() | nil`

    * `tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.input() | nil`

    * `tools` - **optional** - `list(ExOpenAI.Components.Tool.input()) | nil`

    * `truncation` - **optional** - `ExOpenAI.Components.TruncationEnum.input()`
      The truncation strategy to use for the model response. - `auto`: If the input to this Response exceeds the model's context window size, the model will truncate the response to fit the context window by dropping items from the beginning of the conversation. - `disabled` (default): If the input size will exceed the context window size for a model, the request will fail with a 400 error.
    """
    (
      @type getinputtokencounts_opt() ::
              ((((((((((({:conversation, ExOpenAI.Components.ConversationParam.input() | nil}
                         | {:input,
                            (String.t() | list(ExOpenAI.Components.InputItem.input())) | nil})
                        | {:instructions, String.t() | nil})
                       | {:model, String.t() | nil})
                      | {:parallel_tool_calls, boolean() | nil})
                     | {:personality, ExOpenAI.Components.PersonalityEnum.input()})
                    | {:previous_response_id, String.t() | nil})
                   | {:reasoning, ExOpenAI.Components.Reasoning.input() | nil})
                  | {:text, ExOpenAI.Components.ResponseTextParam.input() | nil})
                 | {:tool_choice, ExOpenAI.Components.ToolChoiceParam.input() | nil})
                | {:tools, list(ExOpenAI.Components.Tool.input()) | nil})
               | {:truncation, ExOpenAI.Components.TruncationEnum.input()})
              | ExOpenAI.request_option()
      @spec getinputtokencounts(opts :: [getinputtokencounts_opt()]) ::
              {:ok, ExOpenAI.Components.TokenCountsResource.t()} | {:error, any()}
    )

    def getinputtokencounts(opts \\ []) do
      url = "/responses/input_tokens"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :conversation,
          :input,
          :instructions,
          :model,
          :parallel_tool_calls,
          :personality,
          :previous_response_id,
          :reasoning,
          :text,
          :tool_choice,
          :tools,
          :truncation
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :conversation,
          :input,
          :instructions,
          :model,
          :parallel_tool_calls,
          :personality,
          :previous_response_id,
          :reasoning,
          :text,
          :tool_choice,
          :tools,
          :truncation
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/TokenCountsResource"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns input token counts of the request.

    Returns an object with `object` set to `response.input_tokens` and an `input_tokens` count.

    ## Options

    * `conversation` - **optional** - `ExOpenAI.Components.BetaConversationParam.input() | nil`

    * `input` - **optional** - `String.t() | list(ExOpenAI.Components.BetaInputItem.input()) | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `model` - **optional** - `String.t() | nil`

    * `parallel_tool_calls` - **optional** - `boolean() | nil`

    * `personality` - **optional** - `ExOpenAI.Components.BetaPersonalityEnum.input()`
      A model-owned style preset to apply to this request. Omit this parameter to use the model's default style. Supported values may expand over time. Values must be at most 64 characters.

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `reasoning` - **optional** - `ExOpenAI.Components.BetaReasoning.input() | nil`

    * `text` - **optional** - `ExOpenAI.Components.BetaResponseTextParam.input() | nil`

    * `tool_choice` - **optional** - `ExOpenAI.Components.BetaToolChoiceParam.input() | nil`

    * `tools` - **optional** - `list(ExOpenAI.Components.BetaTool.input()) | nil`

    * `truncation` - **optional** - `ExOpenAI.Components.BetaTruncationEnum.input()`
      The truncation strategy to use for the model response. - `auto`: If the input to this Response exceeds the model's context window size, the model will truncate the response to fit the context window by dropping items from the beginning of the conversation. - `disabled` (default): If the input size will exceed the context window size for a model, the request will fail with a 400 error.

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_getinputtokencounts_opt() ::
              ((((((((((({:conversation, ExOpenAI.Components.BetaConversationParam.input() | nil}
                         | {:input,
                            (String.t() | list(ExOpenAI.Components.BetaInputItem.input())) | nil})
                        | {:instructions, String.t() | nil})
                       | {:model, String.t() | nil})
                      | {:parallel_tool_calls, boolean() | nil})
                     | {:personality, ExOpenAI.Components.BetaPersonalityEnum.input()})
                    | {:previous_response_id, String.t() | nil})
                   | {:reasoning, ExOpenAI.Components.BetaReasoning.input() | nil})
                  | {:text, ExOpenAI.Components.BetaResponseTextParam.input() | nil})
                 | {:tool_choice, ExOpenAI.Components.BetaToolChoiceParam.input() | nil})
                | {:tools, list(ExOpenAI.Components.BetaTool.input()) | nil})
               | {:truncation, ExOpenAI.Components.BetaTruncationEnum.input()})
              | ExOpenAI.request_option()
      @spec beta_getinputtokencounts(opts :: [beta_getinputtokencounts_opt()]) ::
              {:ok, ExOpenAI.Components.BetaTokenCountsResource.t()} | {:error, any()}
    )

    def beta_getinputtokencounts(opts \\ []) do
      url = "/responses/input_tokens?beta=true"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :conversation,
          :input,
          :instructions,
          :model,
          :parallel_tool_calls,
          :personality,
          :previous_response_id,
          :reasoning,
          :text,
          :tool_choice,
          :tools,
          :truncation
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :conversation,
          :input,
          :instructions,
          :model,
          :parallel_tool_calls,
          :personality,
          :previous_response_id,
          :reasoning,
          :text,
          :tool_choice,
          :tools,
          :truncation
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaTokenCountsResource"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Deletes a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to delete.
    """
    (
      @type delete_response_opt() :: ExOpenAI.request_option()
      @spec delete_response(response_id :: String.t(), opts :: [delete_response_opt()]) ::
              {:ok, term()} | {:error, any()}
    )

    def delete_response(response_id, opts \\ []) do
      url = "/responses/{response_id}"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :delete,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Retrieves a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to retrieve.

    ## Options

    * `:include` - **optional** - `list(ExOpenAI.Components.IncludeEnum.input())`
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.

    * `:stream` - **optional** - `boolean()`
      If set to true, the model response data will be streamed to the client
    as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
    See the [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
    for more information.

    * `:starting_after` - **optional** - `integer()`
      The sequence number of the event after which to start streaming.

    * `:include_obfuscation` - **optional** - `boolean()`
      When true, stream obfuscation will be enabled. Stream obfuscation adds
    random characters to an `obfuscation` field on streaming delta events
    to normalize payload sizes as a mitigation to certain side-channel
    attacks. These obfuscation fields are included by default, but add a
    small amount of overhead to the data stream. You can set
    `include_obfuscation` to false to optimize for bandwidth if you trust
    the network links between your application and the OpenAI API.
    """
    (
      @type get_response_opt() ::
              ((({:include, list(ExOpenAI.Components.IncludeEnum.input())} | {:stream, boolean()})
                | {:starting_after, integer()})
               | {:include_obfuscation, boolean()})
              | ExOpenAI.request_option()
      @spec get_response(response_id :: String.t(), opts :: [get_response_opt()]) ::
              {:ok, ExOpenAI.Components.Response.t() | reference()} | {:error, any()}
    )

    def get_response(response_id, opts \\ []) do
      url = "/responses/{response_id}"
      url = String.replace(url, "{response_id}", to_string(response_id))

      query_params =
        Keyword.take(opts, [:include, :stream, :starting_after, :include_obfuscation])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:include, :include_obfuscation, :starting_after, :stream]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Response"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Response"}
            )
          end
        end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Cancels a model response with the given ID. Only responses created with
    the `background` parameter set to `true` can be cancelled.
    [Learn more](https://platform.openai.com/docs/guides/background).


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to cancel.
    """
    (
      @type cancel_response_opt() :: ExOpenAI.request_option()
      @spec cancel_response(response_id :: String.t(), opts :: [cancel_response_opt()]) ::
              {:ok, ExOpenAI.Components.Response.t()} | {:error, any()}
    )

    def cancel_response(response_id, opts \\ []) do
      url = "/responses/{response_id}/cancel"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Response"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Cancels a model response with the given ID. Only responses created with
    the `background` parameter set to `true` can be cancelled.
    [Learn more](https://platform.openai.com/docs/guides/background).


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to cancel.

    ## Options

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_cancel_response_opt() :: ExOpenAI.request_option()
      @spec beta_cancel_response(response_id :: String.t(), opts :: [beta_cancel_response_opt()]) ::
              {:ok, ExOpenAI.Components.BetaResponse.t()} | {:error, any()}
    )

    def beta_cancel_response(response_id, opts \\ []) do
      url = "/responses/{response_id}/cancel?beta=true"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaResponse"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns a list of input items for a given response.

    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to retrieve input items for.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between
    1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      The order to return the input items in. Default is `desc`.
    - `asc`: Return the input items in ascending order.
    - `desc`: Return the input items in descending order.
      Allowed values: `"asc"`, `"desc"`

    * `:after` - **optional** - `String.t()`
      An item ID to list items after, used in pagination.

    * `:include` - **optional** - `list(ExOpenAI.Components.IncludeEnum.input())`
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.
    """
    (
      @type list_input_items_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:include, list(ExOpenAI.Components.IncludeEnum.input())})
              | ExOpenAI.request_option()
      @spec list_input_items(response_id :: String.t(), opts :: [list_input_items_opt()]) ::
              {:ok, ExOpenAI.Components.ResponseItemList.t()} | {:error, any()}
    )

    def list_input_items(response_id, opts \\ []) do
      url = "/responses/{response_id}/input_items"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :include])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :include, :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ResponseItemList"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns a list of input items for a given response.

    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to retrieve input items for.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between
    1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      The order to return the input items in. Default is `desc`.
    - `asc`: Return the input items in ascending order.
    - `desc`: Return the input items in descending order.
      Allowed values: `"asc"`, `"desc"`

    * `:after` - **optional** - `String.t()`
      An item ID to list items after, used in pagination.

    * `:include` - **optional** - `list(ExOpenAI.Components.BetaIncludeEnum.input())`
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_list_input_items_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:include, list(ExOpenAI.Components.BetaIncludeEnum.input())})
              | ExOpenAI.request_option()
      @spec beta_list_input_items(
              response_id :: String.t(),
              opts :: [beta_list_input_items_opt()]
            ) :: {:ok, ExOpenAI.Components.BetaResponseItemList.t()} | {:error, any()}
    )

    def beta_list_input_items(response_id, opts \\ []) do
      url = "/responses/{response_id}/input_items?beta=true"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :include])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :include, :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaResponseItemList"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Deletes a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to delete.

    ## Options

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_delete_response_opt() :: ExOpenAI.request_option()
      @spec beta_delete_response(response_id :: String.t(), opts :: [beta_delete_response_opt()]) ::
              {:ok, term()} | {:error, any()}
    )

    def beta_delete_response(response_id, opts \\ []) do
      url = "/responses/{response_id}?beta=true"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :delete,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Retrieves a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`
      The ID of the response to retrieve.

    ## Options

    * `:include` - **optional** - `list(ExOpenAI.Components.BetaIncludeEnum.input())`
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.

    * `:stream` - **optional** - `boolean()`
      If set to true, the model response data will be streamed to the client
    as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
    See the [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
    for more information.

    * `:starting_after` - **optional** - `integer()`
      The sequence number of the event after which to start streaming.

    * `:include_obfuscation` - **optional** - `boolean()`
      When true, stream obfuscation will be enabled. Stream obfuscation adds
    random characters to an `obfuscation` field on streaming delta events
    to normalize payload sizes as a mitigation to certain side-channel
    attacks. These obfuscation fields are included by default, but add a
    small amount of overhead to the data stream. You can set
    `include_obfuscation` to false to optimize for bandwidth if you trust
    the network links between your application and the OpenAI API.

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_get_response_opt() ::
              ((({:include, list(ExOpenAI.Components.BetaIncludeEnum.input())}
                 | {:stream, boolean()})
                | {:starting_after, integer()})
               | {:include_obfuscation, boolean()})
              | ExOpenAI.request_option()
      @spec beta_get_response(response_id :: String.t(), opts :: [beta_get_response_opt()]) ::
              {:ok, ExOpenAI.Components.BetaResponse.t() | reference()} | {:error, any()}
    )

    def beta_get_response(response_id, opts \\ []) do
      url = "/responses/{response_id}?beta=true"
      url = String.replace(url, "{response_id}", to_string(response_id))

      query_params =
        Keyword.take(opts, [:include, :stream, :starting_after, :include_obfuscation])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:include, :include_obfuscation, :starting_after, :stream]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaResponse"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaResponse"}
            )
          end
        end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Creates a model response. Provide [text](https://platform.openai.com/docs/guides/text) or
    [image](https://platform.openai.com/docs/guides/images) inputs to generate [text](https://platform.openai.com/docs/guides/text)
    or [JSON](https://platform.openai.com/docs/guides/structured-outputs) outputs. Have the model call
    your own [custom code](https://platform.openai.com/docs/guides/function-calling) or use built-in
    [tools](https://platform.openai.com/docs/guides/tools) like [web search](https://platform.openai.com/docs/guides/tools-web-search)
    or [file search](https://platform.openai.com/docs/guides/tools-file-search) to use your own data
    as input for the model's response.


    ## Options

    * `background` - **optional** - `boolean() | nil`

    * `context_management` - **optional** - `list(ExOpenAI.Components.BetaContextManagementParam.input()) | nil`

    * `conversation` - **optional** - `ExOpenAI.Components.BetaConversationParam.input() | nil`

    * `include` - **optional** - `list(ExOpenAI.Components.BetaIncludeEnum.input()) | nil`

    * `input` - **optional** - `ExOpenAI.Components.BetaInputParam.input()`

    * `instructions` - **optional** - `String.t() | nil`

    * `max_output_tokens` - **optional** - `integer() | nil`

    * `max_tool_calls` - **optional** - `integer() | nil`

    * `metadata` - **optional** - `ExOpenAI.Components.BetaMetadata.input()`

    * `model` - **optional** - `ExOpenAI.Components.BetaModelIdsResponses.input()`
      Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
    offers a wide range of models with different capabilities, performance
    characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
    to browse and compare available models.

    * `moderation` - **optional** - `ExOpenAI.Components.BetaModerationParam.input() | nil`

    * `multi_agent` - **optional** - `ExOpenAI.Components.BetaMultiAgentParam.input() | nil`

    * `parallel_tool_calls` - **optional** - `boolean() | nil`

    * `previous_response_id` - **optional** - `String.t() | nil`

    * `prompt` - **optional** - `ExOpenAI.Components.BetaPrompt.input()`

    * `prompt_cache_key` - **optional** - `String.t() | nil`

    * `prompt_cache_options` - **optional** - `ExOpenAI.Components.BetaPromptCacheOptionsParam.input()`

    * `prompt_cache_retention` - **optional** - `:in_memory | :"24h" | String.t() | nil`

    * `reasoning` - **optional** - `ExOpenAI.Components.BetaReasoning.input() | nil`

    * `safety_identifier` - **optional** - `String.t() | nil`

    * `service_tier` - **optional** - `ExOpenAI.Components.BetaServiceTier.input()`

    * `store` - **optional** - `boolean() | nil`

    * `stream` - **optional** - `boolean() | nil`

    * `stream_options` - **optional** - `ExOpenAI.Components.BetaResponseStreamOptions.input()`

    * `temperature` - **optional** - `number() | nil`

    * `text` - **optional** - `ExOpenAI.Components.BetaResponseTextParam.input()`

    * `tool_choice` - **optional** - `ExOpenAI.Components.BetaToolChoiceParam.input()`

    * `tools` - **optional** - `ExOpenAI.Components.BetaToolsArray.input()`

    * `top_logprobs` - **optional** - `integer()`
      An integer between 0 and 20 specifying the maximum number of most likely
    tokens to return at each token position, each with an associated log
    probability. In some cases, the number of returned tokens may be fewer than
    requested.
      Constraints: minimum: 0, maximum: 20

    * `top_p` - **optional** - `number() | nil`

    * `truncation` - **optional** - `:auto | :disabled | String.t() | nil`

    * `user` - **optional** - `String.t()`
      This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
    A stable identifier for your end-users.
    Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
      Example: `"user-1234"`

    * `:openai-beta` - **optional** - `list(:"responses_multi_agent=v1" | String.t())`
      Optional beta features to enable for this request.
    """
    (
      @type beta_create_response_opt() ::
              ((((((((((((((((((((((((((((((({:background, boolean() | nil}
                                             | {:context_management,
                                                list(
                                                  ExOpenAI.Components.BetaContextManagementParam.input()
                                                )
                                                | nil})
                                            | {:conversation,
                                               ExOpenAI.Components.BetaConversationParam.input()
                                               | nil})
                                           | {:include,
                                              list(ExOpenAI.Components.BetaIncludeEnum.input())
                                              | nil})
                                          | {:input, ExOpenAI.Components.BetaInputParam.input()})
                                         | {:instructions, String.t() | nil})
                                        | {:max_output_tokens, integer() | nil})
                                       | {:max_tool_calls, integer() | nil})
                                      | {:metadata, ExOpenAI.Components.BetaMetadata.input()})
                                     | {:model, ExOpenAI.Components.BetaModelIdsResponses.input()})
                                    | {:moderation,
                                       ExOpenAI.Components.BetaModerationParam.input() | nil})
                                   | {:multi_agent,
                                      ExOpenAI.Components.BetaMultiAgentParam.input() | nil})
                                  | {:parallel_tool_calls, boolean() | nil})
                                 | {:previous_response_id, String.t() | nil})
                                | {:prompt, ExOpenAI.Components.BetaPrompt.input()})
                               | {:prompt_cache_key, String.t() | nil})
                              | {:prompt_cache_options,
                                 ExOpenAI.Components.BetaPromptCacheOptionsParam.input()})
                             | {:prompt_cache_retention,
                                ((:in_memory | :"24h") | String.t()) | nil})
                            | {:reasoning, ExOpenAI.Components.BetaReasoning.input() | nil})
                           | {:safety_identifier, String.t() | nil})
                          | {:service_tier, ExOpenAI.Components.BetaServiceTier.input()})
                         | {:store, boolean() | nil})
                        | {:stream, boolean() | nil})
                       | {:stream_options, ExOpenAI.Components.BetaResponseStreamOptions.input()})
                      | {:temperature, number() | nil})
                     | {:text, ExOpenAI.Components.BetaResponseTextParam.input()})
                    | {:tool_choice, ExOpenAI.Components.BetaToolChoiceParam.input()})
                   | {:tools, ExOpenAI.Components.BetaToolsArray.input()})
                  | {:top_logprobs, integer()})
                 | {:top_p, number() | nil})
                | {:truncation, ((:auto | :disabled) | String.t()) | nil})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec beta_create_response(opts :: [beta_create_response_opt()]) ::
              {:ok, ExOpenAI.Components.BetaResponse.t() | reference()} | {:error, any()}
    )

    def beta_create_response(opts \\ []) do
      url = "/responses?beta=true"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
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
          :multi_agent,
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
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
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
          :multi_agent,
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
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/BetaResponseStreamEvent"
              }
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/BetaResponse"}
            )
          end
        end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )
end
