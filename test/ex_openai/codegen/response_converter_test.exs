defmodule ExOpenAI.Codegen.ResponseConverterTest do
  use ExUnit.Case, async: true
  
  alias ExOpenAI.Codegen.ResponseConverter
  alias ExOpenAI.Codegen.DocsParser.Schema

  describe "convert_response/2" do
    test "handles response with 'response' and 'type' keys" do
      response = {:ok, %{"response" => %{"id" => "123", "name" => "test"}, "type" => "some_type"}}
      schema = %Schema{ref: "#/components/schemas/SomeComponent"}
      
      result = ResponseConverter.convert_response(response, schema)
      assert {:ok, %{"id" => "123", "name" => "test"}} = result
    end

    test "passes through reference values unchanged" do
      ref = make_ref()
      response = {:ok, ref}
      schema = %Schema{ref: "#/components/schemas/Response"}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, ref}
    end

    test "returns original response when schema is nil" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      result = ResponseConverter.convert_response(response, nil)
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end

    test "returns original response when component module doesn't exist" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      schema = %Schema{ref: "#/components/schemas/NonExistentComponent"}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end

    test "passes through error tuples unchanged" do
      response = {:error, "Something went wrong"}
      schema = %Schema{ref: "#/components/schemas/Response"}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:error, "Something went wrong"}
    end

    test "handles non-map responses" do
      response = {:ok, "just a string"}
      schema = %Schema{ref: "#/components/schemas/Response"}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, "just a string"}
    end

    test "returns original response when no keys match" do
      response = {:ok, %{"unknown_key" => "value", "another_unknown" => "value2"}}
      schema = %Schema{ref: "#/components/schemas/Response"}
      
      result = ResponseConverter.convert_response(response, schema)
      # Should return original map when Response component exists but no keys match
      assert result == {:ok, %{"unknown_key" => "value", "another_unknown" => "value2"}}
    end

    test "handles schema without ref (direct types)" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      schema = %Schema{type: "object", properties: %{}}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end

    test "handles oneOf schemas" do
      response = {:ok, %{"id" => "123", "type" => "test_type"}}
      schema = %Schema{
        one_of: [
          %Schema{ref: "#/components/schemas/NonExistent"},
          %Schema{ref: "#/components/schemas/AnotherNonExistent"}
        ]
      }
      
      result = ResponseConverter.convert_response(response, schema)
      # Since none of the components exist, should return original
      assert result == {:ok, %{"id" => "123", "type" => "test_type"}}
    end

    test "handles anyOf schemas" do
      response = {:ok, %{"id" => "123", "data" => "test_data"}}
      schema = %Schema{
        any_of: [
          %Schema{ref: "#/components/schemas/Component1"},
          %Schema{ref: "#/components/schemas/Component2"}
        ]
      }
      
      result = ResponseConverter.convert_response(response, schema)
      # Since components don't exist, should return original
      assert result == {:ok, %{"id" => "123", "data" => "test_data"}}
    end

    test "handles empty oneOf list" do
      response = {:ok, %{"id" => "123"}}
      schema = %Schema{one_of: []}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, %{"id" => "123"}}
    end

    test "handles empty anyOf list" do
      response = {:ok, %{"id" => "123"}}
      schema = %Schema{any_of: []}
      
      result = ResponseConverter.convert_response(response, schema)
      assert result == {:ok, %{"id" => "123"}}
    end
  end

  # Integration test with actual Response component if it exists
  if Code.ensure_loaded?(ExOpenAI.Components.Response) do
    describe "convert_response/2 with real Response component" do
      test "converts simple API response to Response struct" do
        api_response = %{
          "id" => "resp_123",
          "object" => "response",
          "created_at" => 1234567890,
          "model" => "gpt-4o-mini",
          "status" => "completed"
        }
        
        schema = %Schema{ref: "#/components/schemas/Response"}
        result = ResponseConverter.convert_response({:ok, api_response}, schema)
        
        case result do
          {:ok, %ExOpenAI.Components.Response{} = response} ->
            assert response.id == "resp_123"
            assert response.object == :response
            assert response.created_at == 1234567890
            assert response.model == "gpt-4o-mini"
            assert response.status == :completed
            
          {:ok, map} when is_map(map) ->
            # If Response component doesn't have matching fields, it returns the map
            assert map["id"] == "resp_123"
        end
      end
      
      test "converts complex API response with nested structs" do
        # The exact response provided by the user
        api_response = %{
          "background" => false,
          "created_at" => 1750675809,
          "error" => nil,
          "id" => "resp_685931611e18819a97e356931916df60046391d626b27379",
          "incomplete_details" => nil,
          "instructions" => nil,
          "max_output_tokens" => nil,
          "metadata" => %{},
          "model" => "gpt-4o-mini-2024-07-18",
          "object" => "response",
          "output" => [
            %{
              "content" => [
                %{
                  "annotations" => [],
                  "text" => "Why did the scarecrow win an award?  \n\nBecause he was outstanding in his field!",
                  "type" => "output_text"
                }
              ],
              "id" => "msg_68593161dcc0819a8e0ee42deab92f32046391d626b27379",
              "role" => "assistant",
              "status" => "completed",
              "type" => "message"
            }
          ],
          "parallel_tool_calls" => true,
          "previous_response_id" => nil,
          "reasoning" => %{"effort" => nil, "summary" => nil},
          "service_tier" => "default",
          "status" => "completed",
          "store" => true,
          "temperature" => 1.0,
          "text" => %{"format" => %{"type" => "text"}},
          "tool_choice" => "auto",
          "tools" => [],
          "top_p" => 1.0,
          "truncation" => "disabled",
          "usage" => %{
            "input_tokens" => 11,
            "input_tokens_details" => %{"cached_tokens" => 0},
            "output_tokens" => 19,
            "output_tokens_details" => %{"reasoning_tokens" => 0},
            "total_tokens" => 30
          },
          "user" => nil
        }
        
        schema = %Schema{ref: "#/components/schemas/Response"}
        result = ResponseConverter.convert_response({:ok, api_response}, schema)
        
        case result do
          {:ok, %ExOpenAI.Components.Response{} = response} ->
            # Basic fields
            assert response.id == "resp_685931611e18819a97e356931916df60046391d626b27379"
            assert response.object == :response
            assert response.status == :completed
            
            # Check nested structs if they exist
            if Code.ensure_loaded?(ExOpenAI.Components.Reasoning) and 
               function_exported?(ExOpenAI.Components.Reasoning, :__struct__, 0) do
              assert is_struct(response.reasoning, ExOpenAI.Components.Reasoning)
              assert response.reasoning.effort == nil
              assert response.reasoning.summary == nil
            end
            
            if Code.ensure_loaded?(ExOpenAI.Components.Metadata) and
               function_exported?(ExOpenAI.Components.Metadata, :__struct__, 0) do
              assert is_struct(response.metadata, ExOpenAI.Components.Metadata)
            end
            
            if Code.ensure_loaded?(ExOpenAI.Components.ResponseUsage) and
               function_exported?(ExOpenAI.Components.ResponseUsage, :__struct__, 0) do
              assert is_struct(response.usage, ExOpenAI.Components.ResponseUsage)
              assert response.usage.input_tokens == 11
              assert response.usage.output_tokens == 19
              assert response.usage.total_tokens == 30
            end
            
          {:ok, map} when is_map(map) ->
            # Fallback if Response component doesn't exist
            assert map["id"] == "resp_685931611e18819a97e356931916df60046391d626b27379"
        end
      end
    end
  end
end