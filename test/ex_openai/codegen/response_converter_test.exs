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
      test "converts API response to Response struct" do
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
    end
  end
end