defmodule ExOpenAI.DialyzerChecks.ChatCreate.InvalidMessages do
  @moduledoc false

  @spec run() :: {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t() | reference()} | {:error, any()}
  def run do
    ExOpenAI.Chat.create_chat_completion(
      ["not a chat message"],
      "gpt-4o-mini"
    )
  end
end
