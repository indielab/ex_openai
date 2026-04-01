defmodule ExOpenAI.Components.CreateEmbeddingRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateEmbeddingRequest.

  ## Fields

  * `:dimensions` - **optional** - `integer()`  
    The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.  
    Constraints: minimum: 1

  * `:encoding_format` - **optional** - `:float | :base64`  
    The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).  
    Allowed values: `"float"`, `"base64"`  
    Default: `"float"`

  * `:input` - **required** - `String.t() | [String.t()] | [integer()] | [[integer()]]`  
    Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for all embedding models), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. In addition to the per-input token limit, all embedding  models enforce a maximum of 300,000 tokens summed across all inputs in a  single request.

  * `:model` - **required** - `String.t() | :"text-embedding-ada-002" | :"text-embedding-3-small" | :"text-embedding-3-large"`  
    ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.

  * `:user` - **optional** - `String.t()`  
    A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          dimensions: integer() | nil,
          encoding_format: (:float | :base64) | nil,
          input: ((String.t() | list(String.t())) | list(integer())) | list(list(integer())),
          model:
            String.t()
            | (:"text-embedding-ada-002" | :"text-embedding-3-small")
            | :"text-embedding-3-large",
          user: String.t() | nil
        }
  defstruct [:dimensions, :encoding_format, :input, :model, :user]
end
