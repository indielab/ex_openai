defmodule ExOpenAI.Components.DeleteAssistantResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteAssistantResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"assistant.deleted"`
    Allowed values: `"assistant.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"assistant.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"assistant.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
