defmodule ExOpenAI.Responses do
  @moduledoc false
  (
    @doc """
    Creates a model response. Provide [text](/docs/guides/text) or
    [image](/docs/guides/images) inputs to generate [text](/docs/guides/text)
    or [JSON](/docs/guides/structured-outputs) outputs. Have the model call
    your own [custom code](/docs/guides/function-calling) or use built-in
    [tools](/docs/guides/tools) like [web search](/docs/guides/tools-web-search)
    or [file search](/docs/guides/tools-file-search) to use your own data
    as input for the model's response.


    ## Options

    * `background` - **optional** - `boolean() | any()`

    * `context_management` - **optional** - `[any()] | any()`

    * `conversation` - **optional** - `any() | any()`

    * `include` - **optional** - `[any()] | any()`

    * `input` - **optional** - `any()`

    * `instructions` - **optional** - `String.t() | any()`

    * `max_output_tokens` - **optional** - `integer() | any()`

    * `max_tool_calls` - **optional** - `integer() | any()`

    * `metadata` - **optional** - `any()`

    * `model` - **optional** - `any()`  
      Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
    offers a wide range of models with different capabilities, performance
    characteristics, and price points. Refer to the [model guide](/docs/models)
    to browse and compare available models.

    * `parallel_tool_calls` - **optional** - `boolean() | any()`

    * `previous_response_id` - **optional** - `String.t() | any()`

    * `prompt` - **optional** - `any()`

    * `prompt_cache_key` - **optional** - `String.t()`  
      Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).  
      Example: `"prompt-cache-key-1234"`

    * `prompt_cache_retention` - **optional** - `:"in-memory" | :"24h" | any()`

    * `reasoning` - **optional** - `any() | any()`

    * `safety_identifier` - **optional** - `String.t()`  
      A stable identifier used to help detect users of your application that may be violating OpenAI's usage policies.
    The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
      Constraints: maxLength: 64  
      Example: `"safety-identifier-1234"`

    * `service_tier` - **optional** - `any()`

    * `store` - **optional** - `boolean() | any()`

    * `stream` - **optional** - `boolean() | any()`

    * `stream_options` - **optional** - `any()`

    * `temperature` - **optional** - `number() | any()`

    * `text` - **optional** - `any()`

    * `tool_choice` - **optional** - `any()`

    * `tools` - **optional** - `any()`

    * `top_logprobs` - **optional** - `integer()`  
      An integer between 0 and 20 specifying the number of most likely tokens to
    return at each token position, each with an associated log probability.  
      Constraints: minimum: 0, maximum: 20

    * `top_p` - **optional** - `number() | any()`

    * `truncation` - **optional** - `:auto | :disabled | any()`

    * `user` - **optional** - `String.t()`  
      This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
    A stable identifier for your end-users.
    Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
      Example: `"user-1234"`
    """
    @spec create_response(
            opts :: [
              ((((((((((((((((((((((((((({:background, boolean() | any()}
                                         | {:context_management,
                                            list(ExOpenAI.Components.ContextManagementParam.t())
                                            | any()})
                                        | {:conversation,
                                           ExOpenAI.Components.ConversationParam.t() | any()})
                                       | {:include,
                                          list(ExOpenAI.Components.IncludeEnum.t()) | any()})
                                      | {:input, ExOpenAI.Components.InputParam.t()})
                                     | {:instructions, String.t() | any()})
                                    | {:max_output_tokens, integer() | any()})
                                   | {:max_tool_calls, integer() | any()})
                                  | {:metadata, ExOpenAI.Components.Metadata.t()})
                                 | {:model, ExOpenAI.Components.ModelIdsResponses.t()})
                                | {:parallel_tool_calls, boolean() | any()})
                               | {:previous_response_id, String.t() | any()})
                              | {:prompt, ExOpenAI.Components.Prompt.t()})
                             | {:prompt_cache_key, String.t()})
                            | {:prompt_cache_retention, (:"in-memory" | :"24h") | any()})
                           | {:reasoning, ExOpenAI.Components.Reasoning.t() | any()})
                          | {:safety_identifier, String.t()})
                         | {:service_tier, ExOpenAI.Components.ServiceTier.t()})
                        | {:store, boolean() | any()})
                       | {:stream, boolean() | any()})
                      | {:stream_options, ExOpenAI.Components.ResponseStreamOptions.t()})
                     | {:temperature, number() | any()})
                    | {:text, ExOpenAI.Components.ResponseTextParam.t()})
                   | {:tool_choice, ExOpenAI.Components.ToolChoiceParam.t()})
                  | {:tools, ExOpenAI.Components.ToolsArray.t()})
                 | {:top_logprobs, integer()})
                | {:top_p, number() | any()})
               | {:truncation, (:auto | :disabled) | any()})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.Response.t()} | {:error, any()}
    def create_response(opts \\ []) do
      url = "/responses"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
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
          :user
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/Response",
              required: nil,
              type: nil,
              write_only: nil
            })
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
    Compact a conversation. Returns a compacted response object.

    Learn when and how to compact long-running conversations in the [conversation state guide](/docs/guides/conversation-state#managing-the-context-window). For ZDR-compatible compaction details, see [Compaction (advanced)](/docs/guides/conversation-state#compaction-advanced).

    ## Parameters

    * `model` - **required** - `any()`

    ## Options

    * `input` - **optional** - `String.t() | [any()] | any()`

    * `instructions` - **optional** - `String.t() | any()`

    * `previous_response_id` - **optional** - `String.t() | any()`

    * `prompt_cache_key` - **optional** - `String.t() | any()`
    """
    @spec compactconversation(
            opts :: [
              (({:input, (String.t() | list(ExOpenAI.Components.InputItem.t())) | any()}
                | {:instructions, String.t() | any()})
               | {:previous_response_id, String.t() | any()})
              | {:prompt_cache_key, String.t() | any()}
            ]
          ) :: {:ok, ExOpenAI.Components.CompactResource.t()} | {:error, any()}
    def compactconversation(opts \\ []) do
      url = "/responses/compact"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:input, :instructions, :previous_response_id, :prompt_cache_key])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:input, :instructions, :previous_response_id, :prompt_cache_key]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/CompactResource",
              required: nil,
              type: nil,
              write_only: nil
            })
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
    Returns input token counts of the request.

    Returns an object with `object` set to `response.input_tokens` and an `input_tokens` count.

    ## Options

    * `conversation` - **optional** - `any() | any()`

    * `input` - **optional** - `String.t() | [any()] | any()`

    * `instructions` - **optional** - `String.t() | any()`

    * `model` - **optional** - `String.t() | any()`

    * `parallel_tool_calls` - **optional** - `boolean() | any()`

    * `previous_response_id` - **optional** - `String.t() | any()`

    * `reasoning` - **optional** - `any() | any()`

    * `text` - **optional** - `any() | any()`

    * `tool_choice` - **optional** - `any() | any()`

    * `tools` - **optional** - `[any()] | any()`

    * `truncation` - **optional** - `any()`  
      The truncation strategy to use for the model response. - `auto`: If the input to this Response exceeds the model's context window size, the model will truncate the response to fit the context window by dropping items from the beginning of the conversation. - `disabled` (default): If the input size will exceed the context window size for a model, the request will fail with a 400 error.
    """
    @spec getinputtokencounts(
            opts :: [
              ((((((((({:conversation, ExOpenAI.Components.ConversationParam.t() | any()}
                       | {:input, (String.t() | list(ExOpenAI.Components.InputItem.t())) | any()})
                      | {:instructions, String.t() | any()})
                     | {:model, String.t() | any()})
                    | {:parallel_tool_calls, boolean() | any()})
                   | {:previous_response_id, String.t() | any()})
                  | {:reasoning, ExOpenAI.Components.Reasoning.t() | any()})
                 | {:text, ExOpenAI.Components.ResponseTextParam.t() | any()})
                | {:tool_choice, ExOpenAI.Components.ToolChoiceParam.t() | any()})
               | {:tools, list(ExOpenAI.Components.Tool.t()) | any()})
              | {:truncation, ExOpenAI.Components.TruncationEnum.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.TokenCountsResource.t()} | {:error, any()}
    def getinputtokencounts(opts \\ []) do
      url = "/responses/input_tokens"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :conversation,
          :input,
          :instructions,
          :model,
          :parallel_tool_calls,
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
          :previous_response_id,
          :reasoning,
          :text,
          :tool_choice,
          :tools,
          :truncation
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/TokenCountsResource",
              required: nil,
              type: nil,
              write_only: nil
            })
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
    Deletes a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`  
      The ID of the response to delete.
    """
    @spec delete_response(response_id :: String.t(), opts :: keyword()) ::
            {:ok, map()} | {:error, any()}
    def delete_response(response_id, opts \\ []) do
      url = "/responses/{response_id}"
      url = String.replace(url, "{response_id}", to_string(response_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response -> ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil) end
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
    Retrieves a model response with the given ID.


    ## Parameters

    * `:response_id` - **required** - `String.t()`  
      The ID of the response to retrieve.

    ## Options

    * `:include` - **optional** - `any()`  
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.

    * `:stream` - **optional** - `boolean()`  
      If set to true, the model response data will be streamed to the client
    as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
    See the [Streaming section below](/docs/api-reference/responses-streaming)
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
    @spec get_response(
            response_id :: String.t(),
            opts :: [
              (({:include, any()} | {:stream, boolean()}) | {:starting_after, integer()})
              | {:include_obfuscation, boolean()}
            ]
          ) :: {:ok, ExOpenAI.Components.Response.t()} | {:error, any()}
    def get_response(response_id, opts \\ []) do
      url = "/responses/{response_id}"
      url = String.replace(url, "{response_id}", to_string(response_id))

      query_params =
        Keyword.take(opts, [:include, :stream, :starting_after, :include_obfuscation])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:include, :include_obfuscation, :starting_after, :stream])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:include, :include_obfuscation, :starting_after, :stream]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/Response",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Cancels a model response with the given ID. Only responses created with
    the `background` parameter set to `true` can be cancelled. 
    [Learn more](/docs/guides/background).


    ## Parameters

    * `:response_id` - **required** - `String.t()`  
      The ID of the response to cancel.
    """
    @spec cancel_response(response_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Response.t()} | {:error, any()}
    def cancel_response(response_id, opts \\ []) do
      url = "/responses/{response_id}/cancel"
      url = String.replace(url, "{response_id}", to_string(response_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/Response",
              required: nil,
              type: nil,
              write_only: nil
            })
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
    Returns a list of input items for a given response.

    ## Parameters

    * `:response_id` - **required** - `String.t()`  
      The ID of the response to retrieve input items for.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between
    1 and 100, and the default is 20.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      The order to return the input items in. Default is `desc`.
    - `asc`: Return the input items in ascending order.
    - `desc`: Return the input items in descending order.  
      Allowed values: `"asc"`, `"desc"`

    * `:after` - **optional** - `String.t()`  
      An item ID to list items after, used in pagination.

    * `:include` - **optional** - `any()`  
      Additional fields to include in the response. See the `include`
    parameter for Response creation above for more information.
    """
    @spec list_input_items(
            response_id :: String.t(),
            opts :: [
              (({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
              | {:include, any()}
            ]
          ) :: {:ok, ExOpenAI.Components.ResponseItemList.t()} | {:error, any()}
    def list_input_items(response_id, opts \\ []) do
      url = "/responses/{response_id}/input_items"
      url = String.replace(url, "{response_id}", to_string(response_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :include])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :include, :limit, :order])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :include, :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/ResponseItemList",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
