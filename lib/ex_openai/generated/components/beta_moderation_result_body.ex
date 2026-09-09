defmodule ExOpenAI.Components.BetaModerationResultBody do
  use ExOpenAI.Jason

  @moduledoc """
  A moderation result produced for the response input or output.

  ## Fields

  * `:categories` - **required** - `map()`
    A dictionary of moderation categories to booleans, True if the input is flagged under this category.

  * `:category_applied_input_types` - **required** - `map()`
    Which modalities of input are reflected by the score for each category.

  * `:category_scores` - **required** - `map()`
    A dictionary of moderation categories to scores.

  * `:flagged` - **required** - `boolean()`
    A boolean indicating whether the content was flagged by any category.

  * `:model` - **required** - `String.t()`
    The moderation model that produced this result.

  * `:type` - **required** - `:moderation_result`
    The object type, which was always `moderation_result` for successful moderation results.
    Allowed values: `"moderation_result"`
    Default: `"moderation_result"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          categories: map(),
          category_applied_input_types: map(),
          category_scores: map(),
          flagged: boolean(),
          model: String.t(),
          type: :moderation_result
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:categories) => map(),
              required(:category_applied_input_types) => map(),
              required(:category_scores) => map(),
              required(:flagged) => boolean(),
              required(:model) => String.t(),
              required(:type) => :moderation_result | String.t()
            }
  defstruct [
    :categories,
    :category_applied_input_types,
    :category_scores,
    :flagged,
    :model,
    :type
  ]
end
