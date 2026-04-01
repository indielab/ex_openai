defmodule ExOpenAI.Models do
  @moduledoc false
  (
    @doc """
    Lists the currently available models, and provides basic information about each one such as the owner and availability.
    """
    @spec list_models(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.ListModelsResponse.t()} | {:error, any()}
    def list_models(opts \\ []) do
      url = "/models"
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
              ref: "#/components/schemas/ListModelsResponse",
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
    Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.

    ## Parameters

    * `:model` - **required** - `String.t()`  
      The model to delete
    """
    @spec delete_model(model :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeleteModelResponse.t()} | {:error, any()}
    def delete_model(model, opts \\ []) do
      url = "/models/{model}"
      url = String.replace(url, "{model}", to_string(model))
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
              ref: "#/components/schemas/DeleteModelResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves a model instance, providing basic information about the model such as the owner and permissioning.

    ## Parameters

    * `:model` - **required** - `String.t()`  
      The ID of the model to use for this request
    """
    @spec retrieve_model(model :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Model.t()} | {:error, any()}
    def retrieve_model(model, opts \\ []) do
      url = "/models/{model}"
      url = String.replace(url, "{model}", to_string(model))
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
              ref: "#/components/schemas/Model",
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
