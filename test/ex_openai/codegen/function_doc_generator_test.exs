defmodule ExOpenAI.Codegen.FunctionDocGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.FunctionDocGenerator
  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema, Parameter}
  
  describe "determine_param_type/3" do
    test "returns string type for path parameter with string schema" do
      operation = %Operation{
        parameters: [
          %Parameter{
            name: "assistant_id",
            in: "path",
            schema: %{"type" => "string"}
          }
        ]
      }
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :assistant_id, nil)
      
      # The AST should represent String.t()
      assert Macro.to_string(type_ast) == "String.t()"
    end
    
    test "returns integer type for path parameter with integer schema" do
      operation = %Operation{
        parameters: [
          %Parameter{
            name: "count",
            in: "path",
            schema: %{"type" => "integer"}
          }
        ]
      }
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :count, nil)
      
      assert Macro.to_string(type_ast) == "integer()"
    end
    
    test "returns body parameter type from schema properties" do
      operation = %Operation{parameters: []}
      
      body_schema = %Schema{
        properties: %{
          "messages" => %Schema{
            type: "array",
            items: %Schema{
              ref: "#/components/schemas/ChatCompletionRequestMessage"
            }
          }
        }
      }
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :messages, body_schema)
      
      # Should generate list type with component reference
      type_string = Macro.to_string(type_ast)
      assert type_string =~ "list("
      assert type_string =~ "ExOpenAI.Components.ChatCompletionRequestMessage.t()"
    end
    
    test "returns any() when parameter not found" do
      operation = %Operation{parameters: []}
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :unknown, nil)
      
      assert Macro.to_string(type_ast) == "any()"
    end
    
    test "returns any() when body schema has no properties" do
      operation = %Operation{parameters: []}
      body_schema = %Schema{properties: nil}
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :something, body_schema)
      
      assert Macro.to_string(type_ast) == "any()"
    end
  end
  
  describe "build_positional_param_spec/3" do
    test "builds correct spec for path parameter" do
      operation = %Operation{
        parameters: [
          %Parameter{
            name: "id",
            in: "path",
            schema: %{"type" => "string"}
          }
        ]
      }
      
      spec_ast = FunctionDocGenerator.build_positional_param_spec(operation, :id, nil)
      spec_string = Macro.to_string(spec_ast)
      
      assert spec_string == "id :: String.t()"
    end
  end
  
  describe "build_param_specs/3" do
    test "builds specs for mixed path and body parameters" do
      operation = %Operation{
        parameters: [
          %Parameter{
            name: "thread_id",
            in: "path",
            schema: %{"type" => "string"}
          },
          %Parameter{
            name: "limit",
            in: "query",
            schema: %{"type" => "integer"}
          }
        ],
        request_body: %{
          content: %{
            "application/json" => %{
              "schema" => %{
                "$ref" => "#/components/schemas/CreateMessageRequest"
              }
            }
          }
        }
      }
      
      schemas = %{
        "CreateMessageRequest" => %Schema{
          properties: %{
            "content" => %Schema{type: "string"},
            "role" => %Schema{type: "string", enum: ["user", "assistant"]}
          },
          required: ["content", "role"]
        }
      }
      
      # Args would be [:thread_id, :content, :role, :opts]
      specs = FunctionDocGenerator.build_param_specs(
        operation,
        [:thread_id, :content, :role, :opts],
        schemas
      )
      
      assert length(specs) == 4
      
      # Check thread_id spec (path param)
      thread_spec = Enum.at(specs, 0)
      assert Macro.to_string(thread_spec) == "thread_id :: String.t()"
      
      # Check content spec (body param)
      content_spec = Enum.at(specs, 1)
      assert Macro.to_string(content_spec) == "content :: String.t()"
      
      # Check role spec (body param with enum)
      role_spec = Enum.at(specs, 2)
      role_string = Macro.to_string(role_spec)
      assert role_string =~ "role ::"
      assert role_string =~ ":user | :assistant"
      
      # Check opts spec includes query param
      opts_spec = Enum.at(specs, 3)
      opts_string = Macro.to_string(opts_spec)
      assert opts_string =~ "opts ::"
      assert opts_string =~ "limit: integer()"
    end
    
    test "handles empty parameters gracefully" do
      operation = %Operation{
        parameters: nil,
        request_body: nil
      }
      
      specs = FunctionDocGenerator.build_param_specs(operation, [:opts], %{})
      
      assert length(specs) == 1
      
      # Should have generic keyword() for opts
      opts_spec = Enum.at(specs, 0)
      assert Macro.to_string(opts_spec) == "opts :: keyword()"
    end
  end
  
  describe "build_return_spec/3" do
    test "returns component type for successful response" do
      operation = %Operation{
        responses: %{
          "200" => %{
            content: %{
              "application/json" => %{
                "schema" => %{
                  "$ref" => "#/components/schemas/CreateChatCompletionResponse"
                }
              }
            }
          }
        }
      }
      
      schemas = %{
        "CreateChatCompletionResponse" => %Schema{
          type: "object",
          properties: %{
            "id" => %Schema{type: "string"},
            "choices" => %Schema{type: "array"}
          }
        }
      }
      
      return_spec = FunctionDocGenerator.build_return_spec(
        operation,
        :create_chat_completion,
        schemas
      )
      
      spec_string = Macro.to_string(return_spec)
      assert spec_string =~ "{:ok, "
      assert spec_string =~ "ExOpenAI.Components.CreateChatCompletionResponse.t()"
      assert spec_string =~ "} | {:error, any()}"
    end
    
    test "returns pid type for streaming endpoints" do
      operation = %Operation{
        responses: %{
          "200" => %{
            content: %{
              "text/event-stream" => %{
                "schema" => %{
                  "$ref" => "#/components/schemas/CreateChatCompletionStreamResponse"
                }
              }
            }
          }
        }
      }
      
      return_spec = FunctionDocGenerator.build_return_spec(
        operation,
        :create_chat_completion_stream,
        %{}
      )
      
      assert Macro.to_string(return_spec) == "{:ok, pid()} | {:error, any()}"
    end
    
    test "returns generic map when no response schema found" do
      operation = %Operation{
        responses: %{
          "204" => %{
            description: "No Content"
          }
        }
      }
      
      return_spec = FunctionDocGenerator.build_return_spec(
        operation,
        :delete_something,
        %{}
      )
      
      assert Macro.to_string(return_spec) == "{:ok, map()} | {:error, any()}"
    end
    
    test "handles nil responses gracefully" do
      operation = %Operation{
        responses: nil
      }
      
      return_spec = FunctionDocGenerator.build_return_spec(
        operation,
        :some_function,
        %{}
      )
      
      assert Macro.to_string(return_spec) == "{:ok, map()} | {:error, any()}"
    end
    
    test "resolves response schemas with allOf" do
      operation = %Operation{
        responses: %{
          "200" => %{
            content: %{
              "application/json" => %{
                "schema" => %{
                  "$ref" => "#/components/schemas/ExtendedResponse"
                }
              }
            }
          }
        }
      }
      
      schemas = %{
        "BaseResponse" => %Schema{
          properties: %{
            "id" => %Schema{type: "string"},
            "created" => %Schema{type: "integer"}
          }
        },
        "ExtendedResponse" => %Schema{
          all_of: [
            %Schema{ref: "#/components/schemas/BaseResponse"},
            %Schema{
              properties: %{
                "data" => %Schema{type: "string"}
              }
            }
          ]
        }
      }
      
      return_spec = FunctionDocGenerator.build_return_spec(
        operation,
        :get_extended,
        schemas
      )
      
      spec_string = Macro.to_string(return_spec)
      assert spec_string =~ "ExOpenAI.Components.ExtendedResponse.t()"
    end
  end
end