defmodule ExOpenAI.Components.UsageResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UsageResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.UsageTimeBucket.t()]`

  * `:has_more` - **required** - `boolean()`

  * `:next_page` - **required** - `String.t()`

  * `:object` - **required** - `:page`  
    Allowed values: `"page"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.UsageTimeBucket.t()),
          has_more: boolean(),
          next_page: String.t(),
          object: :page
        }
  defstruct [:data, :has_more, :next_page, :object]
end
