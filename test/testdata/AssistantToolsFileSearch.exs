%ExOpenAI.Codegen.DocsParser.Schema{
  name: "AssistantToolsFileSearch",
  type: "object",
  description: nil,
  properties: %{
    "file_search" => %ExOpenAI.Codegen.DocsParser.Schema{
      name: "file_search",
      type: "object",
      description: "Overrides for the file search tool.",
      properties: %{
        "max_num_results" => %ExOpenAI.Codegen.DocsParser.Schema{
          name: "max_num_results",
          type: "integer",
          description: "The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.\n\nNote that the file search tool may output fewer than `max_num_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.\n",
          properties: nil,
          required: nil,
          enum: nil,
          all_of: nil,
          one_of: nil,
          any_of: nil,
          ref: nil,
          format: nil,
          items: nil,
          additional_properties: nil,
          example: nil,
          default: nil,
          nullable: nil,
          discriminator: nil,
          read_only: nil,
          write_only: nil,
          deprecated: nil,
          raw: %{
            "description" => "The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.\n\nNote that the file search tool may output fewer than `max_num_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.\n",
            "maximum" => 50,
            "minimum" => 1,
            "type" => "integer"
          }
        },
        "ranking_options" => %ExOpenAI.Codegen.DocsParser.Schema{
          name: "ranking_options",
          type: nil,
          description: nil,
          properties: nil,
          required: nil,
          enum: nil,
          all_of: nil,
          one_of: nil,
          any_of: nil,
          ref: "#/components/schemas/FileSearchRankingOptions",
          format: nil,
          items: nil,
          additional_properties: nil,
          example: nil,
          default: nil,
          nullable: nil,
          discriminator: nil,
          read_only: nil,
          write_only: nil,
          deprecated: nil,
          raw: %{"$ref" => "#/components/schemas/FileSearchRankingOptions"}
        }
      },
      required: nil,
      enum: nil,
      all_of: nil,
      one_of: nil,
      any_of: nil,
      ref: nil,
      format: nil,
      items: nil,
      additional_properties: nil,
      example: nil,
      default: nil,
      nullable: nil,
      discriminator: nil,
      read_only: nil,
      write_only: nil,
      deprecated: nil,
      raw: %{
        "description" => "Overrides for the file search tool.",
        "properties" => %{
          "max_num_results" => %{
            "description" => "The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.\n\nNote that the file search tool may output fewer than `max_num_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.\n",
            "maximum" => 50,
            "minimum" => 1,
            "type" => "integer"
          },
          "ranking_options" => %{
            "$ref" => "#/components/schemas/FileSearchRankingOptions"
          }
        },
        "type" => "object"
      }
    },
    "type" => %ExOpenAI.Codegen.DocsParser.Schema{
      name: "type",
      type: "string",
      description: "The type of tool being defined: `file_search`",
      properties: nil,
      required: nil,
      enum: ["file_search"],
      all_of: nil,
      one_of: nil,
      any_of: nil,
      ref: nil,
      format: nil,
      items: nil,
      additional_properties: nil,
      example: nil,
      default: nil,
      nullable: nil,
      discriminator: nil,
      read_only: nil,
      write_only: nil,
      deprecated: nil,
      raw: %{
        "description" => "The type of tool being defined: `file_search`",
        "enum" => ["file_search"],
        "type" => "string",
        "x-stainless-const" => true
      }
    }
  },
  required: ["type"],
  enum: nil,
  all_of: nil,
  one_of: nil,
  any_of: nil,
  ref: nil,
  format: nil,
  items: nil,
  additional_properties: nil,
  example: nil,
  default: nil,
  nullable: nil,
  discriminator: nil,
  read_only: nil,
  write_only: nil,
  deprecated: nil,
  raw: %{
    "properties" => %{
      "file_search" => %{
        "description" => "Overrides for the file search tool.",
        "properties" => %{
          "max_num_results" => %{
            "description" => "The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.\n\nNote that the file search tool may output fewer than `max_num_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.\n",
            "maximum" => 50,
            "minimum" => 1,
            "type" => "integer"
          },
          "ranking_options" => %{
            "$ref" => "#/components/schemas/FileSearchRankingOptions"
          }
        },
        "type" => "object"
      },
      "type" => %{
        "description" => "The type of tool being defined: `file_search`",
        "enum" => ["file_search"],
        "type" => "string",
        "x-stainless-const" => true
      }
    },
    "required" => ["type"],
    "title" => "FileSearch tool",
    "type" => "object"
  }
}