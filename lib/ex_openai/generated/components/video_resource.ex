defmodule ExOpenAI.Components.VideoResource do
  use ExOpenAI.Jason

  @moduledoc """
  Structured information describing a generated video job.

  ## Fields

  * `:completed_at` - **required** - `integer() | any()`

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (seconds) for when the job was created.

  * `:error` - **required** - `:"Elixir.ExOpenAI.Components.Error-2".t() | any()`

  * `:expires_at` - **required** - `integer() | any()`

  * `:id` - **required** - `String.t()`  
    Unique identifier for the video job.

  * `:model` - **required** - `ExOpenAI.Components.VideoModel.t()`  
    The video generation model that produced the job.

  * `:object` - **required** - `:video`  
    The object type, which is always `video`.  
    Allowed values: `"video"`  
    Default: `"video"`

  * `:progress` - **required** - `integer()`  
    Approximate completion percentage for the generation task.

  * `:prompt` - **required** - `String.t() | any()`

  * `:remixed_from_video_id` - **required** - `String.t() | any()`

  * `:seconds` - **required** - `String.t()`  
    Duration of the generated clip in seconds. For extensions, this is the stitched total duration.

  * `:size` - **required** - `ExOpenAI.Components.VideoSize.t()`  
    The resolution of the generated video.

  * `:status` - **required** - `ExOpenAI.Components.VideoStatus.t()`  
    Current lifecycle status of the video job.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          completed_at: integer() | any(),
          created_at: integer(),
          error: :"Elixir.ExOpenAI.Components.Error-2".t() | any(),
          expires_at: integer() | any(),
          id: String.t(),
          model: ExOpenAI.Components.VideoModel.t(),
          object: :video,
          progress: integer(),
          prompt: String.t() | any(),
          remixed_from_video_id: String.t() | any(),
          seconds: String.t(),
          size: ExOpenAI.Components.VideoSize.t(),
          status: ExOpenAI.Components.VideoStatus.t()
        }
  defstruct [
    :completed_at,
    :created_at,
    :error,
    :expires_at,
    :id,
    :model,
    :object,
    :progress,
    :prompt,
    :remixed_from_video_id,
    :seconds,
    :size,
    :status
  ]
end
