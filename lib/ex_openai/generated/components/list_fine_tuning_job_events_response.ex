defmodule ExOpenAI.Components.ListFineTuningJobEventsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListFineTuningJobEventsResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.FineTuningJobEvent.t())`

  * `:has_more` - **required** - `boolean()`

  * `:object` - **required** - `:list`
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.FineTuningJobEvent.t()),
          has_more: boolean(),
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.FineTuningJobEvent.input()),
              required(:has_more) => boolean(),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :object]
end
