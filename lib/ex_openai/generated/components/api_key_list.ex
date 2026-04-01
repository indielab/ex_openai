defmodule ExOpenAI.Components.ApiKeyList do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ApiKeyList.

  ## Fields

  * `:data` - **optional** - `[ExOpenAI.Components.AdminApiKey.t()]`

  * `:first_id` - **optional** - `String.t()`

  * `:has_more` - **optional** - `boolean()`

  * `:last_id` - **optional** - `String.t()`

  * `:object` - **optional** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.AdminApiKey.t()) | nil,
          first_id: String.t() | nil,
          has_more: boolean() | nil,
          last_id: String.t() | nil,
          object: String.t() | nil
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
