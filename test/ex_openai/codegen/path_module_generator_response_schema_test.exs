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
             one_of: [
               %Schema{ref: "#/components/schemas/Foo"},
               %Schema{ref: "#/components/schemas/Bar"}
             ]
           } = PathModuleGenerator.get_response_schema(op, "200", %{})
  end

  test "get_response_schema handles inline oneOf members" do
    responses = %{
      "200" => %{
        content: %{
          "application/json" => %{
            "schema" => %{
              "oneOf" => [
                %{
                  "type" => "object",
                  "properties" => %{"id" => %{"type" => "string"}},
                  "required" => ["id"]
                },
                %{
                  "type" => "array",
                  "items" => %{"type" => "integer"}
                }
              ]
            }
          }
        }
      }
    }

    op = %Operation{responses: responses}

    assert %Schema{
             one_of: [
               %Schema{
                 type: "object",
                 properties: %{"id" => %Schema{type: "string"}},
                 required: ["id"]
               },
               %Schema{
                 type: "array",
                 items: %Schema{type: "integer"}
               }
             ]
           } = PathModuleGenerator.get_response_schema(op, "200", %{})
  end

  test "get_response_schema handles inline anyOf members" do
    responses = %{
      "200" => %{
        content: %{
          "application/json" => %{
            "schema" => %{
              "anyOf" => [
                %{
                  "type" => "object",
                  "properties" => %{"status" => %{"type" => "string"}}
                },
                %{
                  "type" => "array",
                  "items" => %{"type" => "boolean"}
                }
              ]
            }
          }
        }
      }
    }

    op = %Operation{responses: responses}

    assert %Schema{
             any_of: [
               %Schema{
                 type: "object",
                 properties: %{"status" => %Schema{type: "string"}}
               },
               %Schema{
                 type: "array",
                 items: %Schema{type: "boolean"}
               }
             ]
           } = PathModuleGenerator.get_response_schema(op, "200", %{})
  end
end
