defmodule ExOpenAI.Components.EvalResponsesSource do
  use ExOpenAI.Jason

  @moduledoc """
  A EvalResponsesSource object describing a run data source configuration.


  ## Fields

  * `:created_after` - **optional** - `integer() | any()`

  * `:created_before` - **optional** - `integer() | any()`

  * `:instructions_search` - **optional** - `String.t() | any()`

  * `:metadata` - **optional** - `map() | any()`

  * `:model` - **optional** - `String.t() | any()`

  * `:reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t() | any()`

  * `:temperature` - **optional** - `number() | any()`

  * `:tools` - **optional** - `[String.t()] | any()`

  * `:top_p` - **optional** - `number() | any()`

  * `:type` - **required** - `:responses`  
    The type of run data source. Always `responses`.  
    Allowed values: `"responses"`

  * `:users` - **optional** - `[String.t()] | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_after: (integer() | any()) | nil,
          created_before: (integer() | any()) | nil,
          instructions_search: (String.t() | any()) | nil,
          metadata: (map() | any()) | nil,
          model: (String.t() | any()) | nil,
          reasoning_effort: (ExOpenAI.Components.ReasoningEffort.t() | any()) | nil,
          temperature: (number() | any()) | nil,
          tools: (list(String.t()) | any()) | nil,
          top_p: (number() | any()) | nil,
          type: :responses,
          users: (list(String.t()) | any()) | nil
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
