defmodule ExOpenAI.Models do
  @moduledoc """
  Functions for the OpenAI models API.
  """
  (
    @doc """
    Lists the currently available models, and provides basic information about each one such as the owner and availability.
    """
    (
      @type list_models_opt() :: ExOpenAI.request_option()
      @spec list_models(opts :: [list_models_opt()]) ::
              {:ok, ExOpenAI.Components.ListModelsResponse.t()} | {:error, any()}
    )

    def list_models(opts \\ []) do
      url = "/models"
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListModelsResponse"}
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
    Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.

    ## Parameters

    * `:model` - **required** - `String.t()`
      The model to delete
    """
    (
      @type delete_model_opt() :: ExOpenAI.request_option()
      @spec delete_model(model :: String.t(), opts :: [delete_model_opt()]) ::
              {:ok, ExOpenAI.Components.DeleteModelResponse.t()} | {:error, any()}
    )

    def delete_model(model, opts \\ []) do
      url = "/models/{model}"
      url = String.replace(url, "{model}", to_string(model))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeleteModelResponse"}
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
    Retrieves a model instance, providing basic information about the model such as the owner and permissioning.

    ## Parameters

    * `:model` - **required** - `String.t()`
      The ID of the model to use for this request
    """
    (
      @type retrieve_model_opt() :: ExOpenAI.request_option()
      @spec retrieve_model(model :: String.t(), opts :: [retrieve_model_opt()]) ::
              {:ok, ExOpenAI.Components.Model.t()} | {:error, any()}
    )

    def retrieve_model(model, opts \\ []) do
      url = "/models/{model}"
      url = String.replace(url, "{model}", to_string(model))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Model"}
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
end
