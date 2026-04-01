api_key = System.fetch_env!("OPENAI_API_KEY")

case ExOpenAI.Responses.create_response(
       model: "gpt-4o-mini",
       input: "Reply with exactly the word banana.",
       temperature: 0,
       openai_api_key: api_key
     ) do
  {:ok, %ExOpenAI.Components.Response{} = response} ->
    text =
      response.output
      |> Enum.flat_map(fn item ->
        case item do
          %{content: content} when is_list(content) ->
            Enum.flat_map(content, fn part ->
              case part do
                %{text: text} when is_binary(text) -> [text]
                _ -> []
              end
            end)

          _ ->
            []
        end
      end)
      |> Enum.join()
      |> String.trim()

    if text != "" do
      IO.puts("responses_create ok")
      IO.puts("id=#{response.id}")
      IO.puts("model=#{response.model}")
      IO.puts("text=#{inspect(text)}")
    else
      IO.puts("responses_create empty output")
      System.halt(1)
    end

  {:ok, other} ->
    IO.puts("responses_create unexpected response")
    IO.inspect(other, limit: :infinity)
    System.halt(1)

  {:error, error} ->
    IO.puts("responses_create error")
    IO.inspect(error, limit: :infinity)
    System.halt(1)
end
