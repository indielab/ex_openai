defmodule ExOpenAI.Components.EvalResponsesSource do
  use ExOpenAI.Jason

  @moduledoc """
  A EvalResponsesSource object describing a run data source configuration.


  ## Fields

  * `:created_after` - **optional** - `integer() | nil`

  * `:created_before` - **optional** - `integer() | nil`

  * `:instructions_search` - **optional** - `String.t() | nil`

  * `:metadata` - **optional** - `map() | nil`

  * `:model` - **optional** - `String.t() | nil`

  * `:reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t() | nil`

  * `:temperature` - **optional** - `number() | nil`

  * `:tools` - **optional** - `list(String.t()) | nil`

  * `:top_p` - **optional** - `number() | nil`

  * `:type` - **required** - `:responses`
    The type of run data source. Always `responses`.
    Allowed values: `"responses"`

  * `:users` - **optional** - `list(String.t()) | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_after: (integer() | nil) | nil,
          created_before: (integer() | nil) | nil,
          instructions_search: (String.t() | nil) | nil,
          metadata: (map() | nil) | nil,
          model: (String.t() | nil) | nil,
          reasoning_effort: (ExOpenAI.Components.ReasoningEffort.t() | nil) | nil,
          temperature: (number() | nil) | nil,
          tools: (list(String.t()) | nil) | nil,
          top_p: (number() | nil) | nil,
          type: :responses,
          users: (list(String.t()) | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:created_after) => integer() | nil,
              optional(:created_before) => integer() | nil,
              optional(:instructions_search) => String.t() | nil,
              optional(:metadata) => map() | nil,
              optional(:model) => String.t() | nil,
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.input() | nil,
              optional(:temperature) => number() | nil,
              optional(:tools) => list(String.t()) | nil,
              optional(:top_p) => number() | nil,
              required(:type) => :responses | String.t(),
              optional(:users) => list(String.t()) | nil
            }
  defstruct [
    :created_after,
    :created_before,
    :instructions_search,
    :metadata,
    :model,
    :reasoning_effort,
    :temperature,
    :tools,
    :top_p,
    :type,
    :users
  ]
end
