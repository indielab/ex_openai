defmodule ExOpenAI.Components.VideoResource do
  use ExOpenAI.Jason

  @moduledoc """
  Structured information describing a generated video job.

  ## Fields

  * `:completed_at` - **required** - `integer() | nil`

  * `:created_at` - **required** - `integer()`
    Unix timestamp (seconds) for when the job was created.
    Format: `unixtime`

  * `:error` - **required** - `:"Elixir.ExOpenAI.Components.Error-2".t() | nil`

  * `:expires_at` - **required** - `integer() | nil`

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

  * `:prompt` - **required** - `String.t() | nil`

  * `:remixed_from_video_id` - **required** - `String.t() | nil`

  * `:seconds` - **required** - `String.t()`
    Duration of the generated clip in seconds. For extensions, this is the stitched total duration.

  * `:size` - **required** - `ExOpenAI.Components.VideoSize.t()`
    The resolution of the generated video.

  * `:status` - **required** - `ExOpenAI.Components.VideoStatus.t()`
    Current lifecycle status of the video job.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          completed_at: integer() | nil,
          created_at: integer(),
          error: :"Elixir.ExOpenAI.Components.Error-2".t() | nil,
          expires_at: integer() | nil,
          id: String.t(),
          model: ExOpenAI.Components.VideoModel.t(),
          object: :video,
          progress: integer(),
          prompt: String.t() | nil,
          remixed_from_video_id: String.t() | nil,
          seconds: String.t(),
          size: ExOpenAI.Components.VideoSize.t(),
          status: ExOpenAI.Components.VideoStatus.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:completed_at) => integer() | nil,
              required(:created_at) => integer(),
              required(:error) => :"Elixir.ExOpenAI.Components.Error-2".input() | nil,
              required(:expires_at) => integer() | nil,
              required(:id) => String.t(),
              required(:model) => ExOpenAI.Components.VideoModel.input(),
              required(:object) => :video | String.t(),
              required(:progress) => integer(),
              required(:prompt) => String.t() | nil,
              required(:remixed_from_video_id) => String.t() | nil,
              required(:seconds) => String.t(),
              required(:size) => ExOpenAI.Components.VideoSize.input(),
              required(:status) => ExOpenAI.Components.VideoStatus.input()
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
