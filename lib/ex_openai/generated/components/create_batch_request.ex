defmodule ExOpenAI.Components.CreateBatchRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateBatchRequest.

  ## Fields

  * `:completion_window` - **required** - `:"24h"`
    The time frame within which the batch should be processed. Currently only `24h` is supported.
    Allowed values: `"24h"`

  * `:endpoint` - **required** - `:"/v1/responses" | :"/v1/chat/completions" | :"/v1/embeddings" | :"/v1/completions" | :"/v1/moderations" | :"/v1/images/generations" | :"/v1/images/edits" | :"/v1/videos"`
    The endpoint to be used for all requests in the batch. Currently `/v1/responses`, `/v1/chat/completions`, `/v1/embeddings`, `/v1/completions`, `/v1/moderations`, `/v1/images/generations`, `/v1/images/edits`, and `/v1/videos` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
    Allowed values: `"/v1/responses"`, `"/v1/chat/completions"`, `"/v1/embeddings"`, `"/v1/completions"`, `"/v1/moderations"`, `"/v1/images/generations"`, `"/v1/images/edits"`, `"/v1/videos"`

  * `:input_file_id` - **required** - `String.t()`
    The ID of an uploaded file that contains requests for the new batch.

  See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.

  Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input), and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:output_expires_after` - **optional** - `ExOpenAI.Components.BatchFileExpirationAfter.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          completion_window: :"24h",
          endpoint:
            ((((((:"/v1/responses" | :"/v1/chat/completions") | :"/v1/embeddings")
                | :"/v1/completions")
               | :"/v1/moderations")
              | :"/v1/images/generations")
             | :"/v1/images/edits")
            | :"/v1/videos",
          input_file_id: String.t(),
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          output_expires_after: ExOpenAI.Components.BatchFileExpirationAfter.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:completion_window) => :"24h" | String.t(),
              required(:endpoint) =>
                (((((((:"/v1/responses" | :"/v1/chat/completions") | :"/v1/embeddings")
                     | :"/v1/completions")
                    | :"/v1/moderations")
                   | :"/v1/images/generations")
                  | :"/v1/images/edits")
                 | :"/v1/videos")
                | String.t(),
              required(:input_file_id) => String.t(),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:output_expires_after) =>
                ExOpenAI.Components.BatchFileExpirationAfter.input()
            }
  defstruct [:completion_window, :endpoint, :input_file_id, :metadata, :output_expires_after]
end
