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
    
    test "groups multiple paths with same tag into one module" do
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
    
    test "handles paths with nil tags" do
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
      
      # Should derive module name from operation_id
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
    
    test "handles paths with operations having different tags" do
      paths = [
        %Path{
          path: "/multi",
          operations: %{
            "get" => %Operation{
              method: "get",
              operation_id: "listItems",
              tags: ["Items"]
            },
            "post" => %Operation{
              method: "post",
              operation_id: "createProduct",
              tags: ["Products"]
            }
          }
        }
      ]
      
      modules = PathModuleGenerator.generate_modules(paths)
      
      # Should generate two modules
      assert length(modules) == 2
      
      module_strings = Enum.map(modules, &Macro.to_string/1)
      
      # Check Items module
      items_module = Enum.find(module_strings, &(&1 =~ "ExOpenAI.Items"))
      assert items_module =~ "def list_items(opts \\\\ []) do"
      
      # Check Products module
      products_module = Enum.find(module_strings, &(&1 =~ "ExOpenAI.Products"))
      assert products_module =~ "def create_product(opts \\\\ []) do"
    end
    
    test "real example with chat completions" do
      # Load actual path from testdata
      {path, _} = Code.eval_file("openai/paths/chat_completions.exs")
      
      # Without schemas, should generate with opts only
      [ast] = PathModuleGenerator.generate_modules([path])
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Chat do"
      assert module_string =~ "def list_chat_completions(opts \\\\ []) do"
      assert module_string =~ "def create_chat_completion(opts \\\\ []) do"
    end
    
    test "real example with chat completions and schemas" do
      # Load actual path from testdata
      {path, _} = Code.eval_file("openai/paths/chat_completions.exs")
      
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
      # Load actual path from testdata
      {path, _} = Code.eval_file("openai/paths/assistants.exs")
      
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
                %{required: false, name: "limit"},
                %{required: false, name: "after"}
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
  end
end