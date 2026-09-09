defmodule ExOpenAI.Components.ListPaginatedFineTuningJobsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListPaginatedFineTuningJobsResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.FineTuningJob.t())`

  * `:has_more` - **required** - `boolean()`

  * `:object` - **required** - `:list`
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.FineTuningJob.t()),
          has_more: boolean(),
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.FineTuningJob.input()),
              required(:has_more) => boolean(),
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :object]
end
