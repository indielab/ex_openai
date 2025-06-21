defmodule ExOpenAI.Codegen.DocsParserTest do
  use ExUnit.Case
  alias ExOpenAI.Codegen.DocsParser

  @minimal_yaml """
  openapi: 3.0.0
  components:
    schemas:
      TestModel:
        type: object
        properties:
          id:
            type: string
          name:
            type: string
  paths:
    /test:
      get:
        operationId: getTest
        responses:
          '200':
            description: OK
  """

  @complex_yaml """
  openapi: 3.0.0
  info:
    title: Test API
    version: 1.0.0
  components:
    schemas:
      Model1:
        type: object
        properties:
          field1:
            type: string
          field2:
            type: integer
      Model2:
        type: object
        required:
          - requiredField
        properties:
          requiredField:
            type: string
          optionalField:
            type: boolean
  paths:
    /resource1:
      get:
        operationId: getResource1
        parameters:
          - name: id
            in: path
            required: true
            schema:
              type: string
        responses:
          '200':
            description: Success
      post:
        operationId: createResource1
        requestBody:
          required: true
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Model1'
        responses:
          '201':
            description: Created
    /resource2/{id}:
      get:
        operationId: getResource2
        parameters:
          - name: id
            in: path
            required: true
            schema:
              type: string
        responses:
          '200':
            description: Success
  """

  describe "get_documentation/1" do
    test "parses minimal YAML and extracts components and paths" do
      result = DocsParser.get_documentation(@minimal_yaml)
      
      assert %{components: components, paths: paths} = result
      
      # Check components
      assert Map.has_key?(components, "TestModel")
      assert components["TestModel"]["type"] == "object"
      assert components["TestModel"]["properties"]["id"]["type"] == "string"
      assert components["TestModel"]["properties"]["name"]["type"] == "string"
      
      # Check paths
      assert Map.has_key?(paths, "/test")
      assert paths["/test"]["get"]["operationId"] == "getTest"
      assert paths["/test"]["get"]["responses"]["200"]["description"] == "OK"
    end

    test "parses complex YAML with multiple schemas and paths" do
      result = DocsParser.get_documentation(@complex_yaml)
      
      assert %{components: components, paths: paths} = result
      
      # Check multiple schemas
      assert Map.has_key?(components, "Model1")
      assert Map.has_key?(components, "Model2")
      
      assert components["Model1"]["properties"]["field1"]["type"] == "string"
      assert components["Model1"]["properties"]["field2"]["type"] == "integer"
      
      assert components["Model2"]["required"] == ["requiredField"]
      assert components["Model2"]["properties"]["requiredField"]["type"] == "string"
      assert components["Model2"]["properties"]["optionalField"]["type"] == "boolean"
      
      # Check multiple paths and methods
      assert Map.has_key?(paths, "/resource1")
      assert Map.has_key?(paths, "/resource2/{id}")
      
      assert paths["/resource1"]["get"]["operationId"] == "getResource1"
      assert paths["/resource1"]["post"]["operationId"] == "createResource1"
      assert paths["/resource2/{id}"]["get"]["operationId"] == "getResource2"
      
      # Check parameters
      assert paths["/resource1"]["get"]["parameters"] |> Enum.at(0) |> Map.get("name") == "id"
      assert paths["/resource1"]["get"]["parameters"] |> Enum.at(0) |> Map.get("required") == true
      
      # Check request body reference
      assert paths["/resource1"]["post"]["requestBody"]["content"]["application/json"]["schema"]["$ref"] == 
        "#/components/schemas/Model1"
    end

    test "handles YAML without components section" do
      yaml = """
      openapi: 3.0.0
      paths:
        /test:
          get:
            operationId: getTest
      """
      
      result = DocsParser.get_documentation(yaml)
      
      assert result.components == nil
      assert result.paths["/test"]["get"]["operationId"] == "getTest"
    end

    test "handles YAML without paths section" do
      yaml = """
      openapi: 3.0.0
      components:
        schemas:
          TestModel:
            type: object
      """
      
      result = DocsParser.get_documentation(yaml)
      
      assert result.components["TestModel"]["type"] == "object"
      assert result.paths == nil
    end

    test "handles empty YAML sections" do
      yaml = """
      openapi: 3.0.0
      components:
        schemas: {}
      paths: {}
      """
      
      result = DocsParser.get_documentation(yaml)
      
      assert result.components == %{}
      assert result.paths == %{}
    end

    test "parses actual OpenAI docs.yaml structure" do
      # Test with a snippet that mimics the actual OpenAI structure
      yaml = """
      openapi: 3.0.0
      info:
        title: OpenAI API
        version: 2.3.0
      components:
        schemas:
          AddUploadPartRequest:
            type: object
            additionalProperties: false
            properties:
              data:
                type: string
                format: binary
      paths:
        /assistants:
          get:
            operationId: listAssistants
            tags:
              - Assistants
            summary: Returns a list of assistants.
            parameters:
              - name: limit
                in: query
                required: false
                schema:
                  type: integer
                  default: 20
      """
      
      result = DocsParser.get_documentation(yaml)
      
      # Verify the structure matches what we expect from the actual file
      assert result.components["AddUploadPartRequest"]["type"] == "object"
      assert result.components["AddUploadPartRequest"]["additionalProperties"] == false
      assert result.paths["/assistants"]["get"]["operationId"] == "listAssistants"
      assert result.paths["/assistants"]["get"]["tags"] == ["Assistants"]
    end
  end

  describe "error handling" do
    test "raises on invalid YAML" do
      invalid_yaml = """
      this is not valid yaml:
        - missing proper structure
        : invalid
      """
      
      assert_raise YamlElixir.ParsingError, fn ->
        DocsParser.get_documentation(invalid_yaml)
      end
    end
  end

  describe "integration with actual docs.yaml" do
    test "successfully parses the actual OpenAI docs.yaml file" do
      yaml_content = File.read!("lib/ex_openai/docs/docs.yaml")
      
      result = DocsParser.get_documentation(yaml_content)
      
      # Verify we got the expected structure
      assert %{components: components, paths: paths} = result
      
      # Check that we have many schemas
      assert map_size(components) > 100
      
      # Check that we have many paths
      assert map_size(paths) > 50
      
      # Spot check some known schemas
      assert Map.has_key?(components, "CreateChatCompletionRequest")
      assert Map.has_key?(components, "CreateChatCompletionResponse")
      
      # Spot check some known paths
      assert Map.has_key?(paths, "/chat/completions")
      assert Map.has_key?(paths, "/models")
      assert Map.has_key?(paths, "/assistants")
      
      # Verify the structure of a specific schema
      # CreateChatCompletionRequest uses allOf, so check for that
      assert Map.has_key?(components["CreateChatCompletionRequest"], "allOf")
      assert is_list(components["CreateChatCompletionRequest"]["allOf"])
      
      # Verify the structure of a specific path
      if chat_completions = paths["/chat/completions"] do
        assert Map.has_key?(chat_completions, "post")
        assert chat_completions["post"]["operationId"] == "createChatCompletion"
      end
    end
  end
end