defmodule ExOpenAI.Components.ListPaginatedFineTuningJobsResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListPaginatedFineTuningJobsResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.FineTuningJob.t()]`

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
  defstruct [:data, :has_more, :object]
end
