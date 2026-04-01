defmodule ExOpenAI.Components.RunStepDetailsToolCallsFileSearchObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDetailsToolCallsFileSearchObject.

  ## Fields

  * `:file_search` - **required** - `{:%{}, [], [{{:optional, [], [:ranking_options]}, {{:., [], [ExOpenAI.Components.RunStepDetailsToolCallsFileSearchRankingOptionsObject, :t]}, [], []}}, {{:optional, [], [:results]}, {:list, [], [{{:., [], [ExOpenAI.Components.RunStepDetailsToolCallsFileSearchResultObject, :t]}, [], []}]}}]}`  
    For now, this is always going to be an empty object.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call object.

  * `:type` - **required** - `:file_search`  
    The type of tool call. This is always going to be `file_search` for this type of tool call.  
    Allowed values: `"file_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_search: %{
            optional(:ranking_options) =>
              ExOpenAI.Components.RunStepDetailsToolCallsFileSearchRankingOptionsObject.t(),
            optional(:results) =>
              list(ExOpenAI.Components.RunStepDetailsToolCallsFileSearchResultObject.t())
          },
          id: String.t(),
          type: :file_search
        }
  defstruct [:file_search, :id, :type]
end
