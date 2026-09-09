defmodule ExOpenAI.Embeddings do
  @moduledoc """
  Functions for the OpenAI embeddings API.
  """
  (
    @doc """
    Creates an embedding vector representing the input text.

    ## Parameters

    * `input` - **required** - `String.t() | list(String.t()) | list(integer()) | list(list(integer()))`
      Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for all embedding models), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. In addition to the per-input token limit, all embedding  models enforce a maximum of 300,000 tokens summed across all inputs in a  single request.
      Example: `"The quick brown fox jumped over the lazy dog"`

    * `model` - **required** - `String.t() | :"text-embedding-ada-002" | :"text-embedding-3-small" | :"text-embedding-3-large" | String.t()`
      ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
      Example: `"text-embedding-3-small"`

    ## Options

    * `dimensions` - **optional** - `integer()`
      The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.
      Constraints: minimum: 1

    * `encoding_format` - **optional** - `:float | :base64 | String.t()`
      The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).
      Allowed values: `"float"`, `"base64"`
      Default: `"float"`
      Example: `"float"`

    * `user` - **optional** - `String.t()`
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
      Example: `"user-1234"`
    """
    (
      @type create_embedding_opt() ::
              (({:dimensions, integer()} | {:encoding_format, (:float | :base64) | String.t()})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec create_embedding(
              input ::
                ((String.t() | list(String.t())) | list(integer())) | list(list(integer())),
              model ::
                String.t()
                | ((:"text-embedding-ada-002" | :"text-embedding-3-small")
                   | :"text-embedding-3-large")
                | String.t(),
              opts :: [create_embedding_opt()]
            ) :: {:ok, ExOpenAI.Components.CreateEmbeddingResponse.t()} | {:error, any()}
    )

    def create_embedding(input, model, opts \\ []) do
      url = "/embeddings"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [input: input, model: model]
      optional_body_params = Keyword.take(opts, [:dimensions, :encoding_format, :user])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:dimensions, :encoding_format, :user] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/CreateEmbeddingResponse"}
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
