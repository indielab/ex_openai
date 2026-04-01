defmodule ExOpenAI.DialyzerChecks.ChatCreate.InvalidOpts do
  @moduledoc false

  alias ExOpenAI.DialyzerChecks.ChatCreate.Support

  @spec run() :: {:ok, ExOpenAI.Components.CreateChatCompletionResponse.t() | reference()} | {:error, any()}
  def run do
    ExOpenAI.Chat.create_chat_completion(
      Support.messages(),
      "gpt-4o-mini",
      stream: "yes",
      user: 123
    )
  end
end
