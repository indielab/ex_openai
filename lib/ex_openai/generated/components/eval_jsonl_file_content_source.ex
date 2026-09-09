defmodule ExOpenAI.Components.EvalJsonlFileContentSource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalJsonlFileContentSource.

  ## Fields

  * `:content` - **required** - `list(%{required(:item) => map(), optional(:sample) => map()})`
    The content of the jsonl file.

  * `:type` - **required** - `:file_content`
    The type of jsonl source. Always `file_content`.
    Allowed values: `"file_content"`
    Default: `"file_content"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: list(%{required(:item) => map(), optional(:sample) => map()}),
          type: :file_content
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) => list(%{required(:item) => map(), optional(:sample) => map()}),
              required(:type) => :file_content | String.t()
            }
  defstruct [:content, :type]
end
