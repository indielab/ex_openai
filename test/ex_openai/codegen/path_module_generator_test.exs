defmodule ExOpenAI.Codegen.PathModuleGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.PathModuleGenerator
  alias ExOpenAI.Codegen.DocsParser.{Path, Operation}
  
  describe "generate_modules/1" do
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
      assert module_string =~ "def create_chat_completion() do"
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
      assert module_string =~ "def list_assistants() do"
      assert module_string =~ "def create_assistant() do"
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
      assert module_string =~ "def create_image() do"
      assert module_string =~ "def create_image_edit() do"
      assert module_string =~ "def create_image_variation() do"
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
      assert module_string =~ "def list_containers() do"
      assert module_string =~ "def create_container() do"
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
      assert module_string =~ "def create_test() do"
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
      
      assert module_string =~ "def get_api_key() do"
      assert module_string =~ "def create_html_report() do"
      assert module_string =~ "def update_xml_config() do"
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
      assert items_module =~ "def list_items() do"
      
      # Check Products module
      products_module = Enum.find(module_strings, &(&1 =~ "ExOpenAI.Products"))
      assert products_module =~ "def create_product() do"
    end
    
    test "real example with chat completions" do
      # Load actual path from testdata
      {path, _} = Code.eval_file("openai/paths/chat_completions.exs")
      
      [ast] = PathModuleGenerator.generate_modules([path])
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Chat do"
      assert module_string =~ "def list_chat_completions() do"
      assert module_string =~ "def create_chat_completion() do"
    end
    
    test "real example with assistants" do
      # Load actual path from testdata
      {path, _} = Code.eval_file("openai/paths/assistants.exs")
      
      [ast] = PathModuleGenerator.generate_modules([path])
      module_string = Macro.to_string(ast)
      
      assert module_string =~ "defmodule ExOpenAI.Assistants do"
      assert module_string =~ "def list_assistants() do"
      assert module_string =~ "def create_assistant() do"
    end
  end
  
  describe "generate_module/2" do
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
      assert module_string =~ "def get_test() do"
    end
  end
end