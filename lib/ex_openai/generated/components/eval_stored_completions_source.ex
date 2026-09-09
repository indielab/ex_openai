defmodule ExOpenAI.Components.EvalStoredCompletionsSource do
  use ExOpenAI.Jason

  @moduledoc """
  A StoredCompletionsRunDataSource configuration describing a set of filters


  ## Fields

  * `:created_after` - **optional** - `integer() | nil`

  * `:created_before` - **optional** - `integer() | nil`

  * `:limit` - **optional** - `integer() | nil`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:stored_completions`
    The type of source. Always `stored_completions`.
    Allowed values: `"stored_completions"`
    Default: `"stored_completions"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_after: (integer() | nil) | nil,
          created_before: (integer() | nil) | nil,
          limit: (integer() | nil) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: (String.t() | nil) | nil,
          type: :stored_completions
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:created_after) => integer() | nil,
              optional(:created_before) => integer() | nil,
              optional(:limit) => integer() | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) => String.t() | nil,
              required(:type) => :stored_completions | String.t()
            }
  defstruct [:created_after, :created_before, :limit, :metadata, :model, :type]
end
