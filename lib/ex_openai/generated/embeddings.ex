defmodule ExOpenAI.Embeddings do
  @moduledoc false
  (
    @doc """
    Creates an embedding vector representing the input text.

    ## Parameters

    * `input` - **required** - `String.t() | [String.t()] | [integer()] | [[integer()]]`  
      Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for all embedding models), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. In addition to the per-input token limit, all embedding  models enforce a maximum of 300,000 tokens summed across all inputs in a  single request.  
      Example: `"The quick brown fox jumped over the lazy dog"`

    * `model` - **required** - `String.t() | :"text-embedding-ada-002" | :"text-embedding-3-small" | :"text-embedding-3-large"`  
      ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.  
      Example: `"text-embedding-3-small"`

    ## Options

    * `dimensions` - **optional** - `integer()`  
      The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.  
      Constraints: minimum: 1

    * `encoding_format` - **optional** - `:float | :base64`  
      The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).  
      Allowed values: `"float"`, `"base64"`  
      Default: `"float"`  
      Example: `"float"`

    * `user` - **optional** - `String.t()`  
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).  
      Example: `"user-1234"`
    """
    @spec create_embedding(
            input :: ((String.t() | list(String.t())) | list(integer())) | list(list(integer())),
            model ::
              String.t()
              | (:"text-embedding-ada-002" | :"text-embedding-3-small")
              | :"text-embedding-3-large",
            opts :: [
              ({:dimensions, integer()} | {:encoding_format, :float | :base64})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.CreateEmbeddingResponse.t()} | {:error, any()}
    def create_embedding(input, model, opts \\ []) do
      url = "/embeddings"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [input: input, model: model]
      optional_body_params = Keyword.take(opts, [:dimensions, :encoding_format, :user])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:dimensions, :encoding_format, :user] |> Enum.reject(&(&1 == :stream))

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
              ref: "#/components/schemas/CreateEmbeddingResponse",
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
end
