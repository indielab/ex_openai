defmodule ExOpenAI.Codegen.PathModuleGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.PathModuleGenerator
  alias ExOpenAI.Codegen.DocsParser.{Path, Operation, Schema, RequestBody}
  
  describe "generate_modules/2" do
    test "generates module for simple path with single operation" do
      paths = [
        %Path{
          path: "/chat/completions",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createChatCompletion",
              tags: ["Chat"]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Chat do"
      assert module_string =~ "def create_chat_completion(opts \\\\ []) do"
    end
    
    test "generates module with multiple operations" do
      paths = [
        %Path{
          path: "/assistants",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "listAssistants",
              tags: ["Assistants"]
            },
            "post" => %Operation{
              method: "post",
              operation_id: "createAssistant",
              tags: ["Assistants"]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Assistants do"
      assert module_string =~ "def list_assistants(opts \\\\ []) do"
      assert module_string =~ "def create_assistant(opts \\\\ []) do"
    end
    
    test "groups multiple paths with same prefix into one module" do
      paths = [
        %Path{
          path: "/images/generations",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createImage",
              tags: ["Images"]
            }
          }
        },
        %Path{
          path: "/images/edits",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createImageEdit",
              tags: ["Images"]
            }
          }
        },
        %Path{
          path: "/images/variations",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createImageVariation",
              tags: ["Images"]
            }
          }
        }
      ]
      
      # Should generate only one module with all functions
      modules = PathModuleGenerator.generate_modules(paths)
      assert length(modules) == 1
      
      [ast] = modules
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Images do"
      assert module_string =~ "def create_image(opts \\\\ []) do"
      assert module_string =~ "def create_image_edit(opts \\\\ []) do"
      assert module_string =~ "def create_image_variation(opts \\\\ []) do"
    end
    
    test "handles paths grouped by prefix regardless of tags" do
      paths = [
        %Path{
          path: "/containers",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "ListContainers",
              tags: nil
            },
            "post" => %Operation{
              method: "post",
              operation_id: "CreateContainer",
              tags: nil
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      # Should derive module name from path prefix
      assert module_string =~ "defmodule ExOpenAI.Containers do"
      assert module_string =~ "def list_containers(opts \\\\ []) do"
      assert module_string =~ "def create_container(opts \\\\ []) do"
    end
    
    test "handles operation with no operation_id" do
      paths = [
        %Path{
          path: "/test",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: nil,
              tags: ["Test"]
            },
            "post" => %Operation{
              method: "post",
              operation_id: "createTest",
              tags: ["Test"]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      # Should only generate function for operation with operation_id
      assert module_string =~ "defmodule ExOpenAI.Test do"
      assert module_string =~ "def create_test(opts \\\\ []) do"
      refute module_string =~ "def nil"
    end
    
    test "converts various operationId formats to snake_case" do
      paths = [
        %Path{
          path: "/test",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "getAPIKey",
              tags: ["Test"]
            },
            "post" => %Operation{
              method: "post",
              operation_id: "createHTMLReport",
              tags: ["Test"]
            },
            "put" => %Operation{
              method: "put",
              operation_id: "updateXMLConfig",
              tags: ["Test"]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "def get_api_key(opts \\\\ []) do"
      assert module_string =~ "def create_html_report(opts \\\\ []) do"
      assert module_string =~ "def update_xml_config(opts \\\\ []) do"
    end
    
    test "paths with same prefix go into same module regardless of tags" do
      paths = [
        %Path{
          path: "/multi/items",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "listItems",
              tags: ["Items"]
            }
          }
        },
        %Path{
          path: "/multi/products",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createProduct",
              tags: ["Products"]
            }
          }
        }
      ]
      
      modules = PathModuleGenerator.generate_modules(paths)
      
      # Should generate only one module based on prefix
      assert length(modules) == 1
      
      [ast] = modules
      module_string = Macro.to_string(ast)
      
      # Both operations should be in the Multi module
      assert module_string =~ "defmodule ExOpenAI.Multi do"
      assert module_string =~ "def list_items(opts \\\\ []) do"
      assert module_string =~ "def create_product(opts \\\\ []) do"
    end
    
    test "real example with chat completions" do
      path = chat_completions_path_fixture()

      # Without schemas, should generate with opts only
      [ast] = PathModuleGenerator.generate_modules([path])
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Chat do"
      assert module_string =~ "def list_chat_completions(opts \\\\ []) do"
      assert module_string =~ "def create_chat_completion(opts \\\\ []) do"
    end
    
    test "real example with chat completions and schemas" do
      path = chat_completions_path_fixture()

      # Create a simplified CreateChatCompletionRequest schema
      schemas = %{
        "CreateChatCompletionRequest" => %Schema{
          all_of: [
            %Schema{
              type: "object", 
              properties: %{
                "messages" => %Schema{type: "array"},
                "model" => %Schema{type: "string"}
              },
              required: ["model", "messages"]
            }
          ]
        }
      }
      
      [ast] = PathModuleGenerator.generate_modules([path], schemas)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Chat do"
      assert module_string =~ "def list_chat_completions(opts \\\\ []) do"
      # Should have messages and model as required args (alphabetical order)
      assert module_string =~ "def create_chat_completion(messages, model, opts \\\\ []) do"
    end
    
    test "real example with assistants" do
      path = assistants_path_fixture()

      [ast] = PathModuleGenerator.generate_modules([path])
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Assistants do"
      assert module_string =~ "def list_assistants(opts \\\\ []) do"
      assert module_string =~ "def create_assistant(opts \\\\ []) do"
    end
  end
  
  describe "generate_module/3" do
    test "generates module with custom tag" do
      paths = [
        %Path{
          path: "/test",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "getTest",
              tags: ["Custom"]
            }
          }
        }
      ]
      
      ast = PathModuleGenerator.generate_module("Custom", paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Custom do"
      assert module_string =~ "def get_test(opts \\\\ []) do"
    end
  end
  
  describe "argument parsing" do
    test "generates function with required arguments from request body" do
      paths = [
        %Path{
          path: "/chat/completions",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createChatCompletion",
              tags: ["Chat"],
              request_body: %RequestBody{
                required: true,
                content: %{
                  "application/json" => %{
                    "schema" => %{
                      "$ref" => "#/components/schemas/CreateChatCompletionRequest"
                    }
                  }
                }
              }
            }
          }
        }
      ]
      
      schemas = %{
        "CreateChatCompletionRequest" => %Schema{
          type: "object",
          properties: %{
            "messages" => %Schema{type: "array"},
            "model" => %Schema{type: "string"},
            "temperature" => %Schema{type: "number"}
          },
          required: ["messages", "model"]
        }
      }
      
      [ast] = PathModuleGenerator.generate_modules(paths, schemas)
      module_string = Macro.to_string(ast)
      
      # Arguments are sorted alphabetically
      assert module_string =~ "def create_chat_completion(messages, model, opts \\\\ []) do"
    end
    
    test "generates function with opts only when no required fields" do
      paths = [
        %Path{
          path: "/chat/completions",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "listChatCompletions",
              tags: ["Chat"],
              parameters: [
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "limit",
                  in: "query",
                  required: false
                },
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "after",
                  in: "query",
                  required: false
                }
              ]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "def list_chat_completions(opts \\\\ []) do"
    end
    
    test "handles allOf schema resolution" do
      paths = [
        %Path{
          path: "/test",
          operations: %{
            "post" => %Operation{
              method: "post",
              operation_id: "createTest",
              tags: ["Test"],
              request_body: %RequestBody{
                required: true,
                content: %{
                  "application/json" => %{
                    "schema" => %{
                      "$ref" => "#/components/schemas/CreateTestRequest"
                    }
                  }
                }
              }
            }
          }
        }
      ]
      
      schemas = %{
        "CreateTestRequest" => %Schema{
          all_of: [
            %Schema{ref: "#/components/schemas/BaseRequest"},
            %Schema{
              type: "object",
              properties: %{
                "specific_field" => %Schema{type: "string"}
              },
              required: ["specific_field"]
            }
          ]
        },
        "BaseRequest" => %Schema{
          type: "object",
          properties: %{
            "base_field" => %Schema{type: "string"},
            "optional_field" => %Schema{type: "integer"}
          },
          required: ["base_field"]
        }
      }
      
      [ast] = PathModuleGenerator.generate_modules(paths, schemas)
      module_string = Macro.to_string(ast)
      
      # Should include both required fields from allOf schemas
      assert module_string =~ "def create_test(base_field, specific_field, opts \\\\ []) do"
    end
    
    test "handles path parameters" do
      paths = [
        %Path{
          path: "/chat/completions/{completion_id}",
          operations: %{
            "delete" => %Operation{
              method: "delete",
              operation_id: "deleteChatCompletion",
              tags: ["Chat"],
              parameters: [
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "completion_id",
                  in: "path",
                  description: "The ID of the chat completion to delete.",
                  schema: %{"type" => "string"},
                  required: true
                }
              ]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "def delete_chat_completion(completion_id, opts \\\\ []) do"
    end
    
    test "handles path parameters with request body" do
      paths = [
        %Path{
          path: "/items/{item_id}",
          operations: %{
            "put" => %Operation{
              method: "put",
              operation_id: "updateItem",
              tags: ["Items"],
              parameters: [
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "item_id",
                  in: "path",
                  required: true
                }
              ],
              request_body: %RequestBody{
                required: true,
                content: %{
                  "application/json" => %{
                    "schema" => %{
                      "$ref" => "#/components/schemas/UpdateItemRequest"
                    }
                  }
                }
              }
            }
          }
        }
      ]
      
      schemas = %{
        "UpdateItemRequest" => %Schema{
          type: "object",
          properties: %{
            "name" => %Schema{type: "string"},
            "price" => %Schema{type: "number"},
            "description" => %Schema{type: "string"}
          },
          required: ["name", "price"]
        }
      }
      
      [ast] = PathModuleGenerator.generate_modules(paths, schemas)
      module_string = Macro.to_string(ast)
      
      # Should have path param and required body fields sorted alphabetically
      assert module_string =~ "def update_item(item_id, name, price, opts \\\\ []) do"
    end
    
    test "handles operation IDs with hyphens like admin-api-keys-delete" do
      paths = [
        %Path{
          path: "/organization/admin_api_keys/{key_id}",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "admin-api-keys-get",
              tags: ["administration"],
              parameters: [
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "key_id",
                  in: "path",
                  required: true
                }
              ]
            },
            "delete" => %Operation{
              method: "delete",
              operation_id: "admin-api-keys-delete",
              tags: ["administration"],
              parameters: [
                %ExOpenAI.Codegen.DocsParser.Parameter{
                  name: "key_id",
                  in: "path",
                  required: true
                }
              ]
            }
          }
        }
      ]
      
      [ast] = PathModuleGenerator.generate_modules(paths)
      module_string = Macro.to_string(ast)
      
      # Module name should be based on path prefix
      assert module_string =~ "defmodule ExOpenAI.Organization do"
      
      # Function names should have hyphens converted to underscores
      assert module_string =~ "def admin_api_keys_get(key_id, opts \\\\ []) do"
      assert module_string =~ "def admin_api_keys_delete(key_id, opts \\\\ []) do"
      
      # Should not have hyphens in function names
      refute module_string =~ "admin-api-keys"
    end
  end

  # Fixtures -----------------------------------------------------------------

  # Minimal but realistic chat/completions path used by the "real example"
  # tests above. We inline it here rather than loading it from external files
  # so the tests remain self‑contained and match the v2 parser structs.
  defp chat_completions_path_fixture do
    %Path{
      path: "/chat/completions",
      operations: %{
        "get" => %Operation{
          method: "get",
          operation_id: "listChatCompletions",
          tags: ["Chat"],
          parameters: [
            %ExOpenAI.Codegen.DocsParser.Parameter{
              name: "limit",
              in: "query",
              required: false
            },
            %ExOpenAI.Codegen.DocsParser.Parameter{
              name: "after",
              in: "query",
              required: false
            }
          ]
        },
        "post" => %Operation{
          method: "post",
          operation_id: "createChatCompletion",
          tags: ["Chat"],
          # In real docs this has a request body referencing
          # CreateChatCompletionRequest; we keep that shape so the
          # schema‑aware test can assert required args.
          request_body: %RequestBody{
            required: true,
            content: %{
              "application/json" => %{
                "schema" => %{
                  "$ref" => "#/components/schemas/CreateChatCompletionRequest"
                }
              }
            }
          }
        }
      }
    }
  end

  defp assistants_path_fixture do
    %Path{
      path: "/assistants",
      operations: %{
        "get" => %Operation{
          method: "get",
          operation_id: "listAssistants",
          tags: ["Assistants"]
        },
        "post" => %Operation{
          method: "post",
          operation_id: "createAssistant",
          tags: ["Assistants"]
        }
      }
    }
  end
end
