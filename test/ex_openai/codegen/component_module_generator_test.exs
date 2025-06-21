defmodule ExOpenAI.Codegen.ComponentModuleGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.ComponentModuleGenerator
  alias ExOpenAI.Codegen.DocsParser.Schema
  
  describe "generate_module/1" do
    test "generates a basic module from a simple schema" do
      schema = %Schema{
        name: "TestComponent",
        type: "object",
        properties: %{
          "field1" => %Schema{
            name: "field1",
            type: "string"
          }
        }
      }
      
      ast = ComponentModuleGenerator.generate_module(schema)
      
      # Convert AST to string for inspection
      code = Macro.to_string(ast)
      
      assert code =~ "defmodule ExOpenAI.Components.TestComponent do"
      assert code =~ "end"
    end
    
    test "handles schema names with underscores" do
      schema = %Schema{
        name: "CreateImageEditRequest",
        type: "object"
      }
      
      ast = ComponentModuleGenerator.generate_module(schema)
      code = Macro.to_string(ast)
      
      assert code =~ "defmodule ExOpenAI.Components.CreateImageEditRequest do"
    end
  end
end