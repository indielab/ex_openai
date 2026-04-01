defmodule ExOpenAI.Components.ListCertificatesResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListCertificatesResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.Certificate.t()]`

  * `:first_id` - **optional** - `String.t()`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **optional** - `String.t()`

  * `:object` - **required** - `:list`  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.Certificate.t()),
          first_id: String.t() | nil,
          has_more: boolean(),
          last_id: String.t() | nil,
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
