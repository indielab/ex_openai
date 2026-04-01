defmodule ExOpenAI.DialyzerChecks.ChatCreate.InvalidModel do
  @moduledoc false

  alias ExOpenAI.DialyzerChecks.ChatCreate.Support

  @spec run() :: {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t() | reference()} | {:error, any()}
  def run do
    ExOpenAI.Chat.create_chat_completion(
      Support.messages(),
      123
    )
  end
end
