defmodule ExOpenAI.Components.BetaToolChoiceTypes do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that the model should use a built-in tool to generate a response.
  [Learn more about built-in tools](https://platform.openai.com/docs/guides/tools).


  ## Fields

  * `:type` - **required** - `:file_search | :web_search_preview | :computer | :computer_use_preview | :computer_use | :web_search_preview_2025_03_11 | :image_generation | :code_interpreter`
    The type of hosted tool the model should to use. Learn more about
  [built-in tools](https://platform.openai.com/docs/guides/tools).

  Allowed values are:
  - `file_search`
  - `web_search_preview`
  - `computer`
  - `computer_use_preview`
  - `computer_use`
  - `code_interpreter`
  - `image_generation`
    Allowed values: `"file_search"`, `"web_search_preview"`, `"computer"`, `"computer_use_preview"`, `"computer_use"`, `"web_search_preview_2025_03_11"`, `"image_generation"`, `"code_interpreter"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          type:
            ((((((:file_search | :web_search_preview) | :computer) | :computer_use_preview)
               | :computer_use)
              | :web_search_preview_2025_03_11)
             | :image_generation)
            | :code_interpreter
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:type) =>
                (((((((:file_search | :web_search_preview) | :computer) | :computer_use_preview)
                    | :computer_use)
                   | :web_search_preview_2025_03_11)
                  | :image_generation)
                 | :code_interpreter)
                | String.t()
            }
  defstruct [:type]
end
