defmodule ExOpenAI.Codegen.PathModuleGeneratorResponseSchemaTest do
  use ExUnit.Case

  alias ExOpenAI.Codegen.PathModuleGenerator
  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema}

  test "get_response_schema handles simple $ref" do
    responses = %{
      "200" => %{
        content: %{
          "application/json" => %{"schema" => %{"$ref" => "#/components/schemas/Foo"}}
        }
      }
    }

    op = %Operation{responses: responses}
    assert %Schema{ref: "#/components/schemas/Foo"} =
             PathModuleGenerator.get_response_schema(op, "200", %{})
  end

  test "get_response_schema handles oneOf refs" do
    responses = %{
      "200" => %{
        content: %{
          "application/json" => %{
            "schema" => %{
              "oneOf" => [
                %{"$ref" => "#/components/schemas/Foo"},
                %{"$ref" => "#/components/schemas/Bar"}
              ]
            }
          }
        }
      }
    }

    op = %Operation{responses: responses}
    assert %Schema{
             one_of: [%Schema{ref: "#/components/schemas/Foo"}, %Schema{ref: "#/components/schemas/Bar"}]
           } = PathModuleGenerator.get_response_schema(op, "200", %{})
  end
end
