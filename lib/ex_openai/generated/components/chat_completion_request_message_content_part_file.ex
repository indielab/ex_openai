defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartFile do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [file inputs](/docs/guides/text) for text generation.


  ## Fields

  * `:file` - **required** - `{:%{}, [], [{{:optional, [], [:file_data]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:filename]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:file`  
    The type of the content part. Always `file`.  
    Allowed values: `"file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file: %{
            optional(:file_data) => String.t(),
            optional(:file_id) => String.t(),
            optional(:filename) => String.t()
          },
          type: :file
        }
  defstruct [:file, :type]
end
