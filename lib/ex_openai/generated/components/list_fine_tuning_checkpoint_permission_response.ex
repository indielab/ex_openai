defmodule ExOpenAI.Components.ListFineTuningCheckpointPermissionResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ListFineTuningCheckpointPermissionResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.FineTuningCheckpointPermission.t())`

  * `:first_id` - **optional** - `String.t() | nil`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **optional** - `String.t() | nil`

  * `:object` - **required** - `:list`
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.FineTuningCheckpointPermission.t()),
          first_id: (String.t() | nil) | nil,
          has_more: boolean(),
          last_id: (String.t() | nil) | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.FineTuningCheckpointPermission.input()),
              optional(:first_id) => String.t() | nil,
              required(:has_more) => boolean(),
              optional(:last_id) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
