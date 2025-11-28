defmodule ExOpenAI.Codegen.FunctionBodyGeneratorTest do
  use ExUnit.Case
  
  alias ExOpenAI.Codegen.FunctionBodyGenerator
  alias ExOpenAI.Codegen.DocsParser.{Operation, Parameter, RequestBody}
  
  describe "generate_body/3" do
    test "generates body for simple GET request with no parameters" do
      operation = %Operation{
        method: "get",
        operation_id: "listItems",
        parameters: nil
      }
      
      ast = FunctionBodyGenerator.generate_body(operation, "/items", [quote(do: opts)])
      body_string = Macro.to_string(ast)
      
      # Should capture args and make GET request
      assert body_string =~ "binding()"
      assert body_string =~ "ExOpenAI.Config.http_client().api_call("
      assert body_string =~ ":get"
      assert body_string =~ "final_url"
      assert body_string =~ "&Function.identity/1"
    end
    
    test "generates body for DELETE with path parameter" do
      operation = %Operation{
        method: "delete",
        operation_id: "deleteItem",
        parameters: [
          %Parameter{
            name: "item_id",
            in: "path",
            required: true
          }
        ]
      }
      
      ast = FunctionBodyGenerator.generate_body(
        operation, 
        "/items/{item_id}", 
        [quote(do: item_id), quote(do: opts)]
      )
      body_string = Macro.to_string(ast)
      
      # Should replace path parameter
      assert body_string =~ ~s|String.replace(url, "{item_id}"|
      assert body_string =~ "to_string(Keyword.get(all_args, :item_id))"
      assert body_string =~ "ExOpenAI.Config.http_client().api_call("
      assert body_string =~ ":delete"
    end
    
    test "generates body for GET with query parameters" do
      operation = %Operation{
        method: "get",
        operation_id: "listItems",
        parameters: [
          %Parameter{
            name: "limit",
            in: "query",
            required: false
          },
          %Parameter{
            name: "page",
            in: "query",
            required: false
          }
        ]
      }
      
      ast = FunctionBodyGenerator.generate_body(operation, "/items", [quote(do: opts)])
      body_string = Macro.to_string(ast)
      
      # Should build query parameters
      assert body_string =~ "query_params"
      assert body_string =~ "URI.encode_www_form"
      assert body_string =~ ~s|url <> "?" <> query_string|
    end
    
    test "generates body for POST with request body" do
      operation = %Operation{
        method: "post",
        operation_id: "createItem",
        request_body: %RequestBody{
          required: true,
          content: %{
            "application/json" => %{
              "schema" => %{"$ref" => "#/components/schemas/CreateItemRequest"}
            }
          }
        }
      }
      
      # Simulate having name and price as required args
      ast = FunctionBodyGenerator.generate_body(
        operation,
        "/items",
        [quote(do: name), quote(do: price), quote(do: opts)]
      )
      body_string = Macro.to_string(ast)
      
      # Should extract body parameters
      assert body_string =~ "body_params"
      assert body_string =~ "ExOpenAI.Config.http_client().api_call("
      assert body_string =~ ":post"
      assert body_string =~ ~s|:"application/json"|
    end
    
    test "generates body for POST with multipart content type" do
      operation = %Operation{
        method: "post",
        operation_id: "uploadFile",
        request_body: %RequestBody{
          required: true,
          content: %{
            "multipart/form-data" => %{
              "schema" => %{"$ref" => "#/components/schemas/UploadFileRequest"}
            }
          }
        }
      }
      
      ast = FunctionBodyGenerator.generate_body(operation, "/files", [quote(do: file), quote(do: opts)])
      body_string = Macro.to_string(ast)
      
      # Should use multipart content type
      assert body_string =~ ~s|:"multipart/form-data"|
    end
    
    test "generates body with path params and query params combined" do
      operation = %Operation{
        method: "get",
        operation_id: "getItemDetails",
        parameters: [
          %Parameter{
            name: "item_id",
            in: "path",
            required: true
          },
          %Parameter{
            name: "include_metadata",
            in: "query",
            required: false
          }
        ]
      }
      
      ast = FunctionBodyGenerator.generate_body(
        operation,
        "/items/{item_id}/details",
        [quote(do: item_id), quote(do: opts)]
      )
      body_string = Macro.to_string(ast)
      
      # Should handle both path and query params
      assert body_string =~ ~s|String.replace(url, "{item_id}"|
      assert body_string =~ "query_params"
      assert body_string =~ ":include_metadata"
    end
  end
end
