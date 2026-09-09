defmodule ExOpenAI.Components.ListFilesResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListFilesResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OpenAIFile.t())`

  * `:first_id` - **required** - `String.t()`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **required** - `String.t()`

  * `:object` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OpenAIFile.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OpenAIFile.input()),
              required(:first_id) => String.t(),
              required(:has_more) => boolean(),
              required(:last_id) => String.t(),
              required(:object) => String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
