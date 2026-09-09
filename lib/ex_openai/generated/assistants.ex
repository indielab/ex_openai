defmodule ExOpenAI.Assistants do
  @moduledoc """
  Functions for the OpenAI assistants API.
  """
  (
    @doc """
    Returns a list of assistants.

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
      @type list_assistants_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_assistants(opts :: [list_assistants_opt()]) ::
              {:ok, ExOpenAI.Components.ListAssistantsResponse.t()} | {:error, any()}
    )

    def list_assistants(opts \\ []) do
      url = "/assistants"
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListAssistantsResponse"}
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
    Create an assistant with a model and instructions.

    ## Parameters

    * `model` - **required** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.input()`
      ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
      Example: `"gpt-4o"`

    ## Options

    * `description` - **optional** - `String.t() | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `name` - **optional** - `String.t() | nil`

    * `reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.input()`

    * `response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil`

    * `temperature` - **optional** - `number() | nil`

    * `tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{ optional(:vector_store_ids) => list(String.t()), optional(:vector_stores) => list(%{ optional(:chunking_strategy) => %{required(:type) => :auto | String.t()} | %{ required(:static) => %{ required(:chunk_overlap_tokens) => integer(), required(:max_chunk_size_tokens) => integer() }, required(:type) => :static | String.t() }, optional(:file_ids) => list(String.t()), optional(:metadata) => ExOpenAI.Components.Metadata.input() }) } } | nil`

    * `tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.input() | ExOpenAI.Components.AssistantToolsFileSearch.input() | ExOpenAI.Components.AssistantToolsFunction.input() )`
      A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
      Default: `[]`
      Constraints: maxItems: 128

    * `top_p` - **optional** - `number() | nil`
    """
    (
      @type create_assistant_opt() ::
              ((((((((({:description, String.t() | nil} | {:instructions, String.t() | nil})
                      | {:metadata, ExOpenAI.Components.Metadata.input()})
                     | {:name, String.t() | nil})
                    | {:reasoning_effort, ExOpenAI.Components.ReasoningEffort.input()})
                   | {:response_format,
                      ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil})
                  | {:temperature, number() | nil})
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
                | {:tools,
                   list(
                     (ExOpenAI.Components.AssistantToolsCode.input()
                      | ExOpenAI.Components.AssistantToolsFileSearch.input())
                     | ExOpenAI.Components.AssistantToolsFunction.input()
                   )})
               | {:top_p, number() | nil})
              | ExOpenAI.request_option()
      @spec create_assistant(
              model :: String.t() | ExOpenAI.Components.AssistantSupportedModels.input(),
              opts :: [create_assistant_opt()]
            ) :: {:ok, ExOpenAI.Components.AssistantObject.t()} | {:error, any()}
    )

    def create_assistant(model, opts \\ []) do
      url = "/assistants"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [model: model]

      optional_body_params =
        Keyword.take(opts, [
          :description,
          :instructions,
          :metadata,
          :name,
          :reasoning_effort,
          :response_format,
          :temperature,
          :tool_resources,
          :tools,
          :top_p
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :description,
          :instructions,
          :metadata,
          :name,
          :reasoning_effort,
          :response_format,
          :temperature,
          :tool_resources,
          :tools,
          :top_p
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AssistantObject"}
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
    Delete an assistant.

    ## Parameters

    * `:assistant_id` - **required** - `String.t()`
      The ID of the assistant to delete.
    """
    (
      @type delete_assistant_opt() :: ExOpenAI.request_option()
      @spec delete_assistant(assistant_id :: String.t(), opts :: [delete_assistant_opt()]) ::
              {:ok, ExOpenAI.Components.DeleteAssistantResponse.t()} | {:error, any()}
    )

    def delete_assistant(assistant_id, opts \\ []) do
      url = "/assistants/{assistant_id}"
      url = String.replace(url, "{assistant_id}", to_string(assistant_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeleteAssistantResponse"}
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
    Retrieves an assistant.

    ## Parameters

    * `:assistant_id` - **required** - `String.t()`
      The ID of the assistant to retrieve.
    """
    (
      @type get_assistant_opt() :: ExOpenAI.request_option()
      @spec get_assistant(assistant_id :: String.t(), opts :: [get_assistant_opt()]) ::
              {:ok, ExOpenAI.Components.AssistantObject.t()} | {:error, any()}
    )

    def get_assistant(assistant_id, opts \\ []) do
      url = "/assistants/{assistant_id}"
      url = String.replace(url, "{assistant_id}", to_string(assistant_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AssistantObject"}
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
    Modifies an assistant.

    ## Parameters

    * `:assistant_id` - **required** - `String.t()`
      The ID of the assistant to modify.

    ## Options

    * `description` - **optional** - `String.t() | nil`

    * `instructions` - **optional** - `String.t() | nil`

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `model` - **optional** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.input()`
      ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.

    * `name` - **optional** - `String.t() | nil`

    * `reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.input()`

    * `response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil`

    * `temperature` - **optional** - `number() | nil`

    * `tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`

    * `tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.input() | ExOpenAI.Components.AssistantToolsFileSearch.input() | ExOpenAI.Components.AssistantToolsFunction.input() )`
      A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
      Default: `[]`
      Constraints: maxItems: 128

    * `top_p` - **optional** - `number() | nil`
    """
    (
      @type modify_assistant_opt() ::
              (((((((((({:description, String.t() | nil} | {:instructions, String.t() | nil})
                       | {:metadata, ExOpenAI.Components.Metadata.input()})
                      | {:model,
                         String.t() | ExOpenAI.Components.AssistantSupportedModels.input()})
                     | {:name, String.t() | nil})
                    | {:reasoning_effort, ExOpenAI.Components.ReasoningEffort.input()})
                   | {:response_format,
                      ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil})
                  | {:temperature, number() | nil})
                 | {:tool_resources,
                    %{
                      optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                      optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
                    }
                    | nil})
                | {:tools,
                   list(
                     (ExOpenAI.Components.AssistantToolsCode.input()
                      | ExOpenAI.Components.AssistantToolsFileSearch.input())
                     | ExOpenAI.Components.AssistantToolsFunction.input()
                   )})
               | {:top_p, number() | nil})
              | ExOpenAI.request_option()
      @spec modify_assistant(assistant_id :: String.t(), opts :: [modify_assistant_opt()]) ::
              {:ok, ExOpenAI.Components.AssistantObject.t()} | {:error, any()}
    )

    def modify_assistant(assistant_id, opts \\ []) do
      url = "/assistants/{assistant_id}"
      url = String.replace(url, "{assistant_id}", to_string(assistant_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :description,
          :instructions,
          :metadata,
          :model,
          :name,
          :reasoning_effort,
          :response_format,
          :temperature,
          :tool_resources,
          :tools,
          :top_p
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :description,
          :instructions,
          :metadata,
          :model,
          :name,
          :reasoning_effort,
          :response_format,
          :temperature,
          :tool_resources,
          :tools,
          :top_p
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AssistantObject"}
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
end
