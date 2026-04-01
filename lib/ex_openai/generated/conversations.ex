defmodule ExOpenAI.Conversations do
  @moduledoc false
  (
    @doc """
    Create a conversation.

    ## Options

    * `items` - **optional** - `[any()] | any()`

    * `metadata` - **optional** - `any() | any()`
    """
    (
      @type create_conversation_opt() ::
              {:items, list(ExOpenAI.Components.InputItem.t()) | any()}
              | {:metadata, ExOpenAI.Components.Metadata.t() | any()}
      @spec create_conversation(opts :: [create_conversation_opt()]) ::
              {:ok, ExOpenAI.Components.ConversationResource.t()} | {:error, any()}
    )

    def create_conversation(opts \\ []) do
      url = "/conversations"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:items, :metadata])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:items, :metadata] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationResource"}
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
    Delete a conversation. Items in the conversation will not be deleted.

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation to delete.
    """
    (
      nil

      @spec delete_conversation(conversation_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.DeletedConversationResource.t()} | {:error, any()}
    )

    def delete_conversation(conversation_id, opts \\ []) do
      url = "/conversations/{conversation_id}"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
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
            ref: "#/components/schemas/DeletedConversationResource"
          }
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
    Get a conversation

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation to retrieve.
    """
    (
      nil

      @spec get_conversation(conversation_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.ConversationResource.t()} | {:error, any()}
    )

    def get_conversation(conversation_id, opts \\ []) do
      url = "/conversations/{conversation_id}"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationResource"}
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
    Update a conversation

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation to update.

    * `metadata` - **required** - `any()`  
      Set of 16 key-value pairs that can be attached to an object. This can be         useful for storing additional information about the object in a structured         format, and querying for objects via API or the dashboard.
            Keys are strings with a maximum length of 64 characters. Values are strings         with a maximum length of 512 characters.
    """
    (
      nil

      @spec update_conversation(conversation_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.ConversationResource.t()} | {:error, any()}
    )

    def update_conversation(conversation_id, opts \\ []) do
      url = "/conversations/{conversation_id}"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationResource"}
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
    List all items for a conversation with the given ID.

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation to list items for.

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
      Specify additional output data to include in the model response. Currently supported values are:
    - `web_search_call.action.sources`: Include the sources of the web search tool call.
    - `code_interpreter_call.outputs`: Includes the outputs of python code execution in code interpreter tool call items.
    - `computer_call_output.output.image_url`: Include image urls from the computer call output.
    - `file_search_call.results`: Include the search results of the file search tool call.
    - `message.input_image.image_url`: Include image urls from the input message.
    - `message.output_text.logprobs`: Include logprobs with assistant messages.
    - `reasoning.encrypted_content`: Includes an encrypted version of reasoning tokens in reasoning item outputs. This enables reasoning items to be used in multi-turn conversations when using the Responses API statelessly (like when the `store` parameter is set to `false`, or when an organization is enrolled in the zero data retention program).
    """
    (
      @type list_conversation_items_opt() ::
              (({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
              | {:include, any()}
      @spec list_conversation_items(
              conversation_id :: String.t(),
              opts :: [list_conversation_items_opt()]
            ) :: {:ok, ExOpenAI.Components.ConversationItemList.t()} | {:error, any()}
    )

    def list_conversation_items(conversation_id, opts \\ []) do
      url = "/conversations/{conversation_id}/items"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationItemList"}
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
    Create items in a conversation with the given ID.

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation to add the item to.

    ## Options

    * `:include` - **optional** - `any()`  
      Additional fields to include in the response. See the `include`
    parameter for [listing Conversation items above](/docs/api-reference/conversations/list-items#conversations_list_items-include) for more information.
    """
    (
      @type create_conversation_items_opt() :: {:include, any()}
      @spec create_conversation_items(
              conversation_id :: String.t(),
              opts :: [create_conversation_items_opt()]
            ) :: {:ok, ExOpenAI.Components.ConversationItemList.t()} | {:error, any()}
    )

    def create_conversation_items(conversation_id, opts \\ []) do
      url = "/conversations/{conversation_id}/items"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
      query_params = Keyword.take(opts, [:include])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:include])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:include] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationItemList"}
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
    Delete an item from a conversation with the given IDs.

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation that contains the item.

    * `:item_id` - **required** - `String.t()`  
      The ID of the item to delete.
    """
    (
      nil

      @spec delete_conversation_item(
              conversation_id :: String.t(),
              item_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.ConversationResource.t()} | {:error, any()}
    )

    def delete_conversation_item(conversation_id, item_id, opts \\ []) do
      url = "/conversations/{conversation_id}/items/{item_id}"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
      url = String.replace(url, "{item_id}", to_string(item_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationResource"}
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
    Get a single item from a conversation with the given IDs.

    ## Parameters

    * `:conversation_id` - **required** - `String.t()`  
      The ID of the conversation that contains the item.

    * `:item_id` - **required** - `String.t()`  
      The ID of the item to retrieve.

    ## Options

    * `:include` - **optional** - `any()`  
      Additional fields to include in the response. See the `include`
    parameter for [listing Conversation items above](/docs/api-reference/conversations/list-items#conversations_list_items-include) for more information.
    """
    (
      @type get_conversation_item_opt() :: {:include, any()}
      @spec get_conversation_item(
              conversation_id :: String.t(),
              item_id :: String.t(),
              opts :: [get_conversation_item_opt()]
            ) :: {:ok, ExOpenAI.Components.ConversationItem.t()} | {:error, any()}
    )

    def get_conversation_item(conversation_id, item_id, opts \\ []) do
      url = "/conversations/{conversation_id}/items/{item_id}"
      url = String.replace(url, "{conversation_id}", to_string(conversation_id))
      url = String.replace(url, "{item_id}", to_string(item_id))
      query_params = Keyword.take(opts, [:include])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:include])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:include] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ConversationItem"}
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
