defmodule ExOpenAI.Chat do
  @moduledoc false
  (
    @doc """
    List stored Chat Completions. Only Chat Completions that have been stored
    with the `store` parameter set to `true` will be returned.


    ## Options

    * `:model` - **optional** - `String.t()`  
      The model used to generate the Chat Completions.

    * `:metadata` - **optional** - `any()`  
      A list of metadata keys to filter the Chat Completions by. Example:

    `metadata[key1]=value1&metadata[key2]=value2`

    * `:after` - **optional** - `String.t()`  
      Identifier for the last chat completion from the previous pagination request.

    * `:limit` - **optional** - `integer()`  
      Number of Chat Completions to retrieve.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order for Chat Completions by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    (
      @type list_chat_completions_opt() ::
              ((({:model, String.t()} | {:metadata, any()}) | {:after, String.t()})
               | {:limit, integer()})
              | {:order, String.t()}
      @spec list_chat_completions(opts :: [list_chat_completions_opt()]) ::
              {:ok, ExOpenAI.Components.ChatCompletionList.t()} | {:error, any()}
    )

    def list_chat_completions(opts \\ []) do
      url = "/chat/completions"
      query_params = Keyword.take(opts, [:model, :metadata, :after, :limit, :order])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :metadata, :model, :order])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :limit, :metadata, :model, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ChatCompletionList"}
        )
      end

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
    **Starting a new project?** We recommend trying [Responses](/docs/api-reference/responses)
    to take advantage of the latest OpenAI platform features. Compare
    [Chat Completions with Responses](/docs/guides/responses-vs-chat-completions?api-mode=responses).

    ---

    Creates a model response for the given chat conversation. Learn more in the
    [text generation](/docs/guides/text-generation), [vision](/docs/guides/vision),
    and [audio](/docs/guides/audio) guides.

    Parameter support can differ depending on the model used to generate the
    response, particularly for newer reasoning models. Parameters that are only
    supported for reasoning models are noted below. For the current state of
    unsupported parameters in reasoning models,
    [refer to the reasoning guide](/docs/guides/reasoning).

    Returns a chat completion object, or a streamed sequence of chat completion
    chunk objects if the request is streamed.


    ## Parameters

    * `messages` - **required** - `[any()]`  
      A list of messages comprising the conversation so far. Depending on the
    [model](/docs/models) you use, different message types (modalities) are
    supported, like [text](/docs/guides/text-generation),
    [images](/docs/guides/vision), and [audio](/docs/guides/audio).  
      Constraints: minItems: 1

    * `model` - **required** - `any()`  
      Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
    offers a wide range of models with different capabilities, performance
    characteristics, and price points. Refer to the [model guide](/docs/models)
    to browse and compare available models.

    ## Options

    * `prompt_cache_key` - **optional** - `String.t()`  
      Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).  
      Example: `"prompt-cache-key-1234"`

    * `audio` - **optional** - `any() | nil`  
      Parameters for audio output. Required when audio output is requested with
    `modalities: ["audio"]`. [Learn more](/docs/guides/audio).

    * `presence_penalty` - **optional** - `number() | nil`  
      Number between -2.0 and 2.0. Positive values penalize new tokens based on
    whether they appear in the text so far, increasing the model's likelihood
    to talk about new topics.  
      Default: `0`  
      Constraints: minimum: -2, maximum: 2

    * `max_completion_tokens` - **optional** - `integer() | nil`  
      An upper bound for the number of tokens that can be generated for a completion, including visible output tokens and [reasoning tokens](/docs/guides/reasoning).

    * `store` - **optional** - `boolean() | nil`  
      Whether or not to store the output of this chat completion request for
    use in our [model distillation](/docs/guides/distillation) or
    [evals](/docs/guides/evals) products.

    Supports text and image inputs. Note: image inputs over 8MB will be dropped.  
      Default: `false`

    * `safety_identifier` - **optional** - `String.t()`  
      A stable identifier used to help detect users of your application that may be violating OpenAI's usage policies.
    The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
      Constraints: maxLength: 64  
      Example: `"safety-identifier-1234"`

    * `function_call` - **optional** - `:none | :auto | any()`  
      Deprecated in favor of `tool_choice`.

    Controls which (if any) function is called by the model.

    `none` means the model will not call a function and instead generates a
    message.

    `auto` means the model can pick between generating a message or calling a
    function.

    Specifying a particular function via `{"name": "my_function"}` forces the
    model to call that function.

    `none` is the default when no functions are present. `auto` is the default
    if functions are present.

    * `service_tier` - **optional** - `any()`

    * `stream_options` - **optional** - `any()`

    * `metadata` - **optional** - `any()`

    * `stop` - **optional** - `any()`

    * `top_p` - **optional** - `number() | any()`

    * `n` - **optional** - `integer() | nil`  
      How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.  
      Default: `1`  
      Constraints: minimum: 1, maximum: 128  
      Example: `1`

    * `logprobs` - **optional** - `boolean() | nil`  
      Whether to return log probabilities of the output tokens or not. If true,
    returns the log probabilities of each output token returned in the
    `content` of `message`.  
      Default: `false`

    * `tool_choice` - **optional** - `any()`

    * `modalities` - **optional** - `any()`

    * `logit_bias` - **optional** - `map() | nil`  
      Modify the likelihood of specified tokens appearing in the completion.

    Accepts a JSON object that maps tokens (specified by their token ID in the
    tokenizer) to an associated bias value from -100 to 100. Mathematically,
    the bias is added to the logits generated by the model prior to sampling.
    The exact effect will vary per model, but values between -1 and 1 should
    decrease or increase likelihood of selection; values like -100 or 100
    should result in a ban or exclusive selection of the relevant token.

    * `web_search_options` - **optional** - `any()`  
      This tool searches the web for relevant results to use in a response.
    Learn more about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).

    * `temperature` - **optional** - `number() | any()`

    * `response_format` - **optional** - `any() | any() | any()`  
      An object specifying the format that the model must output.

    Setting to `{ "type": "json_schema", "json_schema": {...} }` enables
    Structured Outputs which ensures the model will match your supplied JSON
    schema. Learn more in the [Structured Outputs
    guide](/docs/guides/structured-outputs).

    Setting to `{ "type": "json_object" }` enables the older JSON mode, which
    ensures the message the model generates is valid JSON. Using `json_schema`
    is preferred for models that support it.

    * `seed` - **optional** - `integer() | nil`  
      This feature is in Beta.
    If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
    Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to monitor changes in the backend.  
      Constraints: minimum: -9223372036854776000, maximum: 9223372036854776000

    * `tools` - **optional** - `[any() | any()]`  
      A list of tools the model may call. You can provide either
    [custom tools](/docs/guides/function-calling#custom-tools) or
    [function tools](/docs/guides/function-calling).

    * `frequency_penalty` - **optional** - `number() | nil`  
      Number between -2.0 and 2.0. Positive values penalize new tokens based on
    their existing frequency in the text so far, decreasing the model's
    likelihood to repeat the same line verbatim.  
      Default: `0`  
      Constraints: minimum: -2, maximum: 2

    * `user` - **optional** - `String.t()`  
      This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
    A stable identifier for your end-users.
    Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
      Example: `"user-1234"`

    * `max_tokens` - **optional** - `integer() | nil`  
      The maximum number of [tokens](/tokenizer) that can be generated in the
    chat completion. This value can be used to control
    [costs](https://openai.com/api/pricing/) for text generated via API.

    This value is now deprecated in favor of `max_completion_tokens`, and is
    not compatible with [o-series models](/docs/guides/reasoning).

    * `reasoning_effort` - **optional** - `any()`

    * `functions` - **optional** - `[any()]`  
      Deprecated in favor of `tools`.

    A list of functions the model may generate JSON inputs for.  
      Constraints: minItems: 1, maxItems: 128

    * `stream` - **optional** - `boolean() | nil`  
      If set to true, the model response data will be streamed to the client
    as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
    See the [Streaming section below](/docs/api-reference/chat/streaming)
    for more information, along with the [streaming responses](/docs/guides/streaming-responses)
    guide for more information on how to handle the streaming events.  
      Default: `false`

    * `parallel_tool_calls` - **optional** - `any()`

    * `verbosity` - **optional** - `any()`

    * `prediction` - **optional** - `any() | nil`  
      Configuration for a [Predicted Output](/docs/guides/predicted-outputs),
    which can greatly improve response times when large parts of the model
    response are known ahead of time. This is most common when you are
    regenerating a file with only minor changes to most of the content.

    * `prompt_cache_retention` - **optional** - `:"in-memory" | :"24h" | any()`

    * `top_logprobs` - **optional** - `integer() | nil`  
      An integer between 0 and 20 specifying the number of most likely tokens to
    return at each token position, each with an associated log probability.
    `logprobs` must be set to `true` if this parameter is used.  
      Constraints: minimum: 0, maximum: 20
    """
    (
      @type create_chat_completion_opt() ::
              ((((((((((((((((((((((((((((((({:prompt_cache_key, String.t()}
                                             | {:audio,
                                                %{
                                                  required(:format) =>
                                                    ((((:wav | :aac) | :mp3) | :flac) | :opus)
                                                    | :pcm16,
                                                  required(:voice) =>
                                                    ExOpenAI.Components.VoiceIdsOrCustomVoice.t()
                                                }
                                                | nil})
                                            | {:presence_penalty, number() | nil})
                                           | {:max_completion_tokens, integer() | nil})
                                          | {:store, boolean() | nil})
                                         | {:safety_identifier, String.t()})
                                        | {:function_call,
                                           (:none | :auto)
                                           | ExOpenAI.Components.ChatCompletionFunctionCallOption.t()})
                                       | {:service_tier, ExOpenAI.Components.ServiceTier.t()})
                                      | {:stream_options,
                                         ExOpenAI.Components.ChatCompletionStreamOptions.t()})
                                     | {:metadata, ExOpenAI.Components.Metadata.t()})
                                    | {:stop, ExOpenAI.Components.StopConfiguration.t()})
                                   | {:top_p, number() | any()})
                                  | {:n, integer() | nil})
                                 | {:logprobs, boolean() | nil})
                                | {:tool_choice,
                                   ExOpenAI.Components.ChatCompletionToolChoiceOption.t()})
                               | {:modalities, ExOpenAI.Components.ResponseModalities.t()})
                              | {:logit_bias, map() | nil})
                             | {:web_search_options,
                                %{
                                  optional(:search_context_size) =>
                                    ExOpenAI.Components.WebSearchContextSize.t(),
                                  optional(:user_location) =>
                                    %{
                                      required(:approximate) =>
                                        ExOpenAI.Components.WebSearchLocation.t(),
                                      required(:type) => :approximate
                                    }
                                    | nil
                                }})
                            | {:temperature, number() | any()})
                           | {:response_format,
                              (ExOpenAI.Components.ResponseFormatText.t()
                               | ExOpenAI.Components.ResponseFormatJsonSchema.t())
                              | ExOpenAI.Components.ResponseFormatJsonObject.t()})
                          | {:seed, integer() | nil})
                         | {:tools,
                            list(
                              ExOpenAI.Components.ChatCompletionTool.t()
                              | ExOpenAI.Components.CustomToolChatCompletions.t()
                            )})
                        | {:frequency_penalty, number() | nil})
                       | {:user, String.t()})
                      | {:max_tokens, integer() | nil})
                     | {:reasoning_effort, ExOpenAI.Components.ReasoningEffort.t()})
                    | {:functions, list(ExOpenAI.Components.ChatCompletionFunctions.t())})
                   | {:stream, boolean() | nil})
                  | {:parallel_tool_calls, ExOpenAI.Components.ParallelToolCalls.t()})
                 | {:verbosity, ExOpenAI.Components.Verbosity.t()})
                | {:prediction, ExOpenAI.Components.PredictionContent.t() | nil})
               | {:prompt_cache_retention, (:"in-memory" | :"24h") | any()})
              | {:top_logprobs, integer() | nil}
      @spec create_chat_completion(
              messages :: list(ExOpenAI.Components.ChatCompletionRequestMessage.t()),
              model :: ExOpenAI.Components.ModelIdsShared.t(),
              opts :: [create_chat_completion_opt()]
            ) ::
              {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t() | reference()}
              | {:error, any()}
    )

    def create_chat_completion(messages, model, opts \\ []) do
      url = "/chat/completions"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [messages: messages, model: model]

      optional_body_params =
        Keyword.take(opts, [
          :audio,
          :frequency_penalty,
          :function_call,
          :functions,
          :logit_bias,
          :logprobs,
          :max_completion_tokens,
          :max_tokens,
          :metadata,
          :modalities,
          :n,
          :parallel_tool_calls,
          :prediction,
          :presence_penalty,
          :prompt_cache_key,
          :prompt_cache_retention,
          :reasoning_effort,
          :response_format,
          :safety_identifier,
          :seed,
          :service_tier,
          :stop,
          :store,
          :stream,
          :stream_options,
          :temperature,
          :tool_choice,
          :tools,
          :top_logprobs,
          :top_p,
          :user,
          :verbosity,
          :web_search_options
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :audio,
          :frequency_penalty,
          :function_call,
          :functions,
          :logit_bias,
          :logprobs,
          :max_completion_tokens,
          :max_tokens,
          :metadata,
          :modalities,
          :n,
          :parallel_tool_calls,
          :prediction,
          :presence_penalty,
          :prompt_cache_key,
          :prompt_cache_retention,
          :reasoning_effort,
          :response_format,
          :safety_identifier,
          :seed,
          :service_tier,
          :stop,
          :store,
          :stream,
          :stream_options,
          :temperature,
          :tool_choice,
          :tools,
          :top_logprobs,
          :top_p,
          :user,
          :verbosity,
          :web_search_options
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/CreateChatCompletionStreamResponse"
              }
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/CreateChatCompletionResponse"
              }
            )
          end
        end

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
    Delete a stored chat completion. Only Chat Completions that have been
    created with the `store` parameter set to `true` can be deleted.


    ## Parameters

    * `:completion_id` - **required** - `String.t()`  
      The ID of the chat completion to delete.
    """
    (
      nil

      @spec delete_chat_completion(completion_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.ChatCompletionDeleted.t()} | {:error, any()}
    )

    def delete_chat_completion(completion_id, opts \\ []) do
      url = "/chat/completions/{completion_id}"
      url = String.replace(url, "{completion_id}", to_string(completion_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ChatCompletionDeleted"}
        )
      end

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
    Get a stored chat completion. Only Chat Completions that have been created
    with the `store` parameter set to `true` will be returned.


    ## Parameters

    * `:completion_id` - **required** - `String.t()`  
      The ID of the chat completion to retrieve.
    """
    (
      nil

      @spec get_chat_completion(completion_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t()} | {:error, any()}
    )

    def get_chat_completion(completion_id, opts \\ []) do
      url = "/chat/completions/{completion_id}"
      url = String.replace(url, "{completion_id}", to_string(completion_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/CreateChatCompletionResponse"
          }
        )
      end

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
    Modify a stored chat completion. Only Chat Completions that have been
    created with the `store` parameter set to `true` can be modified. Currently,
    the only supported modification is to update the `metadata` field.


    ## Parameters

    * `:completion_id` - **required** - `String.t()`  
      The ID of the chat completion to update.
    """
    (
      nil

      @spec update_chat_completion(completion_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t()} | {:error, any()}
    )

    def update_chat_completion(completion_id, opts \\ []) do
      url = "/chat/completions/{completion_id}"
      url = String.replace(url, "{completion_id}", to_string(completion_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/CreateChatCompletionResponse"
          }
        )
      end

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
    Get the messages in a stored chat completion. Only Chat Completions that
    have been created with the `store` parameter set to `true` will be
    returned.


    ## Parameters

    * `:completion_id` - **required** - `String.t()`  
      The ID of the chat completion to retrieve messages from.

    ## Options

    * `:after` - **optional** - `String.t()`  
      Identifier for the last message from the previous pagination request.

    * `:limit` - **optional** - `integer()`  
      Number of messages to retrieve.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order for messages by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    (
      @type get_chat_completion_messages_opt() ::
              ({:after, String.t()} | {:limit, integer()}) | {:order, String.t()}
      @spec get_chat_completion_messages(
              completion_id :: String.t(),
              opts :: [get_chat_completion_messages_opt()]
            ) :: {:ok, ExOpenAI.Components.ChatCompletionMessageList.t()} | {:error, any()}
    )

    def get_chat_completion_messages(completion_id, opts \\ []) do
      url = "/chat/completions/{completion_id}/messages"
      url = String.replace(url, "{completion_id}", to_string(completion_id))
      query_params = Keyword.take(opts, [:after, :limit, :order])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ChatCompletionMessageList"
          }
        )
      end

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
end
