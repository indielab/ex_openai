defmodule ExOpenAI.Components.CreateVideoJsonBody do
  use ExOpenAI.Jason

  @moduledoc """
  JSON parameters for creating a new video generation job.

  ## Fields

  * `:input_reference` - **optional** - `:"Elixir.ExOpenAI.Components.ImageRefParam-2".t()`  
    Optional reference object that guides generation. Provide exactly one of `image_url` or `file_id`.

  * `:model` - **optional** - `ExOpenAI.Components.VideoModel.t()`  
    The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.

  * `:prompt` - **required** - `String.t()`  
    Text prompt that describes the video to generate.  
    Constraints: minLength: 1, maxLength: 32000

  * `:seconds` - **optional** - `ExOpenAI.Components.VideoSeconds.t()`  
    Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.

  * `:size` - **optional** - `ExOpenAI.Components.VideoSize.t()`  
    Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_reference: :"Elixir.ExOpenAI.Components.ImageRefParam-2".t() | nil,
          model: ExOpenAI.Components.VideoModel.t() | nil,
          prompt: String.t(),
          seconds: ExOpenAI.Components.VideoSeconds.t() | nil,
          size: ExOpenAI.Components.VideoSize.t() | nil
        }
  defstruct [:input_reference, :model, :prompt, :seconds, :size]
end
