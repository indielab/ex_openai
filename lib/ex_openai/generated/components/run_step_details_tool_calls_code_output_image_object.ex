defmodule ExOpenAI.Components.RunStepDetailsToolCallsCodeOutputImageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDetailsToolCallsCodeOutputImageObject.

  ## Fields

  * `:image` - **required** - `%{required(:file_id) => String.t()}`

  * `:type` - **required** - `:image`
    Always `image`.
    Allowed values: `"image"`
  """
  @type t() :: %{__struct__: __MODULE__, image: %{required(:file_id) => String.t()}, type: :image}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:image) => %{required(:file_id) => String.t()},
              required(:type) => :image | String.t()
            }
  defstruct [:image, :type]
end
