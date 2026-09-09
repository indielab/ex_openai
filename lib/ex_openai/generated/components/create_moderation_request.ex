defmodule ExOpenAI.Components.CreateModerationRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateModerationRequest.

  ## Fields

  * `:input` - **required** - `String.t() | list(String.t()) | list( %{required(:image_url) => %{required(:url) => String.t()}, required(:type) => :image_url} | %{required(:text) => String.t(), required(:type) => :text} )`
    Input (or inputs) to classify. Can be a single string, an array of strings, or
  an array of multi-modal input objects similar to other models.

  * `:model` - **optional** - `String.t() | :"omni-moderation-latest" | :"omni-moderation-2024-09-26" | :"text-moderation-latest" | :"text-moderation-stable"`
    The content moderation model you would like to use. Learn more in
  [the moderation guide](https://platform.openai.com/docs/guides/moderation), and learn about
  available models [here](https://platform.openai.com/docs/models#moderation).
    Default: `"omni-moderation-latest"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input:
            (String.t() | list(String.t()))
            | list(
                %{
                  required(:image_url) => %{required(:url) => String.t()},
                  required(:type) => :image_url
                }
                | %{required(:text) => String.t(), required(:type) => :text}
              ),
          model:
            (String.t()
             | ((:"omni-moderation-latest" | :"omni-moderation-2024-09-26")
                | :"text-moderation-latest")
             | :"text-moderation-stable")
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) =>
                (String.t() | list(String.t()))
                | list(
                    %{
                      required(:image_url) => %{required(:url) => String.t()},
                      required(:type) => :image_url | String.t()
                    }
                    | %{required(:text) => String.t(), required(:type) => :text | String.t()}
                  ),
              optional(:model) =>
                String.t()
                | (((:"omni-moderation-latest" | :"omni-moderation-2024-09-26")
                    | :"text-moderation-latest")
                   | :"text-moderation-stable")
                | String.t()
            }
  defstruct [:input, :model]
end
