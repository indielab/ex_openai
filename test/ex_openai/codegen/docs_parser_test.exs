defmodule ExOpenAI.Codegen.DocsParserTest do
  use ExUnit.Case
  alias ExOpenAI.Codegen.DocsParser
  alias ExOpenAI.Codegen.DocsParser.{Documentation, Schema, Path, Operation, Parameter, Response, RequestBody}

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
    test "returns Documentation struct with typed components" do
      result = DocsParser.get_documentation(@minimal_yaml)
      
      assert %Documentation{} = result
      assert is_map(result.components)
      assert is_map(result.paths)
    end

    test "parses minimal YAML into typed structs" do
      result = DocsParser.get_documentation(@minimal_yaml)
      
      # Check Schema struct
      assert %Schema{} = result.components["TestModel"]
      test_model = result.components["TestModel"]
      assert test_model.name == "TestModel"
      assert test_model.type == "object"
      assert test_model.properties["id"]["type"] == "string"
      assert test_model.properties["name"]["type"] == "string"
      
      # Check Path struct
      assert %Path{} = result.paths["/test"]
      test_path = result.paths["/test"]
      assert test_path.path == "/test"
      
      # Check Operation struct
      assert %Operation{} = test_path.operations["get"]
      get_operation = test_path.operations["get"]
      assert get_operation.method == "get"
      assert get_operation.operation_id == "getTest"
      
      # Check Response struct
      assert %Response{} = get_operation.responses["200"]
      response = get_operation.responses["200"]
      assert response.status_code == "200"
      assert response.description == "OK"
    end

    test "parses complex YAML with all struct types" do
      result = DocsParser.get_documentation(@complex_yaml)
      
      # Check Documentation struct fields
      assert result.info["title"] == "Test API"
      assert result.info["version"] == "1.0.0"
      
      # Check multiple schemas
      assert %Schema{} = result.components["Model1"]
      assert %Schema{} = result.components["Model2"]
      
      model1 = result.components["Model1"]
      assert model1.name == "Model1"
      assert model1.type == "object"
      assert model1.properties["field1"]["type"] == "string"
      assert model1.properties["field2"]["type"] == "integer"
      
      model2 = result.components["Model2"]
      assert model2.name == "Model2"
      assert model2.required == ["requiredField"]
      assert model2.properties["requiredField"]["type"] == "string"
      assert model2.properties["optionalField"]["type"] == "boolean"
      
      # Check paths with multiple operations
      resource1_path = result.paths["/resource1"]
      assert %Path{} = resource1_path
      assert map_size(resource1_path.operations) == 2
      
      # Check GET operation with parameters
      get_op = resource1_path.operations["get"]
      assert %Operation{} = get_op
      assert get_op.operation_id == "getResource1"
      assert length(get_op.parameters) == 1
      
      param = hd(get_op.parameters)
      assert %Parameter{} = param
      assert param.name == "id"
      assert param.in == "path"
      assert param.required == true
      assert param.schema["type"] == "string"
      
      # Check POST operation with request body
      post_op = resource1_path.operations["post"]
      assert %Operation{} = post_op
      assert post_op.operation_id == "createResource1"
      
      assert %RequestBody{} = post_op.request_body
      assert post_op.request_body.required == true
      assert post_op.request_body.content["application/json"]["schema"]["$ref"] == 
        "#/components/schemas/Model1"
      
      # Check responses
      assert %Response{} = post_op.responses["201"]
      assert post_op.responses["201"].description == "Created"
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
      
      assert %Documentation{} = result
      assert result.components == %{}
      assert map_size(result.paths) == 1
      assert result.paths["/test"].operations["get"].operation_id == "getTest"
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
      
      assert %Documentation{} = result
      assert map_size(result.components) == 1
      assert result.components["TestModel"].type == "object"
      assert result.paths == %{}
    end

    test "handles empty YAML sections" do
      yaml = """
      openapi: 3.0.0
      components:
        schemas: {}
      paths: {}
      """
      
      result = DocsParser.get_documentation(yaml)
      
      assert %Documentation{} = result
      assert result.components == %{}
      assert result.paths == %{}
    end

    test "parses actual OpenAI docs.yaml structure with typed structs" do
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
      
      # Verify Schema struct
      upload_part = result.components["AddUploadPartRequest"]
      assert %Schema{} = upload_part
      assert upload_part.name == "AddUploadPartRequest"
      assert upload_part.type == "object"
      assert upload_part.additional_properties == false
      assert upload_part.properties["data"]["format"] == "binary"
      
      # Verify Path and Operation structs
      assistants_path = result.paths["/assistants"]
      assert %Path{} = assistants_path
      
      list_op = assistants_path.operations["get"]
      assert %Operation{} = list_op
      assert list_op.operation_id == "listAssistants"
      assert list_op.tags == ["Assistants"]
      assert list_op.summary == "Returns a list of assistants."
      
      # Verify Parameter struct
      limit_param = hd(list_op.parameters)
      assert %Parameter{} = limit_param
      assert limit_param.name == "limit"
      assert limit_param.in == "query"
      assert limit_param.required == false
      assert limit_param.schema["default"] == 20
    end

    test "preserves raw data in Schema struct" do
      yaml = """
      openapi: 3.0.0
      components:
        schemas:
          TestSchema:
            type: object
            x-custom-field: custom-value
            properties:
              field:
                type: string
      """
      
      result = DocsParser.get_documentation(yaml)
      schema = result.components["TestSchema"]
      
      assert %Schema{} = schema
      assert schema.raw["x-custom-field"] == "custom-value"
      assert schema.raw["type"] == "object"
    end

    test "handles various OpenAPI schema features" do
      yaml = """
      openapi: 3.0.0
      components:
        schemas:
          ComplexSchema:
            type: object
            description: A complex schema
            required:
              - requiredProp
            properties:
              requiredProp:
                type: string
              nullableProp:
                type: string
                nullable: true
              enumProp:
                type: string
                enum: [value1, value2, value3]
              defaultProp:
                type: integer
                default: 42
              readOnlyProp:
                type: string
                readOnly: true
              deprecatedProp:
                type: string
                deprecated: true
          AllOfSchema:
            allOf:
              - $ref: '#/components/schemas/Base'
              - type: object
                properties:
                  additionalProp:
                    type: string
      """
      
      result = DocsParser.get_documentation(yaml)
      
      # Check complex schema features
      complex = result.components["ComplexSchema"]
      assert complex.description == "A complex schema"
      assert complex.required == ["requiredProp"]
      assert complex.properties["nullableProp"]["nullable"] == true
      assert complex.properties["enumProp"]["enum"] == ["value1", "value2", "value3"]
      assert complex.properties["defaultProp"]["default"] == 42
      assert complex.properties["readOnlyProp"]["readOnly"] == true
      assert complex.properties["deprecatedProp"]["deprecated"] == true
      
      # Check allOf schema
      all_of = result.components["AllOfSchema"]
      assert length(all_of.all_of) == 2
      assert hd(all_of.all_of)["$ref"] == "#/components/schemas/Base"
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
      
      # Verify we got the expected Documentation struct
      assert %Documentation{} = result
      
      # Check that we have many schemas
      assert map_size(result.components) > 100
      
      # Check that we have many paths
      assert map_size(result.paths) > 50
      
      # Spot check some known schemas are Schema structs
      assert %Schema{} = result.components["CreateChatCompletionRequest"]
      assert %Schema{} = result.components["CreateChatCompletionResponse"]
      
      # Spot check some known paths are Path structs
      assert %Path{} = result.paths["/chat/completions"]
      assert %Path{} = result.paths["/models"]
      assert %Path{} = result.paths["/assistants"]
      
      # Verify the structure of a specific schema
      chat_req = result.components["CreateChatCompletionRequest"]
      assert chat_req.name == "CreateChatCompletionRequest"
      assert is_list(chat_req.all_of)
      
      # Verify the structure of a specific path
      chat_path = result.paths["/chat/completions"]
      assert %Operation{} = chat_path.operations["post"]
      assert chat_path.operations["post"].operation_id == "createChatCompletion"
    end
  end
end