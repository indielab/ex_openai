defmodule ExOpenAI.Codegen.ComponentModuleGeneratorTest do
  use ExUnit.Case

  alias ExOpenAI.Codegen.ComponentModuleGenerator
  alias ExOpenAI.Codegen.DocsParser.Schema

  describe "generate_module/1" do
    test "generates module for simple object schema" do
      schema = %Schema{
        name: "TestModel",
        type: "object",
        description: "A test model",
        properties: %{
          "id" => %Schema{type: "string"},
          "count" => %Schema{type: "integer"}
        },
        required: ["id"]
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # Check module structure
      assert module_string =~ "defmodule ExOpenAI.Components.TestModel do"
      assert module_string =~ "@moduledoc \"A test model\\n\\n## Fields"
      assert module_string =~ "@type t() :: %{__struct__: __MODULE__,"
      assert module_string =~ "defstruct [:count, :id]"

      # Check type fields - id is required, count is optional
      assert module_string =~ "count: integer() | nil"
      assert module_string =~ "id: String.t()"
    end

    test "generates module for object with no description" do
      schema = %Schema{
        name: "NoDescription",
        type: "object",
        properties: %{
          "field" => %Schema{type: "string"}
        }
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      assert module_string =~
               "@moduledoc \"Module for representing the OpenAI schema NoDescription."

      assert module_string =~ "## Fields"
      assert module_string =~ "`:field` - **optional**"
    end

    test "generates module for object with nullable properties" do
      schema = %Schema{
        name: "NullableTest",
        type: "object",
        properties: %{
          "nullable_field" => %Schema{type: "string", nullable: true},
          "required_nullable" => %Schema{type: "integer", nullable: true}
        },
        required: ["required_nullable"]
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # nullable_field is optional and nullable
      assert module_string =~ "nullable_field: String.t() | nil"
      # required_nullable is required but can be explicitly null
      assert module_string =~ "required_nullable: integer() | nil"
    end

    test "generates module for object with complex properties" do
      schema = %Schema{
        name: "ComplexModel",
        type: "object",
        properties: %{
          "status" => %Schema{type: "string", enum: ["active", "inactive"]},
          "items" => %Schema{type: "array", items: %Schema{type: "string"}},
          "metadata" => %Schema{ref: "#/components/schemas/Metadata"}
        },
        required: ["status"]
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # Check complex types
      assert module_string =~ "status: :active | :inactive"
      assert module_string =~ "items: list(String.t()) | nil"
      assert module_string =~ "metadata: ExOpenAI.Components.Metadata.t() | nil"
    end

    test "generates module for non-object schema (type alias)" do
      schema = %Schema{
        name: "StatusEnum",
        type: "string",
        description: "Status values",
        enum: ["pending", "active", "inactive"]
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # Check it's a type alias, not a struct
      assert module_string =~ "defmodule ExOpenAI.Components.StatusEnum do"
      assert module_string =~ "@moduledoc \"Status values\\n\\n## Type"
      assert module_string =~ "## Allowed Values"
      assert module_string =~ "@type t() :: (:pending | :active) | :inactive"
      refute module_string =~ "defstruct"
    end

    test "generates module for oneOf schema" do
      schema = %Schema{
        name: "MessageContent",
        type: nil,
        one_of: [
          %Schema{type: "string"},
          %Schema{type: "array", items: %Schema{ref: "#/components/schemas/ContentPart"}}
        ]
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # Should be a type alias for the union
      assert module_string =~
               "@type t() :: String.t() | list(ExOpenAI.Components.ContentPart.t())"

      refute module_string =~ "defstruct"
    end

    test "handles empty properties" do
      schema = %Schema{
        name: "EmptyObject",
        type: "object",
        properties: %{}
      }

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      assert module_string =~ "defstruct []"
      assert module_string =~ "@type t() :: %{__struct__: __MODULE__}"
    end

    test "generates ChatCompletionRequestUserMessage from testdata" do
      # Load the actual schema
      {schema, _} = Code.eval_file("test/testdata/ChatCompletionRequestUserMessage.exs")

      ast = ComponentModuleGenerator.generate_module(schema)
      module_string = Macro.to_string(ast)

      # Check module structure
      assert module_string =~ "defmodule ExOpenAI.Components.ChatCompletionRequestUserMessage do"
      assert module_string =~ "@moduledoc \"Messages sent by an end user"
      assert module_string =~ "defstruct [:content, :name, :role]"

      # Check the type definition
      assert module_string =~ "@type t() :: %{"
      assert module_string =~ "__struct__: __MODULE__"
      assert module_string =~ "content:"

      assert module_string =~
               "String.t() | list(ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t())"

      assert module_string =~ "name: String.t() | nil"
      assert module_string =~ "role: :user"
    end
  end

  describe "generate_comprehensive_moduledoc/1" do
    test "generates documentation with all field details" do
      schema = %Schema{
        name: "TestComponent",
        type: "object",
        description: "A comprehensive test component.",
        properties: %{
          "id" => %Schema{
            name: "id",
            type: "string",
            description: "The unique identifier.",
            format: "uuid"
          },
          "count" => %Schema{
            name: "count",
            type: "integer",
            description: "The count value.",
            raw: %{"minimum" => 0, "maximum" => 100, "default" => 10}
          },
          "status" => %Schema{
            name: "status",
            type: "string",
            description: "The current status.",
            enum: ["active", "inactive", "pending"]
          },
          "tags" => %Schema{
            name: "tags",
            type: "array",
            items: %Schema{type: "string"},
            raw: %{"minItems" => 1, "maxItems" => 10}
          }
        },
        required: ["id", "status"]
      }

      doc = ComponentModuleGenerator.generate_comprehensive_moduledoc(schema)

      assert doc =~ "A comprehensive test component."
      assert doc =~ "## Fields"

      # Check id field
      assert doc =~ "`:id` - **required**"
      assert doc =~ "The unique identifier."
      assert doc =~ "Format: `uuid`"

      # Check count field
      assert doc =~ "`:count` - **optional**"
      assert doc =~ "The count value."
      assert doc =~ "Default: `10`"
      assert doc =~ "Constraints: minimum: 0, maximum: 100"

      # Check status field
      assert doc =~ "`:status` - **required**"
      assert doc =~ "The current status."
      assert doc =~ "Allowed values: `\"active\"`, `\"inactive\"`, `\"pending\"`"

      # Check tags field
      assert doc =~ "`:tags` - **optional**"
      assert doc =~ "Constraints: minItems: 1, maxItems: 10"
    end

    test "generates documentation for non-object schemas" do
      schema = %Schema{
        name: "ModelEnum",
        type: "string",
        description: "Available AI models.",
        enum: ["gpt-4", "gpt-3.5-turbo"],
        raw: %{"minLength" => 3}
      }

      doc = ComponentModuleGenerator.generate_comprehensive_moduledoc(schema)

      assert doc =~ "Available AI models."
      assert doc =~ "## Type"
      assert doc =~ "## Allowed Values"
      assert doc =~ "`\"gpt-4\"`, `\"gpt-3.5-turbo\"`"
      assert doc =~ "## Constraints"
      assert doc =~ "minLength: 3"
    end
  end
end
