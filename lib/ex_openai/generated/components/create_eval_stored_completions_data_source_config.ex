defmodule ExOpenAI.Components.CreateEvalStoredCompletionsDataSourceConfig do
  use ExOpenAI.Jason

  @moduledoc """
  Deprecated in favor of LogsDataSourceConfig.


  ## Fields

  * `:metadata` - **optional** - `map()`
    Metadata filters for the stored completions data source.

  * `:type` - **required** - `:stored_completions`
    The type of data source. Always `stored_completions`.
    Allowed values: `"stored_completions"`
    Default: `"stored_completions"`
  """
  @type t() :: %{__struct__: __MODULE__, metadata: map() | nil, type: :stored_completions}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{optional(:metadata) => map(), required(:type) => :stored_completions | String.t()}
  defstruct [:metadata, :type]
end
