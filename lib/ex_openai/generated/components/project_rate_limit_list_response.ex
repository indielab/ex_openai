defmodule ExOpenAI.Components.ProjectRateLimitListResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectRateLimitListResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.ProjectRateLimit.t()]`

  * `:first_id` - **required** - `String.t()`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **required** - `String.t()`

  * `:object` - **required** - `:list`  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ProjectRateLimit.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
