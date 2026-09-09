defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartAudio do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).


  ## Fields

  * `:input_audio` - **required** - `%{required(:data) => String.t(), required(:format) => :wav | :mp3}`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointParam.t()`

  * `:type` - **required** - `:input_audio`
    The type of the content part. Always `input_audio`.
    Allowed values: `"input_audio"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_audio: %{required(:data) => String.t(), required(:format) => :wav | :mp3},
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil,
          type: :input_audio
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input_audio) => %{
                required(:data) => String.t(),
                required(:format) => (:wav | :mp3) | String.t()
              },
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointParam.input(),
              required(:type) => :input_audio | String.t()
            }
  defstruct [:input_audio, :prompt_cache_breakpoint, :type]
end
