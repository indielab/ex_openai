defmodule ExOpenAI.Components.ChatCompletionModerationResults do
  use ExOpenAI.Jason

  @moduledoc """
  Successful moderation results for the request input or generated output.

  ## Fields

  * `:model` - **required** - `String.t()`
    The moderation model used to generate the results.

  * `:results` - **required** - `list(ExOpenAI.Components.ModerationResultBody.t())`
    A list of moderation results.

  * `:type` - **required** - `:moderation_results`
    The object type, which is always `moderation_results`.
    Allowed values: `"moderation_results"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          model: String.t(),
          results: list(ExOpenAI.Components.ModerationResultBody.t()),
          type: :moderation_results
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:model) => String.t(),
              required(:results) => list(ExOpenAI.Components.ModerationResultBody.input()),
              required(:type) => :moderation_results | String.t()
            }
  defstruct [:model, :results, :type]
end
