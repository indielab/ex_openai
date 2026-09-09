defmodule ExOpenAI.Threads do
  @moduledoc """
  Functions for the OpenAI threads API.
  """
  (
    @doc """
    Create a thread.

    ## Options

    * `messages` - **optional** - `list(ExOpenAI.Components.CreateMessageRequest.input())`
      A list of [messages](https://platform.openai.com/docs/api-reference/messages) to start the thread with.

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{ optional(:vector_store_ids) => list(String.t()), optional(:vector_stores) => list(%{ optional(:chunking_strategy) => %{required(:type) => :auto | String.t()} | %{ required(:static) => %{ required(:chunk_overlap_tokens) => integer(), required(:max_chunk_size_tokens) => integer() }, required(:type) => :static | String.t() }, optional(:file_ids) => list(String.t()), optional(:metadata) => ExOpenAI.Components.Metadata.input() }) } } | nil`
    """
    (
      @type create_thread_opt() ::
              (({:messages, list(ExOpenAI.Components.CreateMessageRequest.input())}
                | {:metadata, ExOpenAI.Components.Metadata.input()})
               | {:tool_resources,
                  %{
                    optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                    optional(:file_search) => %{
                      optional(:vector_store_ids) => list(String.t()),
                      optional(:vector_stores) =>
                        list(%{
                          optional(:chunking_strategy) =>
                            %{required(:type) => :auto | String.t()}
                            | %{
                                required(:static) => %{
                                  required(:chunk_overlap_tokens) => integer(),
                                  required(:max_chunk_size_tokens) => integer()
                                },
                                required(:type) => :static | String.t()
                              },
                          optional(:file_ids) => list(String.t()),
                          optional(:metadata) => ExOpenAI.Components.Metadata.input()
                        })
                    }
                  }
                  | nil})
              | ExOpenAI.request_option()
      @spec create_thread(opts :: [create_thread_opt()]) ::
              {:ok, ExOpenAI.Components.ThreadObject.t()} | {:error, any()}
    )

    def create_thread(opts \\ []) do
      url = "/threads"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:messages, :metadata, :tool_resources])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:messages, :metadata, :tool_resources] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadObject"}
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
    Create a thread and run it in one request.

    ## Parameters

    * `assistant_id` - **required** - `String.t()`
      The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.

    ## Options

    * `instructions` - **optional** - `String.t() | nil`
      Override the default system message of the assistant. This is useful for modifying the behavior on a per-run basis.

    * `max_completion_tokens` - **optional** - `integer() | nil`
      The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
      Constraints: minimum: 256

    * `max_prompt_tokens` - **optional** - `integer() | nil`
      The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
      Constraints: minimum: 256

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `model` - **optional** - `String.t() | :"gpt-5" | :"gpt-5-mini" | :"gpt-5-nano" | :"gpt-5-2025-08-07" | :"gpt-5-mini-2025-08-07" | :"gpt-5-nano-2025-08-07" | :"gpt-4.1" | :"gpt-4.1-mini" | :"gpt-4.1-nano" | :"gpt-4.1-2025-04-14" | :"gpt-4.1-mini-2025-04-14" | :"gpt-4.1-nano-2025-04-14" | :"gpt-4o" | :"gpt-4o-2024-11-20" | :"gpt-4o-2024-08-06" | :"gpt-4o-2024-05-13" | :"gpt-4o-mini" | :"gpt-4o-mini-2024-07-18" | :"gpt-4.5-preview" | :"gpt-4.5-preview-2025-02-27" | :"gpt-4-turbo" | :"gpt-4-turbo-2024-04-09" | :"gpt-4-0125-preview" | :"gpt-4-turbo-preview" | :"gpt-4-1106-preview" | :"gpt-4-vision-preview" | :"gpt-4" | :"gpt-4-0314" | :"gpt-4-0613" | :"gpt-4-32k" | :"gpt-4-32k-0314" | :"gpt-4-32k-0613" | :"gpt-3.5-turbo" | :"gpt-3.5-turbo-16k" | :"gpt-3.5-turbo-0613" | :"gpt-3.5-turbo-1106" | :"gpt-3.5-turbo-0125" | :"gpt-3.5-turbo-16k-0613" | String.t() | nil`
      The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
      Example: `"gpt-4o"`

    * `parallel_tool_calls` - **optional** - `ExOpenAI.Components.ParallelToolCalls.input()`

    * `response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil`

    * `stream` - **optional** - `boolean() | nil`
      If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.

    * `temperature` - **optional** - `number() | nil`
      What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
      Default: `1`
      Constraints: minimum: 0, maximum: 2
      Example: `1`

    * `thread` - **optional** - `ExOpenAI.Components.CreateThreadRequest.input()`

    * `tool_choice` - **optional** - `map()`

    * `tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`
      A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.

    * `tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.input() | ExOpenAI.Components.AssistantToolsFileSearch.input() | ExOpenAI.Components.AssistantToolsFunction.input() ) | nil`
      Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
      Constraints: maxItems: 20

    * `top_p` - **optional** - `number() | nil`
      An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.

    We generally recommend altering this or temperature but not both.
      Default: `1`
      Constraints: minimum: 0, maximum: 1
      Example: `1`

    * `truncation_strategy` - **optional** - `%{ optional(:last_messages) => integer() | nil, required(:type) => :auto | :last_messages | String.t() }`
    """
    (
      @type create_thread_and_run_opt() ::
              (((((((((((((({:instructions, String.t() | nil}
                            | {:max_completion_tokens, integer() | nil})
                           | {:max_prompt_tokens, integer() | nil})
                          | {:metadata, ExOpenAI.Components.Metadata.input()})
                         | {:model,
                            (String.t()
                             | (((((((((((((((((((((((((((((((((((((:"gpt-5" | :"gpt-5-mini")
                                                                   | :"gpt-5-nano")
                                                                  | :"gpt-5-2025-08-07")
                                                                 | :"gpt-5-mini-2025-08-07")
                                                                | :"gpt-5-nano-2025-08-07")
                                                               | :"gpt-4.1")
                                                              | :"gpt-4.1-mini")
                                                             | :"gpt-4.1-nano")
                                                            | :"gpt-4.1-2025-04-14")
                                                           | :"gpt-4.1-mini-2025-04-14")
                                                          | :"gpt-4.1-nano-2025-04-14")
                                                         | :"gpt-4o")
                                                        | :"gpt-4o-2024-11-20")
                                                       | :"gpt-4o-2024-08-06")
                                                      | :"gpt-4o-2024-05-13")
                                                     | :"gpt-4o-mini")
                                                    | :"gpt-4o-mini-2024-07-18")
                                                   | :"gpt-4.5-preview")
                                                  | :"gpt-4.5-preview-2025-02-27")
                                                 | :"gpt-4-turbo")
                                                | :"gpt-4-turbo-2024-04-09")
                                               | :"gpt-4-0125-preview")
                                              | :"gpt-4-turbo-preview")
                                             | :"gpt-4-1106-preview")
                                            | :"gpt-4-vision-preview")
                                           | :"gpt-4")
                                          | :"gpt-4-0314")
                                         | :"gpt-4-0613")
                                        | :"gpt-4-32k")
                                       | :"gpt-4-32k-0314")
                                      | :"gpt-4-32k-0613")
                                     | :"gpt-3.5-turbo")
                                    | :"gpt-3.5-turbo-16k")
                                   | :"gpt-3.5-turbo-0613")
                                  | :"gpt-3.5-turbo-1106")
                                 | :"gpt-3.5-turbo-0125")
                                | :"gpt-3.5-turbo-16k-0613")
                             | String.t())
                            | nil})
                        | {:parallel_tool_calls, ExOpenAI.Components.ParallelToolCalls.input()})
                       | {:response_format,
                          ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil})
                      | {:stream, boolean() | nil})
                     | {:temperature, number() | nil})
                    | {:thread, ExOpenAI.Components.CreateThreadRequest.input()})
                   | {:tool_choice, map()})
                  | {:tool_resources,
                     %{
                       optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                       optional(:file_search) => %{
                         optional(:vector_store_ids) => list(String.t())
                       }
                     }
                     | nil})
                 | {:tools,
                    list(
                      (ExOpenAI.Components.AssistantToolsCode.input()
                       | ExOpenAI.Components.AssistantToolsFileSearch.input())
                      | ExOpenAI.Components.AssistantToolsFunction.input()
                    )
                    | nil})
                | {:top_p, number() | nil})
               | {:truncation_strategy,
                  %{
                    optional(:last_messages) => integer() | nil,
                    required(:type) => (:auto | :last_messages) | String.t()
                  }})
              | ExOpenAI.request_option()
      @spec create_thread_and_run(
              assistant_id :: String.t(),
              opts :: [create_thread_and_run_opt()]
            ) :: {:ok, ExOpenAI.Components.RunObject.t() | reference()} | {:error, any()}
    )

    def create_thread_and_run(assistant_id, opts \\ []) do
      url = "/threads/runs"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [assistant_id: assistant_id]

      optional_body_params =
        Keyword.take(opts, [
          :instructions,
          :max_completion_tokens,
          :max_prompt_tokens,
          :metadata,
          :model,
          :parallel_tool_calls,
          :response_format,
          :stream,
          :temperature,
          :thread,
          :tool_choice,
          :tool_resources,
          :tools,
          :top_p,
          :truncation_strategy
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :instructions,
          :max_completion_tokens,
          :max_prompt_tokens,
          :metadata,
          :model,
          :parallel_tool_calls,
          :response_format,
          :stream,
          :temperature,
          :thread,
          :tool_choice,
          :tool_resources,
          :tools,
          :top_p,
          :truncation_strategy
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
    Delete a thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to delete.
    """
    (
      @type delete_thread_opt() :: ExOpenAI.request_option()
      @spec delete_thread(thread_id :: String.t(), opts :: [delete_thread_opt()]) ::
              {:ok, ExOpenAI.Components.DeleteThreadResponse.t()} | {:error, any()}
    )

    def delete_thread(thread_id, opts \\ []) do
      url = "/threads/{thread_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeleteThreadResponse"}
        )
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
    Retrieves a thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to retrieve.
    """
    (
      @type get_thread_opt() :: ExOpenAI.request_option()
      @spec get_thread(thread_id :: String.t(), opts :: [get_thread_opt()]) ::
              {:ok, ExOpenAI.Components.ThreadObject.t()} | {:error, any()}
    )

    def get_thread(thread_id, opts \\ []) do
      url = "/threads/{thread_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadObject"}
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
    Modifies a thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to modify. Only the `metadata` can be modified.

    ## Options

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`
    """
    (
      @type modify_thread_opt() ::
              ({:metadata, ExOpenAI.Components.Metadata.input()}
               | {:tool_resources,
                  %{
                    optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                    optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
                  }
                  | nil})
              | ExOpenAI.request_option()
      @spec modify_thread(thread_id :: String.t(), opts :: [modify_thread_opt()]) ::
              {:ok, ExOpenAI.Components.ThreadObject.t()} | {:error, any()}
    )

    def modify_thread(thread_id, opts \\ []) do
      url = "/threads/{thread_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:metadata, :tool_resources])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:metadata, :tool_resources] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadObject"}
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
    Returns a list of messages for a given thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) the messages belong to.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `:run_id` - **optional** - `String.t()`
      Filter messages by the run ID that generated them.
    """
    (
      @type list_messages_opt() ::
              (((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                 | {:after, String.t()})
                | {:before, String.t()})
               | {:run_id, String.t()})
              | ExOpenAI.request_option()
      @spec list_messages(thread_id :: String.t(), opts :: [list_messages_opt()]) ::
              {:ok, ExOpenAI.Components.ListMessagesResponse.t()} | {:error, any()}
    )

    def list_messages(thread_id, opts \\ []) do
      url = "/threads/{thread_id}/messages"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before, :run_id])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :before, :limit, :order, :run_id] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListMessagesResponse"}
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
    Create a message.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) to create a message for.

    * `content` - **required** - `String.t() | list( ExOpenAI.Components.MessageContentImageFileObject.input() | ExOpenAI.Components.MessageContentImageUrlObject.input() | ExOpenAI.Components.MessageRequestContentTextObject.input() )`

    * `role` - **required** - `:user | :assistant | String.t()`
      The role of the entity that is creating the message. Allowed values include:
    - `user`: Indicates the message is sent by an actual user and should be used in most cases to represent user-generated messages.
    - `assistant`: Indicates the message is generated by the assistant. Use this value to insert messages from the assistant into the conversation.
      Allowed values: `"user"`, `"assistant"`

    ## Options

    * `attachments` - **optional** - `list(%{ optional(:file_id) => String.t(), optional(:tools) => list( ExOpenAI.Components.AssistantToolsCode.input() | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.input() ) }) | nil`

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`
    """
    (
      @type create_message_opt() ::
              ({:attachments,
                list(%{
                  optional(:file_id) => String.t(),
                  optional(:tools) =>
                    list(
                      ExOpenAI.Components.AssistantToolsCode.input()
                      | ExOpenAI.Components.AssistantToolsFileSearchTypeOnly.input()
                    )
                })
                | nil}
               | {:metadata, ExOpenAI.Components.Metadata.input()})
              | ExOpenAI.request_option()
      @spec create_message(
              content ::
                String.t()
                | list(
                    (ExOpenAI.Components.MessageContentImageFileObject.input()
                     | ExOpenAI.Components.MessageContentImageUrlObject.input())
                    | ExOpenAI.Components.MessageRequestContentTextObject.input()
                  ),
              role :: (:user | :assistant) | String.t(),
              thread_id :: String.t(),
              opts :: [create_message_opt()]
            ) :: {:ok, ExOpenAI.Components.MessageObject.t()} | {:error, any()}
    )

    def create_message(content, role, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/messages"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [content: content, role: role]
      optional_body_params = Keyword.take(opts, [:attachments, :metadata])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:attachments, :metadata] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/MessageObject"}
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
    Deletes a message.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to which this message belongs.

    * `:message_id` - **required** - `String.t()`
      The ID of the message to delete.
    """
    (
      @type delete_message_opt() :: ExOpenAI.request_option()
      @spec delete_message(
              message_id :: String.t(),
              thread_id :: String.t(),
              opts :: [delete_message_opt()]
            ) :: {:ok, ExOpenAI.Components.DeleteMessageResponse.t()} | {:error, any()}
    )

    def delete_message(message_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/messages/{message_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{message_id}", to_string(message_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeleteMessageResponse"}
        )
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
    Retrieve a message.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) to which this message belongs.

    * `:message_id` - **required** - `String.t()`
      The ID of the message to retrieve.
    """
    (
      @type get_message_opt() :: ExOpenAI.request_option()
      @spec get_message(
              message_id :: String.t(),
              thread_id :: String.t(),
              opts :: [get_message_opt()]
            ) :: {:ok, ExOpenAI.Components.MessageObject.t()} | {:error, any()}
    )

    def get_message(message_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/messages/{message_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{message_id}", to_string(message_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/MessageObject"}
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
    Modifies a message.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to which this message belongs.

    * `:message_id` - **required** - `String.t()`
      The ID of the message to modify.

    ## Options

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`
    """
    (
      @type modify_message_opt() ::
              {:metadata, ExOpenAI.Components.Metadata.input()} | ExOpenAI.request_option()
      @spec modify_message(
              message_id :: String.t(),
              thread_id :: String.t(),
              opts :: [modify_message_opt()]
            ) :: {:ok, ExOpenAI.Components.MessageObject.t()} | {:error, any()}
    )

    def modify_message(message_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/messages/{message_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{message_id}", to_string(message_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:metadata])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:metadata] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/MessageObject"}
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
    Returns a list of runs belonging to a thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread the run belongs to.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    """
    (
      @type list_runs_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_runs(thread_id :: String.t(), opts :: [list_runs_opt()]) ::
              {:ok, ExOpenAI.Components.ListRunsResponse.t()} | {:error, any()}
    )

    def list_runs(thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListRunsResponse"}
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
    Create a run.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to run.

    * `assistant_id` - **required** - `String.t()`
      The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.

    ## Options

    * `:include[]` - **optional** - `list(:"step_details.tool_calls[*].file_search.results[*].content" | String.t())`
      A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.

    See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.

    * `additional_instructions` - **optional** - `String.t() | nil`
      Appends additional instructions at the end of the instructions for the run. This is useful for modifying the behavior on a per-run basis without overriding other instructions.

    * `additional_messages` - **optional** - `list(ExOpenAI.Components.CreateMessageRequest.input()) | nil`
      Adds additional messages to the thread before creating the run.

    * `instructions` - **optional** - `String.t() | nil`
      Overrides the [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant) of the assistant. This is useful for modifying the behavior on a per-run basis.

    * `max_completion_tokens` - **optional** - `integer() | nil`
      The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
      Constraints: minimum: 256

    * `max_prompt_tokens` - **optional** - `integer() | nil`
      The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
      Constraints: minimum: 256

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `model` - **optional** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.input() | nil`
      The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
      Example: `"gpt-4o"`

    * `parallel_tool_calls` - **optional** - `ExOpenAI.Components.ParallelToolCalls.input()`

    * `reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.input()`

    * `response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil`

    * `stream` - **optional** - `boolean() | nil`
      If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.

    * `temperature` - **optional** - `number() | nil`
      What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
      Default: `1`
      Constraints: minimum: 0, maximum: 2
      Example: `1`

    * `tool_choice` - **optional** - `map()`

    * `tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.input() | ExOpenAI.Components.AssistantToolsFileSearch.input() | ExOpenAI.Components.AssistantToolsFunction.input() ) | nil`
      Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
      Constraints: maxItems: 20

    * `top_p` - **optional** - `number() | nil`
      An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.

    We generally recommend altering this or temperature but not both.
      Default: `1`
      Constraints: minimum: 0, maximum: 1
      Example: `1`

    * `truncation_strategy` - **optional** - `%{ optional(:last_messages) => integer() | nil, required(:type) => :auto | :last_messages | String.t() }`
    """
    (
      @type create_run_opt() ::
              (((((((((((((((({:"include[]",
                               list(
                                 :"step_details.tool_calls[*].file_search.results[*].content"
                                 | String.t()
                               )}
                              | {:additional_instructions, String.t() | nil})
                             | {:additional_messages,
                                list(ExOpenAI.Components.CreateMessageRequest.input()) | nil})
                            | {:instructions, String.t() | nil})
                           | {:max_completion_tokens, integer() | nil})
                          | {:max_prompt_tokens, integer() | nil})
                         | {:metadata, ExOpenAI.Components.Metadata.input()})
                        | {:model,
                           (String.t() | ExOpenAI.Components.AssistantSupportedModels.input())
                           | nil})
                       | {:parallel_tool_calls, ExOpenAI.Components.ParallelToolCalls.input()})
                      | {:reasoning_effort, ExOpenAI.Components.ReasoningEffort.input()})
                     | {:response_format,
                        ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil})
                    | {:stream, boolean() | nil})
                   | {:temperature, number() | nil})
                  | {:tool_choice, map()})
                 | {:tools,
                    list(
                      (ExOpenAI.Components.AssistantToolsCode.input()
                       | ExOpenAI.Components.AssistantToolsFileSearch.input())
                      | ExOpenAI.Components.AssistantToolsFunction.input()
                    )
                    | nil})
                | {:top_p, number() | nil})
               | {:truncation_strategy,
                  %{
                    optional(:last_messages) => integer() | nil,
                    required(:type) => (:auto | :last_messages) | String.t()
                  }})
              | ExOpenAI.request_option()
      @spec create_run(
              assistant_id :: String.t(),
              thread_id :: String.t(),
              opts :: [create_run_opt()]
            ) :: {:ok, ExOpenAI.Components.RunObject.t() | reference()} | {:error, any()}
    )

    def create_run(assistant_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [:"include[]"])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [assistant_id: assistant_id]

      optional_body_params =
        Keyword.take(opts, [
          :additional_instructions,
          :additional_messages,
          :instructions,
          :max_completion_tokens,
          :max_prompt_tokens,
          :metadata,
          :model,
          :parallel_tool_calls,
          :reasoning_effort,
          :response_format,
          :stream,
          :temperature,
          :tool_choice,
          :tools,
          :top_p,
          :truncation_strategy
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :additional_instructions,
          :additional_messages,
          :"include[]",
          :instructions,
          :max_completion_tokens,
          :max_prompt_tokens,
          :metadata,
          :model,
          :parallel_tool_calls,
          :reasoning_effort,
          :response_format,
          :stream,
          :temperature,
          :tool_choice,
          :tools,
          :top_p,
          :truncation_strategy
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
    Retrieves a run.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.

    * `:run_id` - **required** - `String.t()`
      The ID of the run to retrieve.
    """
    (
      @type get_run_opt() :: ExOpenAI.request_option()
      @spec get_run(run_id :: String.t(), thread_id :: String.t(), opts :: [get_run_opt()]) ::
              {:ok, ExOpenAI.Components.RunObject.t()} | {:error, any()}
    )

    def get_run(run_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
    Modifies a run.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.

    * `:run_id` - **required** - `String.t()`
      The ID of the run to modify.

    ## Options

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`
    """
    (
      @type modify_run_opt() ::
              {:metadata, ExOpenAI.Components.Metadata.input()} | ExOpenAI.request_option()
      @spec modify_run(run_id :: String.t(), thread_id :: String.t(), opts :: [modify_run_opt()]) ::
              {:ok, ExOpenAI.Components.RunObject.t()} | {:error, any()}
    )

    def modify_run(run_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:metadata])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:metadata] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
    Cancels a run that is `in_progress`.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to which this run belongs.

    * `:run_id` - **required** - `String.t()`
      The ID of the run to cancel.
    """
    (
      @type cancel_run_opt() :: ExOpenAI.request_option()
      @spec cancel_run(run_id :: String.t(), thread_id :: String.t(), opts :: [cancel_run_opt()]) ::
              {:ok, ExOpenAI.Components.RunObject.t()} | {:error, any()}
    )

    def cancel_run(run_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}/cancel"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
    Returns a list of run steps belonging to a run.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread the run and run steps belong to.

    * `:run_id` - **required** - `String.t()`
      The ID of the run the run steps belong to.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `:include[]` - **optional** - `list(:"step_details.tool_calls[*].file_search.results[*].content" | String.t())`
      A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.

    See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
    """
    (
      @type list_run_steps_opt() ::
              (((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                 | {:after, String.t()})
                | {:before, String.t()})
               | {:"include[]",
                  list(:"step_details.tool_calls[*].file_search.results[*].content" | String.t())})
              | ExOpenAI.request_option()
      @spec list_run_steps(
              run_id :: String.t(),
              thread_id :: String.t(),
              opts :: [list_run_steps_opt()]
            ) :: {:ok, ExOpenAI.Components.ListRunStepsResponse.t()} | {:error, any()}
    )

    def list_run_steps(run_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}/steps"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before, :"include[]"])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :before, :"include[]", :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListRunStepsResponse"}
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
    Retrieves a run step.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the thread to which the run and run step belongs.

    * `:run_id` - **required** - `String.t()`
      The ID of the run to which the run step belongs.

    * `:step_id` - **required** - `String.t()`
      The ID of the run step to retrieve.

    ## Options

    * `:include[]` - **optional** - `list(:"step_details.tool_calls[*].file_search.results[*].content" | String.t())`
      A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.

    See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
    """
    (
      @type get_run_step_opt() ::
              {:"include[]",
               list(:"step_details.tool_calls[*].file_search.results[*].content" | String.t())}
              | ExOpenAI.request_option()
      @spec get_run_step(
              run_id :: String.t(),
              step_id :: String.t(),
              thread_id :: String.t(),
              opts :: [get_run_step_opt()]
            ) :: {:ok, ExOpenAI.Components.RunStepObject.t()} | {:error, any()}
    )

    def get_run_step(run_id, step_id, thread_id, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}/steps/{step_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      url = String.replace(url, "{step_id}", to_string(step_id))
      query_params = Keyword.take(opts, [:"include[]"])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:"include[]"] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunStepObject"}
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
    When a run has the `status: "requires_action"` and `required_action.type` is `submit_tool_outputs`, this endpoint can be used to submit the outputs from the tool calls once they're all completed. All outputs must be submitted in a single request.


    ## Parameters

    * `:thread_id` - **required** - `String.t()`
      The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) to which this run belongs.

    * `:run_id` - **required** - `String.t()`
      The ID of the run that requires the tool output submission.

    * `tool_outputs` - **required** - `list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()})`
      A list of tools for which the outputs are being submitted.

    ## Options

    * `stream` - **optional** - `boolean() | nil`
    """
    (
      @type submit_tool_ouputs_to_run_opt() ::
              {:stream, boolean() | nil} | ExOpenAI.request_option()
      @spec submit_tool_ouputs_to_run(
              run_id :: String.t(),
              thread_id :: String.t(),
              tool_outputs ::
                list(%{optional(:output) => String.t(), optional(:tool_call_id) => String.t()}),
              opts :: [submit_tool_ouputs_to_run_opt()]
            ) :: {:ok, ExOpenAI.Components.RunObject.t() | reference()} | {:error, any()}
    )

    def submit_tool_ouputs_to_run(run_id, thread_id, tool_outputs, opts \\ []) do
      url = "/threads/{thread_id}/runs/{run_id}/submit_tool_outputs"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [tool_outputs: tool_outputs]
      optional_body_params = Keyword.take(opts, [:stream])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:stream] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunObject"}
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
