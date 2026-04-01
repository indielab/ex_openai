defmodule ExOpenAI.ChatTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    ExVCR.Config.cassette_library_dir("./test/fixture/vcr_cassettes")
    :ok
  end

  test "chat completion" do
    use_cassette "chat_basic_completion" do
      msgs = [
        %ExOpenAI.Components.ChatCompletionRequestUserMessage{
          role: :user,
          content: "Hello!"
        },
        %ExOpenAI.Components.ChatCompletionRequestAssistantMessage{
          role: :assistant,
          content: "What's up?"
        },
        %ExOpenAI.Components.ChatCompletionRequestUserMessage{
          role: :user,
          content: "What ist the color of the sky?"
        }
      ]

      {:ok, res} =
        ExOpenAI.Chat.create_chat_completion(msgs, "gpt-3.5-turbo",
          logit_bias: %{
            "8043" => -100
          }
        )

      assert Enum.count(res.choices) == 1

      assert %{
               finish_reason: :stop,
               index: 0,
               message: %ExOpenAI.Components.ChatCompletionResponseMessage{
                 content:
                   "The color of the sky can vary depending on the time of day and weather conditions. During the day, the sky is typically blue due to the scattering of sunlight by the Earth's atmosphere. At sunrise and sunset, the sky can appear orange, pink, or purple. At night, the sky is usually dark but can be illuminated by city lights or moonlight.",
                 role: :assistant
               }
             } = List.first(res.choices)
    end
  end
end
