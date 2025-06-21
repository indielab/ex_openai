defmodule ExOpenAI.Codegen.TypespecGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.TypespecGenerator
  alias ExOpenAI.Codegen.DocsParser.Schema
  
  describe "schema_to_typespec/1" do
    test "converts simple string type" do
      schema = %Schema{type: "string"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "String.t()"
    end
    
    test "converts integer type" do
      schema = %Schema{type: "integer"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "integer()"
    end
    
    test "converts number type" do
      schema = %Schema{type: "number"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "number()"
    end
    
    test "converts boolean type" do
      schema = %Schema{type: "boolean"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "boolean()"
    end
    
    test "handles nullable types" do
      schema = %Schema{type: "string", nullable: true}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "String.t() | nil"
    end
    
    test "converts string enum to union type" do
      schema = %Schema{type: "string", enum: ["option1", "option2", "option3"]}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      # The AST generates with parentheses due to left-associativity
      assert typespec_string == "(:option1 | :option2) | :option3"
    end
    
    test "handles nullable enum" do
      schema = %Schema{type: "string", enum: ["active", "inactive"], nullable: true}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "(:active | :inactive) | nil"
    end
    
    test "converts array with string items" do
      schema = %Schema{
        type: "array",
        items: %Schema{type: "string"}
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "list(String.t())"
    end
    
    test "converts array with integer items" do
      schema = %Schema{
        type: "array", 
        items: %Schema{type: "integer"}
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "list(integer())"
    end
    
    test "converts nested arrays" do
      schema = %Schema{
        type: "array",
        items: %Schema{
          type: "array",
          items: %Schema{type: "string"}
        }
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "list(list(String.t()))"
    end
    
    test "converts object without properties to map" do
      schema = %Schema{type: "object"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "map()"
    end
    
    test "converts object with required and optional properties" do
      schema = %Schema{
        type: "object",
        properties: %{
          "name" => %Schema{type: "string"},
          "age" => %Schema{type: "integer"},
          "active" => %Schema{type: "boolean"}
        },
        required: ["name"]
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      # The order might vary, so let's check for individual parts
      assert typespec_string =~ "%{"
      assert typespec_string =~ "}"
      assert typespec_string =~ "required(:name) => String.t()"
      assert typespec_string =~ "optional(:age) => integer()"
      assert typespec_string =~ "optional(:active) => boolean()"
    end
    
    test "converts nested objects" do
      schema = %Schema{
        type: "object",
        properties: %{
          "user" => %Schema{
            type: "object",
            properties: %{
              "id" => %Schema{type: "integer"},
              "email" => %Schema{type: "string"}
            },
            required: ["id"]
          },
          "metadata" => %Schema{type: "object"}
        },
        required: ["user"]
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      # Check for the required user property with nested object
      assert typespec_string =~ "required(:user) => %{"
      assert typespec_string =~ "required(:id) => integer()"
      assert typespec_string =~ "optional(:email) => String.t()"
      assert typespec_string =~ "optional(:metadata) => map()"
    end
    
    test "converts object with enum property" do
      schema = %Schema{
        type: "object",
        properties: %{
          "status" => %Schema{type: "string", enum: ["active", "inactive"]},
          "count" => %Schema{type: "integer"}
        },
        required: ["status"]
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string =~ "required(:status) => :active | :inactive"
      assert typespec_string =~ "optional(:count) => integer()"
    end
    
    test "handles object with reference property" do
      schema = %Schema{
        type: "object",
        properties: %{
          "ranking_options" => %Schema{ref: "#/components/schemas/FileSearchRankingOptions"}
        }
      }
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      # References should be any() for now
      assert typespec_string =~ "optional(:ranking_options) => any()"
    end
    
    test "handles unknown types as any()" do
      schema = %Schema{type: "unknown"}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "any()"
    end
    
    test "handles nil type as any()" do
      schema = %Schema{type: nil}
      
      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)
      
      assert typespec_string == "any()"
    end
  end
end