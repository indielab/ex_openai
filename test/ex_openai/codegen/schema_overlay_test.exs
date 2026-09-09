defmodule ExOpenAI.Codegen.SchemaOverlayTest do
  use ExUnit.Case, async: true

  alias ExOpenAI.Codegen.{DocsParser, SchemaOverlay, SchemaResolver, SourceFileGenerator}
  alias ExOpenAI.Codegen.DocsParser.Schema

  setup_all do
    yaml = File.read!("lib/ex_openai/docs/docs.yaml")
    overlay = YamlElixir.read_from_file!("lib/ex_openai/docs/overlay.yaml")

    %{
      raw: YamlElixir.read_from_string!(yaml),
      overlay: overlay,
      original: DocsParser.get_documentation(yaml),
      corrected: SourceFileGenerator.load_documentation()
    }
  end

  test "audio additions preserve JSON responses and supply text return types", context do
    for path <- ["/audio/transcriptions", "/audio/translations"] do
      original = context.original.paths[path].operations["post"]
      corrected = context.corrected.paths[path].operations["post"]
      refute Map.has_key?(original.responses["200"].content, "text/plain")

      assert corrected.responses["200"].content["application/json"] ==
               original.responses["200"].content["application/json"]

      assert %Schema{type: "string"} =
               SchemaResolver.response_schema(corrected, :success, "text/plain")

      assert %Schema{one_of: alternatives} = SchemaResolver.response_schema(corrected)
      assert Enum.any?(alternatives, &match?(%Schema{type: "string"}, &1))
      assert Enum.any?(alternatives, &is_binary(&1.ref))

      assert SchemaResolver.response_schema(%{corrected | operation_id: "renamed"}) ==
               SchemaResolver.response_schema(corrected)
    end
  end

  test "all declared binary response formats preserve raw mode", context do
    for path <- ["/skills/{skill_id}/content", "/videos/{video_id}/content"] do
      operation = context.corrected.paths[path].operations["get"]
      assert %Schema{one_of: members} = schema = SchemaResolver.response_schema(operation)
      assert length(members) == 2
      assert SchemaResolver.raw_response?(schema)
    end
  end

  test "Assistants event envelopes are inferred from the corrected response schema", context do
    for path <- [
          "/threads/runs",
          "/threads/{thread_id}/runs",
          "/threads/{thread_id}/runs/{run_id}/submit_tool_outputs"
        ] do
      operation = context.corrected.paths[path].operations["post"]

      assert %Schema{ref: "#/components/schemas/AssistantStreamEvent"} =
               schema =
               SchemaResolver.response_schema(
                 %{operation | operation_id: "renamed"},
                 :success,
                 "text/event-stream"
               )

      assert SchemaResolver.event_envelope?(schema, context.corrected.components)
    end
  end

  test "speech streaming support comes from its upstream SSE response", context do
    operation = context.original.paths["/audio/speech"].operations["post"]

    assert SchemaResolver.sdk_stream_option?(
             %{operation | operation_id: "renamed"},
             context.original.components
           )

    schema = SchemaResolver.response_schema(operation, :success, "text/event-stream")
    refute SchemaResolver.event_envelope?(schema, context.original.components)
    assert context.corrected.paths["/audio/speech"] == context.original.paths["/audio/speech"]
  end

  test "payload event unions stay unwrapped", context do
    for name <- [
          "ResponseStreamEvent",
          "CreateSpeechResponseStreamEvent",
          "CreateChatCompletionStreamResponse"
        ] do
      refute SchemaResolver.event_envelope?(
               %Schema{ref: "#/components/schemas/" <> name},
               context.corrected.components
             )
    end
  end

  test "upstream additions force review even when the value agrees", context do
    [addition | _] = context.overlay
    updated = SchemaOverlay.apply!(context.raw, [addition])

    assert_raise ArgumentError, ~r/upstream already defines/, fn ->
      SchemaOverlay.apply!(updated, [addition])
    end
  end

  test "upstream conflicts cannot be overwritten", context do
    [addition | _] = context.overlay

    updated =
      put_in(context.raw, addition["target"] ++ ["text/plain"], %{
        "schema" => %{"type" => "object"}
      })

    assert_raise ArgumentError, ~r/upstream already defines/, fn ->
      SchemaOverlay.apply!(updated, [addition])
    end
  end

  test "removed upstream targets force review", context do
    updated = update_in(context.raw, ["paths"], &Map.delete(&1, "/audio/transcriptions"))

    assert_raise ArgumentError, ~r/target no longer exists/, fn ->
      SchemaOverlay.apply!(updated, context.overlay)
    end
  end
end
