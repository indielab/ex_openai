defmodule ExOpenAI.Components.ListRunsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListRunsResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.RunObject.t()]`

  * `:first_id` - **required** - `String.t()`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **required** - `String.t()`

  * `:object` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.RunObject.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: String.t()
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
