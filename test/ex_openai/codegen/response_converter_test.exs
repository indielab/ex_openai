defmodule ExOpenAI.Codegen.ResponseConverterTest do
  use ExUnit.Case, async: true

  alias ExOpenAI.Codegen.ResponseConverter
  alias ExOpenAI.Codegen.DocsParser.Schema

  @moduledoc """
  Tests for the response conversion logic.

  These tests exercise:

  * Top-level response conversion to component structs
  * Handling of oneOf/anyOf schemas
  * Field type extraction from typespec ASTs
  * Primitive and union parsing in `parse_remote_type/2`
  * Deep key atomization via `deep_atomize_keys/1`
  """

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
          "created_at" => 1_234_567_890,
          "model" => "gpt-4o-mini",
          "status" => "completed"
        }

        schema = %Schema{ref: "#/components/schemas/Response"}
        result = ResponseConverter.convert_response({:ok, api_response}, schema)

        case result do
          {:ok, %ExOpenAI.Components.Response{} = response} ->
            assert response.id == "resp_123"
            assert response.object == :response
            assert response.created_at == 1_234_567_890
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
          "created_at" => 1_750_675_809,
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
                  "text" =>
                    "Why did the scarecrow win an award?  \n\nBecause he was outstanding in his field!",
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

            # Nested fields are converted to their component structs when possible.
            assert is_struct(response.reasoning, ExOpenAI.Components.Reasoning)
            assert response.reasoning.effort == nil
            assert response.reasoning.summary == nil

            # Metadata is a free-form map alias; keep it as a map.
            assert is_map(response.metadata)
            assert response.metadata == %{}

            assert is_struct(response.usage, ExOpenAI.Components.ResponseUsage)
            assert response.usage.input_tokens == 11
            assert response.usage.output_tokens == 19
            assert response.usage.total_tokens == 30

            # Output items come from OutputItem union and should be concrete structs
            assert is_list(response.output)
            assert length(response.output) == 1

            output_item = List.first(response.output)
            assert is_struct(output_item, ExOpenAI.Components.OutputMessage)

            assert output_item.id ==
                     "msg_68593161dcc0819a8e0ee42deab92f32046391d626b27379"

            assert output_item.role == :assistant
            assert output_item.status == "completed"
            assert output_item.type == :message

            assert is_list(output_item.content)
            assert length(output_item.content) == 1

          {:ok, map} when is_map(map) ->
            # This should only happen if Response component doesn't exist
            flunk(
              "Expected conversion to ExOpenAI.Components.Response struct, got plain map: #{inspect(map)}"
            )
        end
      end
    end
  end

  describe "get_field_type_from_ast/2" do
    test "extracts field type from typespec AST" do
      typespec_ast = [
        type:
          {:t,
           {:type, 1, :map,
            [
              {:type, 1, :map_field_exact,
               [{:atom, 0, :__struct__}, {:atom, 0, ExOpenAI.Components.Response}]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :background},
                 {:type, 1, :union, [{:type, 1, :boolean, []}, {:atom, 0, nil}]}
               ]},
              {:type, 1, :map_field_exact, [{:atom, 0, :created_at}, {:type, 1, :number, []}]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :error},
                 {:remote_type, 1,
                  [{:atom, 0, ExOpenAI.Components.ResponseError}, {:atom, 0, :t}, []]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :id},
                 {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :incomplete_details},
                 {:type, 1, :union,
                  [
                    {:type, 1, :map,
                     [
                       {:type, 1, :map_field_assoc,
                        [
                          {:atom, 0, :reason},
                          {:type, 1, :union,
                           [{:atom, 0, :max_output_tokens}, {:atom, 0, :content_filter}]}
                        ]}
                     ]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :instructions},
                 {:type, 1, :union,
                  [
                    {:type, 1, :union,
                     [
                       {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]},
                       {:type, 1, :list,
                        [
                          {:remote_type, 1,
                           [
                             {:atom, 0, ExOpenAI.Components.InputItem},
                             {:atom, 0, :t},
                             []
                           ]}
                        ]}
                     ]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :max_output_tokens},
                 {:type, 1, :union, [{:type, 1, :integer, []}, {:atom, 0, nil}]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :metadata},
                 {:remote_type, 1, [{:atom, 0, ExOpenAI.Components.Metadata}, {:atom, 0, :t}, []]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :model},
                 {:remote_type, 1,
                  [
                    {:atom, 0, ExOpenAI.Components.ModelIdsResponses},
                    {:atom, 0, :t},
                    []
                  ]}
               ]},
              {:type, 1, :map_field_exact, [{:atom, 0, :object}, {:atom, 0, :response}]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :output},
                 {:type, 1, :list,
                  [
                    {:remote_type, 1,
                     [{:atom, 0, ExOpenAI.Components.OutputItem}, {:atom, 0, :t}, []]}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :output_text},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [{:atom, 0, :parallel_tool_calls}, {:type, 1, :boolean, []}]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :previous_response_id},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :prompt},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1,
                     [{:atom, 0, ExOpenAI.Components.Prompt}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :reasoning},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1,
                     [{:atom, 0, ExOpenAI.Components.Reasoning}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :service_tier},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1,
                     [{:atom, 0, ExOpenAI.Components.ServiceTier}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :status},
                 {:type, 1, :union,
                  [
                    {:type, 1, :union,
                     [
                       {:type, 1, :union, [{:type, 1, :union, []}, {:atom, 0, :cancelled}]},
                       {:atom, 0, :incomplete}
                     ]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :temperature},
                 {:type, 1, :union, [{:type, 1, :number, []}, {:atom, 0, nil}]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :text},
                 {:type, 1, :union,
                  [
                    {:type, 1, :map,
                     [{:type, 1, :map_field_assoc, [{:atom, 0, :format}, {:type, 1, :map, []}]}]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :tool_choice},
                 {:type, 1, :union,
                  [
                    {:type, 1, :union,
                     [
                       {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]},
                       {:remote_type, 1,
                        [{:atom, 0, ExOpenAI.Components.ToolChoice}, {:atom, 0, :t}, []]}
                     ]},
                    {:remote_type, 1,
                     [
                       {:atom, 0, ExOpenAI.Components.ToolChoiceFunction},
                       {:atom, 0, :t},
                       []
                     ]}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :tools},
                 {:type, 1, :list,
                  [
                    {:remote_type, 1, [{:atom, 0, ExOpenAI.Components.Tool}, {:atom, 0, :t}, []]}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :top_p},
                 {:type, 1, :union, [{:type, 1, :number, []}, {:atom, 0, nil}]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :truncation},
                 {:type, 1, :union,
                  [
                    {:type, 1, :union, [{:atom, 0, :disabled}, {:atom, 0, :enabled}]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :usage},
                 {:type, 1, :union,
                  [
                    {:remote_type, 1,
                     [{:atom, 0, ExOpenAI.Components.ResponseUsage}, {:atom, 0, :t}, []]},
                    {:atom, 0, nil}
                  ]}
               ]},
              {:type, 1, :map_field_exact,
               [
                 {:atom, 0, :user},
                 {:type, 1, :union,
                  [{:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]}, {:atom, 0, nil}]}
               ]}
            ]}, []}
      ]

      # Test extracting a simple String field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :id)
      assert result == {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]}

      # Test extracting a number field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :created_at)
      assert result == {:type, 1, :number, []}

      # Test extracting a boolean field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :parallel_tool_calls)
      assert result == {:type, 1, :boolean, []}

      # Test extracting a union field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :background)
      assert result == {:type, 1, :union, [{:type, 1, :boolean, []}, {:atom, 0, nil}]}

      # Test extracting a remote type field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :error)

      assert result ==
               {:remote_type, 1,
                [{:atom, 0, ExOpenAI.Components.ResponseError}, {:atom, 0, :t}, []]}

      # Test extracting a list field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :output)

      assert result ==
               {:type, 1, :list,
                [
                  {:remote_type, 1,
                   [{:atom, 0, ExOpenAI.Components.OutputItem}, {:atom, 0, :t}, []]}
                ]}

      # Test extracting an atom field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :object)
      assert result == {:atom, 0, :response}

      # Test extracting a complex union field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :incomplete_details)

      expected =
        {:type, 1, :union,
         [
           {:type, 1, :map,
            [
              {:type, 1, :map_field_assoc,
               [
                 {:atom, 0, :reason},
                 {:type, 1, :union, [{:atom, 0, :max_output_tokens}, {:atom, 0, :content_filter}]}
               ]}
            ]},
           {:atom, 0, nil}
         ]}

      assert result == expected

      # Test non-existent field
      result = ResponseConverter.get_field_type_from_ast(typespec_ast, :non_existent_field)
      assert result == nil
    end

    test "returns nil for invalid typespec AST" do
      # Test with empty list
      result = ResponseConverter.get_field_type_from_ast([], :id)
      assert result == nil

      # Test with non-list input
      result = ResponseConverter.get_field_type_from_ast("not a list", :id)
      assert result == nil

      # Test with malformed AST
      malformed_ast = [some_other_type: {:not_t, {}, []}]
      result = ResponseConverter.get_field_type_from_ast(malformed_ast, :id)
      assert result == nil
    end

    test "returns nil for non-map type definitions" do
      # Test with typespec that doesn't contain a map
      non_map_ast = [
        type: {:t, {:type, 1, :string, []}, []}
      ]

      result = ResponseConverter.get_field_type_from_ast(non_map_ast, :id)
      assert result == nil
    end
  end

  describe "parse_remote_type/2" do
    test "handles nil values" do
      assert ResponseConverter.parse_remote_type({:type, 1, :string, []}, nil) == nil

      assert ResponseConverter.parse_remote_type(
               {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]},
               nil
             ) == nil
    end

    test "returns basic types as-is" do
      assert ResponseConverter.parse_remote_type({:type, 1, :boolean, []}, true) == true
      assert ResponseConverter.parse_remote_type({:type, 1, :boolean, []}, false) == false
      assert ResponseConverter.parse_remote_type({:type, 1, :number, []}, 42.5) == 42.5
      assert ResponseConverter.parse_remote_type({:type, 1, :integer, []}, 42) == 42
      assert ResponseConverter.parse_remote_type({:type, 1, :binary, []}, "hello") == "hello"
      assert ResponseConverter.parse_remote_type({:type, 1, :string, []}, "world") == "world"
      assert ResponseConverter.parse_remote_type({:type, 1, :map, []}, %{a: 1}) == %{a: 1}
    end

    test "converts string to atom for atom literals" do
      assert ResponseConverter.parse_remote_type({:atom, 0, :completed}, "completed") ==
               :completed

      assert ResponseConverter.parse_remote_type({:atom, 0, :response}, "response") == :response

      # Already an atom, returns as-is
      assert ResponseConverter.parse_remote_type({:atom, 0, :completed}, :completed) == :completed
    end

    test "handles String.t remote type" do
      type_spec = {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]}
      assert ResponseConverter.parse_remote_type(type_spec, "hello") == "hello"
    end

    test "handles union types with nil" do
      # Union with nil - value is nil
      union_type = {:type, 1, :union, [{:type, 1, :string, []}, {:atom, 0, nil}]}
      assert ResponseConverter.parse_remote_type(union_type, nil) == nil

      # Union with nil - value is not nil
      assert ResponseConverter.parse_remote_type(union_type, "hello") == "hello"

      # Union without nil
      union_type_no_nil = {:type, 1, :union, [{:type, 1, :string, []}, {:type, 1, :integer, []}]}
      assert ResponseConverter.parse_remote_type(union_type_no_nil, "test") == "test"
    end

    test "handles list types" do
      # List of strings
      list_type = {:type, 1, :list, [{:type, 1, :string, []}]}
      assert ResponseConverter.parse_remote_type(list_type, ["a", "b", "c"]) == ["a", "b", "c"]

      # List of atoms
      list_atom_type = {:type, 1, :list, [{:atom, 0, :test}]}

      assert ResponseConverter.parse_remote_type(list_atom_type, ["test", "test"]) == [
               :test,
               :test
             ]

      # Empty list
      assert ResponseConverter.parse_remote_type(list_type, []) == []

      # Non-list value returns as-is
      assert ResponseConverter.parse_remote_type(list_type, "not a list") == "not a list"
    end

    test "catch-all returns value as-is for unknown types" do
      unknown_type = {:unknown, 1, :something, []}
      assert ResponseConverter.parse_remote_type(unknown_type, "value") == "value"
    end
  end

  describe "deep_atomize_keys/1" do
    test "atomizes string keys in maps and lists recursively" do
      value = %{
        "foo" => 1,
        "bar" => [
          %{"baz" => 2},
          %{"qux" => [%{"inner" => 3}]}
        ]
      }

      result = ResponseConverter.deep_atomize_keys(value)

      assert result == %{
               foo: 1,
               bar: [
                 %{baz: 2},
                 %{qux: [%{inner: 3}]}
               ]
             }
    end

    test "leaves atom keys untouched" do
      value = %{foo: 1, bar: [%{baz: 2}]}
      assert ResponseConverter.deep_atomize_keys(value) == value
    end
  end

  # Test with mock component if needed
  # Nested component conversions are handled at the top level by convert_response/2;
  # parse_remote_type/2 itself no longer attempts to turn remote component types
  # into structs. This keeps the function focused on primitive/enum coercion.
end
