defmodule ExOpenAI.DialyzerChecks.ChatCreate.InvalidStreamMatch do
  @moduledoc false

  alias ExOpenAI.DialyzerChecks.ChatCreate.Support

  @spec run() :: reference()
  def run do
    {:ok, ref} =
      ExOpenAI.Chat.create_chat_completion(
        Support.messages(),
        "gpt-4o-mini",
        stream: true,
        stream_to: Support.callback()
      )

    ref
  end
end
