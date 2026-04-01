defmodule ExOpenAI.DialyzerChecks.ChatCreate.Support do
  @moduledoc false

  @spec messages() :: [ExOpenAI.Components.ChatCompletionRequestMessage.t()]
  def messages do
    [
      %ExOpenAI.Components.ChatCompletionRequestSystemMessage{
        role: :system,
        content: "You are concise."
      },
      %ExOpenAI.Components.ChatCompletionRequestUserMessage{
        role: :user,
        content: "Say hello"
      }
    ]
  end

  @spec callback() :: (term() -> :ok)
  def callback do
    fn
      :finish -> :ok
      {:data, %ExOpenAI.Components.CreateChatCompletionStreamResponse{}} -> :ok
      {:error, _reason} -> :ok
    end
  end
end
