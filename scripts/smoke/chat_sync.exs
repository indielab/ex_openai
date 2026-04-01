api_key = System.fetch_env!("OPENAI_API_KEY")

messages = [
  %{role: "system", content: "You answer tersely."},
  %{role: "user", content: "Reply with exactly the word pong."}
]

case ExOpenAI.Chat.create_chat_completion(
       messages,
       "gpt-4o-mini",
       temperature: 0,
       max_tokens: 16,
       openai_api_key: api_key
     ) do
  {:ok, %ExOpenAI.Components.CreateChatCompletionResponse{} = response} ->
    content =
      response.choices
      |> List.first()
      |> Map.fetch!(:message)
      |> Map.fetch!(:content)

    if is_binary(content) and String.trim(content) != "" do
      IO.puts("chat_sync ok")
      IO.puts("id=#{response.id}")
      IO.puts("model=#{response.model}")
      IO.puts("content=#{inspect(content)}")
    else
      IO.puts("chat_sync empty content")
      System.halt(1)
    end

  {:ok, other} ->
    IO.puts("chat_sync unexpected response")
    IO.inspect(other, limit: :infinity)
    System.halt(1)

  {:error, error} ->
    IO.puts("chat_sync error")
    IO.inspect(error, limit: :infinity)
    System.halt(1)
end
