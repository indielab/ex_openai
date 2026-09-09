defmodule ExOpenAI.Components.ChatCompletionDeleted do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionDeleted.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the chat completion was deleted.

  * `:id` - **required** - `String.t()`
    The ID of the chat completion that was deleted.

  * `:object` - **required** - `:"chat.completion.deleted"`
    The type of object being deleted.
    Allowed values: `"chat.completion.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"chat.completion.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"chat.completion.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
