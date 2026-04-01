defmodule ExOpenAI.Codegen.TypespecGeneratorTest do
  use ExUnit.Case

  alias ExOpenAI.Codegen.TypespecGenerator
  alias ExOpenAI.Codegen.DocsParser.Schema

  # Helper to compare AST
  defp assert_ast_equal(actual_ast, expected_ast) do
    # For most cases, direct string comparison works
    assert Macro.to_string(actual_ast) == Macro.to_string(expected_ast)
  end

  # Helper for comparing map typespecs where order doesn't matter
  defp assert_map_typespec_equal(actual_ast, expected_properties) do
    actual_string = Macro.to_string(actual_ast)

    # Check it's a map
    assert actual_string =~ ~r/^%\{.*\}$/s

    # Check each expected property is present
    Enum.each(expected_properties, fn property_string ->
      assert actual_string =~ property_string
    end)
  end

  describe "schema_to_typespec/1" do
    test "converts simple string type" do
      schema = %Schema{type: "string"}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: String.t()

      assert_ast_equal(ast, expected)
    end

    test "converts binary string format to binary()" do
      schema = %Schema{type: "string", format: "binary"}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: binary()

      assert_ast_equal(ast, expected)
    end

    test "converts integer type" do
      schema = %Schema{type: "integer"}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: integer()

      assert_ast_equal(ast, expected)
    end

    test "converts number type" do
      schema = %Schema{type: "number"}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: number()

      assert_ast_equal(ast, expected)
    end

    test "converts boolean type" do
      schema = %Schema{type: "boolean"}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: boolean()

      assert_ast_equal(ast, expected)
    end

    test "handles nullable types" do
      schema = %Schema{type: "string", nullable: true}

      ast = TypespecGenerator.schema_to_typespec(schema)
      expected = quote do: String.t() | nil

      assert_ast_equal(ast, expected)
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

      # Check each property is present with correct type
      assert_map_typespec_equal(ast, [
        "required(:name) => String.t()",
        "optional(:age) => integer()",
        "optional(:active) => boolean()"
      ])
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

      # References should resolve to module types
      assert typespec_string =~
               "optional(:ranking_options) => ExOpenAI.Components.FileSearchRankingOptions.t()"
    end

    test "converts AssistantToolsFileSearch schema from testdata" do
      # Load the actual schema from testdata
      {schema, _} = Code.eval_file("test/testdata/AssistantToolsFileSearch.exs")

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      # Check main structure
      assert_map_typespec_equal(ast, [
        "required(:type) => :file_search"
      ])

      # Check nested file_search object is present and contains expected fields
      assert typespec_string =~ "optional(:file_search) => %{"
      assert typespec_string =~ "optional(:max_num_results) => integer()"

      assert typespec_string =~
               "optional(:ranking_options) => ExOpenAI.Components.FileSearchRankingOptions.t()"
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

    test "handles type: nil with oneOf" do
      schema = %Schema{
        type: nil,
        one_of: [
          %Schema{type: "string"},
          %Schema{type: "integer"}
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      assert typespec_string == "String.t() | integer()"
    end

    test "handles type: nil with anyOf" do
      schema = %Schema{
        type: nil,
        any_of: [
          %Schema{type: "string"},
          %Schema{type: "array", items: %Schema{type: "string"}}
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      assert typespec_string == "String.t() | list(String.t())"
    end

    test "handles type: nil with allOf" do
      schemas = %{
        "Base" => %Schema{
          type: "object",
          properties: %{
            "id" => %Schema{type: "integer"}
          },
          required: ["id"]
        }
      }

      schema = %Schema{
        type: nil,
        all_of: [
          %Schema{ref: "#/components/schemas/Base"},
          %Schema{
            type: "object",
            properties: %{"extra" => %Schema{type: "string"}},
            required: ["extra"]
          }
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema, schemas)

      assert_map_typespec_equal(ast, [
        "required(:extra) => String.t()",
        "required(:id) => integer()"
      ])
    end

    test "handles inline allOf without component refs" do
      schema = %Schema{
        type: nil,
        all_of: [
          %Schema{
            type: "object",
            properties: %{"id" => %Schema{type: "integer"}},
            required: ["id"]
          },
          %Schema{
            type: "object",
            properties: %{"name" => %Schema{type: "string"}}
          }
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)

      assert_map_typespec_equal(ast, [
        "required(:id) => integer()",
        "optional(:name) => String.t()"
      ])
    end

    test "handles type: nil with enum" do
      schema = %Schema{
        type: nil,
        enum: ["active", "inactive", "pending"]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      assert typespec_string == "(:active | :inactive) | :pending"
    end

    test "handles complex oneOf like ChatCompletionRequestUserMessage content" do
      schema = %Schema{
        type: nil,
        one_of: [
          %Schema{type: "string"},
          %Schema{
            type: "array",
            items: %Schema{
              ref: "#/components/schemas/ChatCompletionRequestUserMessageContentPart"
            }
          }
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      # References should resolve to component types
      assert typespec_string ==
               "String.t() | list(ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t())"
    end

    test "handles direct ref schemas" do
      schema = %Schema{
        ref: "#/components/schemas/ChatCompletionRequestMessage"
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      assert typespec_string == "ExOpenAI.Components.ChatCompletionRequestMessage.t()"
    end

    test "handles refs with non-component patterns" do
      schema = %Schema{
        ref: "#/some/other/pattern/Thing"
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      # Non-component refs still return any()
      assert typespec_string == "any()"
    end

    test "handles nullable with oneOf" do
      schema = %Schema{
        type: nil,
        nullable: true,
        one_of: [
          %Schema{type: "string"},
          %Schema{type: "boolean"}
        ]
      }

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      assert typespec_string == "(String.t() | boolean()) | nil"
    end

    test "converts ChatCompletionRequestUserMessage schema from testdata" do
      # Load the actual schema from testdata
      {schema, _} = Code.eval_file("test/testdata/ChatCompletionRequestUserMessage.exs")

      ast = TypespecGenerator.schema_to_typespec(schema)
      typespec_string = Macro.to_string(ast)

      # Match the exact expected output
      expected =
        "%{\n  required(:content) =>\n    String.t() | list(ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t()),\n  optional(:name) => String.t(),\n  required(:role) => :user\n}"

      assert typespec_string == expected
    end
  end
end
