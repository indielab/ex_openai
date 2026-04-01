api_key = System.fetch_env!("OPENAI_API_KEY")
parent = self()

messages = [
  %{role: "system", content: "You answer tersely."},
  %{role: "user", content: "Reply with exactly the word streaming."}
]

callback = fn
  :finish ->
    send(parent, :finish)

  {:data, %ExOpenAI.Components.CreateChatCompletionResponse{} = chunk} ->
    send(parent, {:chunk, chunk})

  {:error, error} ->
    send(parent, {:error, error})
end

case ExOpenAI.Chat.create_chat_completion(
       messages,
       "gpt-4o-mini",
       temperature: 0,
       max_tokens: 32,
       stream: true,
       stream_to: callback,
       openai_api_key: api_key
     ) do
  {:ok, ref} when is_reference(ref) ->
    collect = fn collect, chunks, parts ->
      receive do
        {:chunk, %{choices: choices}} ->
          new_parts =
            Enum.flat_map(choices, fn choice ->
              case choice do
                %{delta: %{content: content}} when is_binary(content) and content != "" ->
                  [content]

                _ ->
                  []
              end
            end)

          collect.(collect, chunks + 1, parts ++ new_parts)

        :finish ->
          text = parts |> Enum.join() |> String.trim()

          if chunks > 0 do
            IO.puts("chat_stream ok")
            IO.puts("ref=#{inspect(ref)}")
            IO.puts("chunks=#{chunks}")
            IO.puts("text=#{inspect(text)}")
          else
            IO.puts("chat_stream no chunks")
            System.halt(1)
          end

        {:error, error} ->
          IO.puts("chat_stream error")
          IO.inspect(error, limit: :infinity)
          System.halt(1)
      after
        20_000 ->
          IO.puts("chat_stream timeout")
          System.halt(1)
      end
    end

    collect.(collect, 0, [])

  {:ok, other} ->
    IO.puts("chat_stream unexpected return")
    IO.inspect(other, limit: :infinity)
    System.halt(1)

  {:error, error} ->
    IO.puts("chat_stream start error")
    IO.inspect(error, limit: :infinity)
    System.halt(1)
end
