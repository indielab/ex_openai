defmodule ExOpenAI.Codegen.FunctionDocGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.FunctionDocGenerator
  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema, Parameter}
  
  describe "determine_param_type/4" do
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
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :assistant_id, nil, %{})
      
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
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :count, nil, %{})
      
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
      
      schemas = %{
        "ChatCompletionRequestMessage" => %Schema{type: "object"}
      }

      type_ast =
        FunctionDocGenerator.determine_param_type(operation, :messages, body_schema, schemas)
      
      # Should generate list type with component reference
      type_string = Macro.to_string(type_ast)
      assert type_string =~ "list("
      assert type_string =~ "ExOpenAI.Components.ChatCompletionRequestMessage.t()"
    end
    
    test "returns any() when parameter not found" do
      operation = %Operation{parameters: []}
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :unknown, nil, %{})
      
      assert Macro.to_string(type_ast) == "any()"
    end
    
    test "returns any() when body schema has no properties" do
      operation = %Operation{parameters: []}
      body_schema = %Schema{properties: nil}
      
      type_ast = FunctionDocGenerator.determine_param_type(operation, :something, body_schema, %{})
      
      assert Macro.to_string(type_ast) == "any()"
    end
  end
  
  describe "build_positional_param_spec/4" do
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
      
      spec_ast = FunctionDocGenerator.build_positional_param_spec(operation, :id, nil, %{})
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
    
    test "returns async reference type for streaming endpoints" do
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
      
      assert Macro.to_string(return_spec) == "{:ok, reference()} | {:error, any()}"
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
  
  describe "generate_doc/2 with comprehensive parameter docs" do
    test "generates documentation with all parameter details" do
      operation = %Operation{
        operation_id: "createChatCompletion",
        summary: "Creates a model response for the given chat conversation.",
        description: "This endpoint creates a chat completion based on the provided messages and parameters.",
        parameters: [
          %Parameter{
            name: "thread_id",
            in: "path",
            description: "The ID of the thread to run.",
            required: true,
            schema: %{"type" => "string", "format" => "uuid"}
          },
          %Parameter{
            name: "limit",
            in: "query",
            description: "A limit on the number of objects to be returned.",
            required: false,
            schema: %{"type" => "integer", "default" => 20, "minimum" => 1, "maximum" => 100}
          },
          %Parameter{
            name: "X-Custom-Header",
            in: "header",
            description: "Custom header for tracking.",
            schema: %{"type" => "string"}
          }
        ],
        request_body: %{
          required: true,
          content: %{
            "application/json" => %{
              "schema" => %{"$ref" => "#/components/schemas/CreateChatCompletionRequest"}
            }
          }
        }
      }
      
      schemas = %{
        "CreateChatCompletionRequest" => %Schema{
          type: "object",
          properties: %{
            "model" => %Schema{
              type: "string",
              description: "ID of the model to use.",
              example: "gpt-4",
              enum: ["gpt-4", "gpt-3.5-turbo"]
            },
            "messages" => %Schema{
              type: "array",
              description: "A list of messages comprising the conversation so far.",
              items: %Schema{ref: "#/components/schemas/ChatCompletionRequestMessage"},
              raw: %{"minItems" => 1}
            },
            "temperature" => %Schema{
              type: "number",
              description: "What sampling temperature to use, between 0 and 2.",
              raw: %{"minimum" => 0, "maximum" => 2, "default" => 1}
            },
            "max_tokens" => %Schema{
              type: "integer",
              description: "The maximum number of tokens to generate.",
              nullable: true,
              raw: %{"minimum" => 1}
            },
            "stream" => %Schema{
              type: "boolean",
              description: "If set, partial message deltas will be sent.",
              raw: %{"default" => false}
            }
          },
          required: ["model", "messages"]
        }
      }
      
      ast = FunctionDocGenerator.generate_doc(operation, schemas)
      {:@, _, [{:doc, _, [doc_content]}]} = ast
      
      # Check summary and description
      assert doc_content =~ "Creates a model response for the given chat conversation."
      assert doc_content =~ "This endpoint creates a chat completion based on the provided messages"
      
      # Check Parameters section exists and has correct content
      assert doc_content =~ "## Parameters"
      
      # Path parameter with format
      assert doc_content =~ "* `:thread_id` - **required** - `String.t()`"
      assert doc_content =~ "The ID of the thread to run."
      assert doc_content =~ "Format: `uuid`"
      
      # Required body parameters
      assert doc_content =~ "* `model` - **required**"
      assert doc_content =~ "ID of the model to use."
      assert doc_content =~ "Allowed values: `\"gpt-4\"`, `\"gpt-3.5-turbo\"`"
      assert doc_content =~ "Example: `\"gpt-4\"`"
      
      assert doc_content =~ "* `messages` - **required**"
      assert doc_content =~ "A list of messages comprising the conversation so far."
      assert doc_content =~ "Constraints: minItems: 1"
      
      # Check Options section
      assert doc_content =~ "## Options"
      
      # Query parameter with constraints
      assert doc_content =~ "* `:limit` - **optional** - `integer()`"
      assert doc_content =~ "A limit on the number of objects to be returned."
      assert doc_content =~ "Default: `20`"
      assert doc_content =~ "Constraints: minimum: 1, maximum: 100"
      
      # Optional body parameters
      assert doc_content =~ "* `temperature` - **optional**"
      assert doc_content =~ "What sampling temperature to use, between 0 and 2."
      assert doc_content =~ "Default: `1`"
      assert doc_content =~ "Constraints: minimum: 0, maximum: 2"
      
      assert doc_content =~ "* `max_tokens` - **optional**"
      assert doc_content =~ "The maximum number of tokens to generate."
      assert doc_content =~ "Constraints: minimum: 1"
      
      assert doc_content =~ "* `stream` - **optional**"
      assert doc_content =~ "If set, partial message deltas will be sent."
      assert doc_content =~ "Default: `false`"
      
      # Header parameter
      assert doc_content =~ "* `:X-Custom-Header` - **optional** - `String.t()`"
      assert doc_content =~ "Custom header for tracking."
    end
    
    test "handles operations with only path parameters" do
      operation = %Operation{
        operation_id: "getAssistant",
        summary: "Retrieves an assistant.",
        parameters: [
          %Parameter{
            name: "assistant_id",
            in: "path",
            description: "The ID of the assistant to retrieve.",
            required: true,
            schema: %{"type" => "string"}
          }
        ]
      }
      
      ast = FunctionDocGenerator.generate_doc(operation, %{})
      {:@, _, [{:doc, _, [doc_content]}]} = ast
      
      assert doc_content =~ "## Parameters"
      assert doc_content =~ "* `:assistant_id` - **required** - `String.t()`"
      assert doc_content =~ "The ID of the assistant to retrieve."
      refute doc_content =~ "## Options"
    end
    
    test "handles multipart/form-data request bodies" do
      operation = %Operation{
        operation_id: "createTranscription",
        summary: "Transcribes audio into the input language.",
        request_body: %{
          required: true,
          content: %{
            "multipart/form-data" => %{
              "schema" => %{"$ref" => "#/components/schemas/CreateTranscriptionRequest"}
            }
          }
        }
      }
      
      schemas = %{
        "CreateTranscriptionRequest" => %Schema{
          type: "object",
          properties: %{
            "file" => %Schema{
              type: "string",
              description: "The audio file to transcribe.",
              format: "binary"
            },
            "model" => %Schema{
              type: "string",
              description: "ID of the model to use."
            },
            "language" => %Schema{
              type: "string",
              description: "The language of the input audio.",
              raw: %{"default" => "en"}
            }
          },
          required: ["file", "model"]
        }
      }
      
      ast = FunctionDocGenerator.generate_doc(operation, schemas)
      {:@, _, [{:doc, _, [doc_content]}]} = ast
      
      assert doc_content =~ "## Parameters"
      assert doc_content =~ "* `file` - **required**"
      assert doc_content =~ "The audio file to transcribe."
      assert doc_content =~ "Format: `binary`"
      
      assert doc_content =~ "## Options"
      assert doc_content =~ "* `language` - **optional**"
      assert doc_content =~ "The language of the input audio."
      assert doc_content =~ "Default: `\"en\"`"
    end
  end
end
