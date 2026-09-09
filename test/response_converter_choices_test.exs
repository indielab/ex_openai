defmodule ExOpenAI.ResponseConverterChoicesTest do
  use ExUnit.Case

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.ResponseConverter
  alias ExOpenAI.Components.ChatCompletionResponseMessage

  test "chat completion choices are converted to structs with atom keys" do
    schema = %Schema{ref: "#/components/schemas/CreateChatCompletionResponse"}

    response =
      {:ok,
       %{
         "id" => "chatcmpl-1",
         "object" => "chat.completion",
         "created" => 0,
         "model" => "gpt-3.5-turbo",
         "service_tier" => nil,
         "system_fingerprint" => nil,
         "usage" => nil,
         "choices" => [
           %{
             "finish_reason" => "stop",
             "index" => 0,
             "logprobs" => nil,
             "message" => %{
               "role" => "assistant",
               "content" => "hi"
             }
           }
         ]
       }}

    {:ok, converted} = ResponseConverter.convert_response(response, schema)

    [choice] = converted.choices
    assert choice[:finish_reason] == :stop
    assert choice[:index] == 0
    assert %ChatCompletionResponseMessage{role: :assistant, content: "hi"} = choice[:message]
  end
end
