defmodule ExOpenAI.Components.UsageTimeBucket do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UsageTimeBucket.

  ## Fields

  * `:end_time` - **required** - `integer()`

  * `:object` - **required** - `:bucket`  
    Allowed values: `"bucket"`

  * `:result` - **required** - `[ExOpenAI.Components.UsageCompletionsResult.t() | ExOpenAI.Components.UsageEmbeddingsResult.t() | ExOpenAI.Components.UsageModerationsResult.t() | ExOpenAI.Components.UsageImagesResult.t() | ExOpenAI.Components.UsageAudioSpeechesResult.t() | ExOpenAI.Components.UsageAudioTranscriptionsResult.t() | ExOpenAI.Components.UsageVectorStoresResult.t() | ExOpenAI.Components.UsageCodeInterpreterSessionsResult.t() | ExOpenAI.Components.CostsResult.t()]`

  * `:start_time` - **required** - `integer()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_time: integer(),
          object: :bucket,
          result:
            list(
              (((((((ExOpenAI.Components.UsageCompletionsResult.t()
                     | ExOpenAI.Components.UsageEmbeddingsResult.t())
                    | ExOpenAI.Components.UsageModerationsResult.t())
                   | ExOpenAI.Components.UsageImagesResult.t())
                  | ExOpenAI.Components.UsageAudioSpeechesResult.t())
                 | ExOpenAI.Components.UsageAudioTranscriptionsResult.t())
                | ExOpenAI.Components.UsageVectorStoresResult.t())
               | ExOpenAI.Components.UsageCodeInterpreterSessionsResult.t())
              | ExOpenAI.Components.CostsResult.t()
            ),
          start_time: integer()
        }
  defstruct [:end_time, :object, :result, :start_time]
end
