defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsCodeOutputImageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDeltaStepDetailsToolCallsCodeOutputImageObject.

  ## Fields

  * `:image` - **optional** - `%{optional(:file_id) => String.t()}`

  * `:index` - **required** - `integer()`
    The index of the output in the outputs array.

  * `:type` - **required** - `:image`
    Always `image`.
    Allowed values: `"image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image: %{optional(:file_id) => String.t()} | nil,
          index: integer(),
          type: :image
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:image) => %{optional(:file_id) => String.t()},
              required(:index) => integer(),
              required(:type) => :image | String.t()
            }
  defstruct [:image, :index, :type]
end
