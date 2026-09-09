defmodule ExOpenAI.Components.UsageTimeBucket do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UsageTimeBucket.

  ## Fields

  * `:end_time` - **required** - `integer()`

  * `:object` - **required** - `:bucket`
    Allowed values: `"bucket"`

  * `:results` - **required** - `list( ExOpenAI.Components.UsageCompletionsResult.t() | ExOpenAI.Components.UsageEmbeddingsResult.t() | ExOpenAI.Components.UsageModerationsResult.t() | ExOpenAI.Components.UsageImagesResult.t() | ExOpenAI.Components.UsageAudioSpeechesResult.t() | ExOpenAI.Components.UsageAudioTranscriptionsResult.t() | ExOpenAI.Components.UsageVectorStoresResult.t() | ExOpenAI.Components.UsageCodeInterpreterSessionsResult.t() | ExOpenAI.Components.UsageFileSearchCallsResult.t() | ExOpenAI.Components.UsageWebSearchCallsResult.t() | ExOpenAI.Components.CostsResult.t() )`

  * `:start_time` - **required** - `integer()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_time: integer(),
          object: :bucket,
          results:
            list(
              (((((((((ExOpenAI.Components.UsageCompletionsResult.t()
                       | ExOpenAI.Components.UsageEmbeddingsResult.t())
                      | ExOpenAI.Components.UsageModerationsResult.t())
                     | ExOpenAI.Components.UsageImagesResult.t())
                    | ExOpenAI.Components.UsageAudioSpeechesResult.t())
                   | ExOpenAI.Components.UsageAudioTranscriptionsResult.t())
                  | ExOpenAI.Components.UsageVectorStoresResult.t())
                 | ExOpenAI.Components.UsageCodeInterpreterSessionsResult.t())
                | ExOpenAI.Components.UsageFileSearchCallsResult.t())
               | ExOpenAI.Components.UsageWebSearchCallsResult.t())
              | ExOpenAI.Components.CostsResult.t()
            ),
          start_time: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:end_time) => integer(),
              required(:object) => :bucket | String.t(),
              required(:results) =>
                list(
                  (((((((((ExOpenAI.Components.UsageCompletionsResult.input()
                           | ExOpenAI.Components.UsageEmbeddingsResult.input())
                          | ExOpenAI.Components.UsageModerationsResult.input())
                         | ExOpenAI.Components.UsageImagesResult.input())
                        | ExOpenAI.Components.UsageAudioSpeechesResult.input())
                       | ExOpenAI.Components.UsageAudioTranscriptionsResult.input())
                      | ExOpenAI.Components.UsageVectorStoresResult.input())
                     | ExOpenAI.Components.UsageCodeInterpreterSessionsResult.input())
                    | ExOpenAI.Components.UsageFileSearchCallsResult.input())
                   | ExOpenAI.Components.UsageWebSearchCallsResult.input())
                  | ExOpenAI.Components.CostsResult.input()
                ),
              required(:start_time) => integer()
            }
  defstruct [:end_time, :object, :results, :start_time]
end
