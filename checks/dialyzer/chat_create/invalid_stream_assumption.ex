defmodule ExOpenAI.DialyzerChecks.ChatCreate.InvalidStreamAssumption do
  @moduledoc false

  alias ExOpenAI.DialyzerChecks.ChatCreate.Support

  @spec run() :: {:ok, reference()} | {:error, any()}
  def run do
    ExOpenAI.Chat.create_chat_completion(
      Support.messages(),
      "gpt-4o-mini",
      stream: true,
      stream_to: Support.callback()
    )
  end
end
