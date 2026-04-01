defmodule ExOpenAI.Components.OpenAIFile do
  use ExOpenAI.Jason

  @moduledoc """
  The `File` object represents a document that has been uploaded to OpenAI.

  ## Type

  `any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: integer(),
          created_at: integer(),
          expires_at: integer() | nil,
          filename: String.t(),
          id: String.t(),
          object: :file,
          purpose:
            ((((((:assistants | :assistants_output) | :batch) | :batch_output) | :"fine-tune")
              | :"fine-tune-results")
             | :vision)
            | :user_data,
          status: (:uploaded | :processed) | :error,
          status_details: String.t() | nil
        }
  defstruct [
    :bytes,
    :created_at,
    :expires_at,
    :filename,
    :id,
    :object,
    :purpose,
    :status,
    :status_details
  ]
end
