defmodule ExOpenAI.Chatkit do
  @moduledoc false
  (
    @doc """
    Create a ChatKit session.

    ## Parameters

    * `user` - **required** - `String.t()`  
      A free-form string that identifies your end user; ensures this Session can access other objects that have the same `user` scope.  
      Constraints: minLength: 1

    * `workflow` - **required** - `any()`  
      Workflow that powers the session.

    ## Options

    * `chatkit_configuration` - **optional** - `any()`  
      Optional overrides for ChatKit runtime configuration features

    * `expires_after` - **optional** - `any()`  
      Optional override for session expiration timing in seconds from creation. Defaults to 10 minutes.

    * `rate_limits` - **optional** - `any()`  
      Optional override for per-minute request limits. When omitted, defaults to 10.
    """
    @spec create_chat_session_method(
            opts :: [
              ({:chatkit_configuration, ExOpenAI.Components.ChatkitConfigurationParam.t()}
               | {:expires_after, ExOpenAI.Components.ExpiresAfterParam.t()})
              | {:rate_limits, ExOpenAI.Components.RateLimitsParam.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ChatSessionResource.t()} | {:error, any()}
    def create_chat_session_method(opts \\ []) do
      url = "/chatkit/sessions"
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
        Keyword.take(opts, [:chatkit_configuration, :expires_after, :rate_limits])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:chatkit_configuration, :expires_after, :rate_limits] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ChatSessionResource"}
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
    Cancel an active ChatKit session and return its most recent metadata.

    Cancelling prevents new requests from using the issued client secret.

    ## Parameters

    * `:session_id` - **required** - `String.t()`  
      Unique identifier for the ChatKit session to cancel.
    """
    @spec cancel_chat_session_method(session_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.ChatSessionResource.t()} | {:error, any()}
    def cancel_chat_session_method(session_id, opts \\ []) do
      url = "/chatkit/sessions/{session_id}/cancel"
      url = String.replace(url, "{session_id}", to_string(session_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ChatSessionResource"}
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
    List ChatKit threads with optional pagination and user filters.

    ## Options

    * `:limit` - **optional** - `integer()`  
      Maximum number of thread items to return. Defaults to 20.  
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `any()`  
      Sort order for results by creation time. Defaults to `desc`.

    * `:after` - **optional** - `String.t()`  
      List items created after this thread item ID. Defaults to null for the first page.

    * `:before` - **optional** - `String.t()`  
      List items created before this thread item ID. Defaults to null for the newest results.

    * `:user` - **optional** - `String.t()`  
      Filter threads that belong to this user identifier. Defaults to null to return all users.  
      Constraints: minLength: 1, maxLength: 512
    """
    @spec list_threads_method(
            opts :: [
              ((({:limit, integer()} | {:order, any()}) | {:after, String.t()})
               | {:before, String.t()})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ThreadListResource.t()} | {:error, any()}
    def list_threads_method(opts \\ []) do
      url = "/chatkit/threads"
      query_params = Keyword.take(opts, [:limit, :order, :after, :before, :user])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :limit, :order, :user])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :before, :limit, :order, :user] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadListResource"}
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
    Delete a ChatKit thread along with its items and stored attachments.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`  
      Identifier of the ChatKit thread to delete.
    """
    @spec delete_thread_method(thread_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedThreadResource.t()} | {:error, any()}
    def delete_thread_method(thread_id, opts \\ []) do
      url = "/chatkit/threads/{thread_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeletedThreadResource"}
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
    Retrieve a ChatKit thread by its identifier.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`  
      Identifier of the ChatKit thread to retrieve.
    """
    @spec get_thread_method(thread_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.ThreadResource.t()} | {:error, any()}
    def get_thread_method(thread_id, opts \\ []) do
      url = "/chatkit/threads/{thread_id}"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadResource"}
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
    List items that belong to a ChatKit thread.

    ## Parameters

    * `:thread_id` - **required** - `String.t()`  
      Identifier of the ChatKit thread whose items are requested.

    ## Options

    * `:limit` - **optional** - `integer()`  
      Maximum number of thread items to return. Defaults to 20.  
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `any()`  
      Sort order for results by creation time. Defaults to `desc`.

    * `:after` - **optional** - `String.t()`  
      List items created after this thread item ID. Defaults to null for the first page.

    * `:before` - **optional** - `String.t()`  
      List items created before this thread item ID. Defaults to null for the newest results.
    """
    @spec list_thread_items_method(
            thread_id :: String.t(),
            opts :: [
              (({:limit, integer()} | {:order, any()}) | {:after, String.t()})
              | {:before, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ThreadItemListResource.t()} | {:error, any()}
    def list_thread_items_method(thread_id, opts \\ []) do
      url = "/chatkit/threads/{thread_id}/items"
      url = String.replace(url, "{thread_id}", to_string(thread_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :limit, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ThreadItemListResource"}
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
