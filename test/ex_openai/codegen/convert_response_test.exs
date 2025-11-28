defmodule ExOpenAI.Components.TestComponent do
  defstruct [:id, :name, :value, :array]

  @type t() :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          value: %{required(:nested) => any()} | nil,
          array: [ %{optional(:item) => any()} ] | nil
        }
end

defmodule ExOpenAI.Components.AnotherTestComponent do
  defstruct [:id, :type, :data]

  @type t() :: %__MODULE__{
          id: String.t(),
          type: String.t(),
          data: any()
        }
end

defmodule ExOpenAI.Codegen.ConvertResponseTest do
  use ExUnit.Case, async: false

  alias ExOpenAI.Codegen.ResponseConverter
  alias ExOpenAI.Codegen.DocsParser.Schema

  defp component_schema(name), do: %Schema{ref: "#/components/schemas/#{name}"}

  describe "convert_response/2" do
    test "handles response with 'response' and 'type' keys" do
      response = {:ok, %{"response" => %{"id" => "123", "name" => "test"}, "type" => "some_type"}}
      result = ResponseConverter.convert_response(response, nil)
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end

    test "passes through reference values unchanged" do
      ref = make_ref()
      response = {:ok, ref}
      result = ResponseConverter.convert_response(response, nil)
      assert result == {:ok, ref}
    end

    test "returns original response when response_type is nil" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      result = ResponseConverter.convert_response(response, nil)
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end

    test "converts response to component struct when keys match" do
      response = {:ok, %{"id" => "123", "name" => "test", "value" => 42}}
      result = ResponseConverter.convert_response(response, component_schema("TestComponent"))

      assert match?({:ok, %ExOpenAI.Components.TestComponent{}}, result)
      {:ok, struct} = result
      assert struct.id == "123"
      assert struct.name == "test"
      assert struct.value == 42
    end

    test "returns original response when no keys match the component" do
      response = {:ok, %{"foo" => "bar", "baz" => "qux"}}
      result = ResponseConverter.convert_response(response, component_schema("TestComponent"))
      assert result == {:ok, %{"foo" => "bar", "baz" => "qux"}}
    end

    test "handles oneOf with multiple possible components - best match wins" do
      response = {:ok, %{"id" => "123", "name" => "test", "value" => 42, "extra" => "ignored"}}

      result =
        ResponseConverter.convert_response(response, %Schema{
          one_of: [component_schema("TestComponent"), component_schema("AnotherTestComponent")]
        })

      assert match?({:ok, %ExOpenAI.Components.TestComponent{}}, result)
      {:ok, struct} = result
      assert struct.id == "123"
      assert struct.name == "test"
      assert struct.value == 42

      response = {:ok, %{"id" => "123", "type" => "test", "data" => %{}, "extra" => "ignored"}}

      result =
        ResponseConverter.convert_response(response, %Schema{
          one_of: [component_schema("TestComponent"), component_schema("AnotherTestComponent")]
        })

      assert match?({:ok, %ExOpenAI.Components.AnotherTestComponent{}}, result)
      {:ok, struct} = result
      assert struct.id == "123"
      assert struct.type == "test"
      assert struct.data == %{}
    end

    test "handles oneOf when no components match" do
      response = {:ok, %{"foo" => "bar", "baz" => "qux"}}

      result =
        ResponseConverter.convert_response(response, %Schema{
          one_of: [component_schema("TestComponent"), component_schema("AnotherTestComponent")]
        })

      assert result == {:ok, %{"foo" => "bar", "baz" => "qux"}}
    end

    test "passes through error tuples unchanged" do
      response = {:error, "Something went wrong"}
      result = ResponseConverter.convert_response(response, component_schema("TestComponent"))
      assert result == {:error, "Something went wrong"}
    end

    test "handles nested data structures with atomized keys" do
      response =
        {:ok,
         %{
           "id" => "123",
           "name" => "test",
           "value" => %{"nested" => "data"},
           "array" => [%{"item" => 1}, %{"item" => 2}]
         }}

      result = ResponseConverter.convert_response(response, component_schema("TestComponent"))

      assert match?({:ok, %ExOpenAI.Components.TestComponent{}}, result)
      {:ok, struct} = result
      assert struct.id == "123"
      assert struct.name == "test"
      # Nested maps and lists should have atom keys
      assert struct.value[:nested] == "data"
      assert Enum.map(struct.array, & &1[:item]) == [1, 2]
    end

    test "handles string keys by converting them to atoms" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      result = ResponseConverter.convert_response(response, component_schema("TestComponent"))

      assert match?({:ok, %ExOpenAI.Components.TestComponent{}}, result)
      {:ok, struct} = result
      assert struct.id == "123"
      assert struct.name == "test"
      assert struct.value == nil
    end

    test "handles unknown response types by returning original response" do
      response = {:ok, %{"id" => "123", "name" => "test"}}
      result = ResponseConverter.convert_response(response, %Schema{ref: "#/components/schemas/Unknown"})
      assert result == {:ok, %{"id" => "123", "name" => "test"}}
    end
  end
end
