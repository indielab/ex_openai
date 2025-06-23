defmodule ExOpenAI.Codegen.SchemaResolverTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.SchemaResolver
  alias ExOpenAI.Codegen.DocsParser.Schema
  
  describe "resolve_schema/2" do
    test "returns schema as-is when no allOf" do
      schema = %Schema{
        type: "object",
        properties: %{"name" => %Schema{type: "string"}},
        required: ["name"]
      }
      
      resolved = SchemaResolver.resolve_schema(schema, %{})
      
      assert resolved == schema
    end
    
    test "resolves schema with allOf references" do
      base_schema = %Schema{
        properties: %{
          "id" => %Schema{type: "integer"},
          "created_at" => %Schema{type: "string"}
        },
        required: ["id"]
      }
      
      schemas = %{"BaseModel" => base_schema}
      
      schema = %Schema{
        all_of: [
          %Schema{ref: "#/components/schemas/BaseModel"},
          %Schema{
            properties: %{
              "name" => %Schema{type: "string"},
              "email" => %Schema{type: "string"}
            },
            required: ["name"]
          }
        ]
      }
      
      resolved = SchemaResolver.resolve_schema(schema, schemas)
      
      # Should have merged properties
      assert Map.keys(resolved.properties) |> Enum.sort() == ["created_at", "email", "id", "name"]
      
      # Should have merged required fields
      assert resolved.required |> Enum.sort() == ["id", "name"]
    end
    
    test "handles nested allOf resolution" do
      grandparent = %Schema{
        properties: %{"id" => %Schema{type: "integer"}},
        required: ["id"]
      }
      
      parent = %Schema{
        all_of: [
          %Schema{ref: "#/components/schemas/GrandParent"}
        ],
        properties: %{"name" => %Schema{type: "string"}},
        required: ["name"]
      }
      
      schemas = %{
        "GrandParent" => grandparent,
        "Parent" => parent
      }
      
      child = %Schema{
        all_of: [
          %Schema{ref: "#/components/schemas/Parent"}
        ],
        properties: %{"age" => %Schema{type: "integer"}}
      }
      
      resolved = SchemaResolver.resolve_schema(child, schemas)
      
      # Should have all properties from the hierarchy
      assert Map.keys(resolved.properties) |> Enum.sort() == ["age", "id", "name"]
      assert resolved.required |> Enum.sort() == ["id", "name"]
    end
    
    test "handles missing schema references gracefully" do
      schema = %Schema{
        all_of: [
          %Schema{ref: "#/components/schemas/NonExistent"},
          %Schema{properties: %{"name" => %Schema{type: "string"}}}
        ]
      }
      
      resolved = SchemaResolver.resolve_schema(schema, %{})
      
      # Should only have the inline schema properties
      assert Map.keys(resolved.properties) == ["name"]
    end
  end
  
  describe "get_request_body_schema/2" do
    test "returns nil for nil request body" do
      assert SchemaResolver.get_request_body_schema(nil, %{}) == nil
    end
    
    test "extracts and resolves schema from request body" do
      schema = %Schema{
        properties: %{"message" => %Schema{type: "string"}},
        required: ["message"]
      }
      
      schemas = %{"CreateRequest" => schema}
      
      request_body = %{
        content: %{
          "application/json" => %{
            "schema" => %{"$ref" => "#/components/schemas/CreateRequest"}
          }
        }
      }
      
      resolved = SchemaResolver.get_request_body_schema(request_body, schemas)
      
      assert resolved == schema
    end
    
    test "extracts and resolves schema from multipart/form-data" do
      schema = %Schema{
        properties: %{
          "file" => %Schema{type: "string", format: "binary"},
          "model" => %Schema{type: "string"}
        },
        required: ["file", "model"]
      }
      
      schemas = %{"Upload" => schema}
      
      request_body = %{
        content: %{
          "multipart/form-data" => %{
            "schema" => %{"$ref" => "#/components/schemas/Upload"}
          }
        }
      }
      
      resolved = SchemaResolver.get_request_body_schema(request_body, schemas)
      
      assert resolved == schema
    end
    
    test "returns nil when schema not found in schemas map" do
      request_body = %{
        content: %{
          "application/json" => %{
            "schema" => %{"$ref" => "#/components/schemas/Missing"}
          }
        }
      }
      
      assert SchemaResolver.get_request_body_schema(request_body, %{}) == nil
    end
  end
end