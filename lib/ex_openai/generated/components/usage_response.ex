defmodule ExOpenAI.Components.UsageResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UsageResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.UsageTimeBucket.t())`

  * `:has_more` - **required** - `boolean()`

  * `:next_page` - **required** - `String.t() | nil`

  * `:object` - **required** - `:page`
    Allowed values: `"page"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.UsageTimeBucket.t()),
          has_more: boolean(),
          next_page: String.t() | nil,
          object: :page
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.UsageTimeBucket.input()),
              required(:has_more) => boolean(),
              required(:next_page) => String.t() | nil,
              required(:object) => :page | String.t()
            }
  defstruct [:data, :has_more, :next_page, :object]
end
