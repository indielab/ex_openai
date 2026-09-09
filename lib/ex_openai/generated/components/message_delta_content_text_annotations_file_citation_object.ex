defmodule ExOpenAI.Components.MessageDeltaContentTextAnnotationsFileCitationObject do
  use ExOpenAI.Jason

  @moduledoc """
  A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file_search" tool to search files.

  ## Fields

  * `:end_index` - **optional** - `integer()`
    Constraints: minimum: 0

  * `:file_citation` - **optional** - `%{optional(:file_id) => String.t(), optional(:quote) => String.t()}`

  * `:index` - **required** - `integer()`
    The index of the annotation in the text content part.

  * `:start_index` - **optional** - `integer()`
    Constraints: minimum: 0

  * `:text` - **optional** - `String.t()`
    The text in the message content that needs to be replaced.

  * `:type` - **required** - `:file_citation`
    Always `file_citation`.
    Allowed values: `"file_citation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_index: integer() | nil,
          file_citation:
            %{optional(:file_id) => String.t(), optional(:quote) => String.t()} | nil,
          index: integer(),
          start_index: integer() | nil,
          text: String.t() | nil,
          type: :file_citation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:end_index) => integer(),
              optional(:file_citation) => %{
                optional(:file_id) => String.t(),
                optional(:quote) => String.t()
              },
              required(:index) => integer(),
              optional(:start_index) => integer(),
              optional(:text) => String.t(),
              required(:type) => :file_citation | String.t()
            }
  defstruct [:end_index, :file_citation, :index, :start_index, :text, :type]
end
