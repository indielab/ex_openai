%ExOpenAI.Codegen.DocsParser.Schema{
  name: "ChatCompletionRequestUserMessage",
  type: "object",
  description: "Messages sent by an end user, containing prompts or additional context\ninformation.\n",
  properties: %{
    "content" => %ExOpenAI.Codegen.DocsParser.Schema{
      name: "content",
      type: nil,
      description: "The contents of the user message.\n",
      properties: nil,
      required: nil,
      enum: nil,
      all_of: nil,
      one_of: [
        %ExOpenAI.Codegen.DocsParser.Schema{
          name: "0",
          type: "string",
          description: "The text contents of the message.",
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
            "description" => "The text contents of the message.",
            "title" => "Text content",
            "type" => "string"
          }
        },
        %ExOpenAI.Codegen.DocsParser.Schema{
          name: "1",
          type: "array",
          description: "An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text, image, or audio inputs.",
          properties: nil,
          required: nil,
          enum: nil,
          all_of: nil,
          one_of: nil,
          any_of: nil,
          ref: nil,
          format: nil,
          items: %ExOpenAI.Codegen.DocsParser.Schema{
            name: "items",
            type: nil,
            description: nil,
            properties: nil,
            required: nil,
            enum: nil,
            all_of: nil,
            one_of: nil,
            any_of: nil,
            ref: "#/components/schemas/ChatCompletionRequestUserMessageContentPart",
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
              "$ref" => "#/components/schemas/ChatCompletionRequestUserMessageContentPart"
            }
          },
          additional_properties: nil,
          example: nil,
          default: nil,
          nullable: nil,
          discriminator: nil,
          read_only: nil,
          write_only: nil,
          deprecated: nil,
          raw: %{
            "description" => "An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text, image, or audio inputs.",
            "items" => %{
              "$ref" => "#/components/schemas/ChatCompletionRequestUserMessageContentPart"
            },
            "minItems" => 1,
            "title" => "Array of content parts",
            "type" => "array"
          }
        }
      ],
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
        "description" => "The contents of the user message.\n",
        "oneOf" => [
          %{
            "description" => "The text contents of the message.",
            "title" => "Text content",
            "type" => "string"
          },
          %{
            "description" => "An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text, image, or audio inputs.",
            "items" => %{
              "$ref" => "#/components/schemas/ChatCompletionRequestUserMessageContentPart"
            },
            "minItems" => 1,
            "title" => "Array of content parts",
            "type" => "array"
          }
        ]
      }
    },
    "name" => %ExOpenAI.Codegen.DocsParser.Schema{
      name: "name",
      type: "string",
      description: "An optional name for the participant. Provides the model information to differentiate between participants of the same role.",
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
        "description" => "An optional name for the participant. Provides the model information to differentiate between participants of the same role.",
        "type" => "string"
      }
    },
    "role" => %ExOpenAI.Codegen.DocsParser.Schema{
      name: "role",
      type: "string",
      description: "The role of the messages author, in this case `user`.",
      properties: nil,
      required: nil,
      enum: ["user"],
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
        "description" => "The role of the messages author, in this case `user`.",
        "enum" => ["user"],
        "type" => "string",
        "x-stainless-const" => true
      }
    }
  },
  required: ["content", "role"],
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
    "description" => "Messages sent by an end user, containing prompts or additional context\ninformation.\n",
    "properties" => %{
      "content" => %{
        "description" => "The contents of the user message.\n",
        "oneOf" => [
          %{
            "description" => "The text contents of the message.",
            "title" => "Text content",
            "type" => "string"
          },
          %{
            "description" => "An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text, image, or audio inputs.",
            "items" => %{
              "$ref" => "#/components/schemas/ChatCompletionRequestUserMessageContentPart"
            },
            "minItems" => 1,
            "title" => "Array of content parts",
            "type" => "array"
          }
        ]
      },
      "name" => %{
        "description" => "An optional name for the participant. Provides the model information to differentiate between participants of the same role.",
        "type" => "string"
      },
      "role" => %{
        "description" => "The role of the messages author, in this case `user`.",
        "enum" => ["user"],
        "type" => "string",
        "x-stainless-const" => true
      }
    },
    "required" => ["content", "role"],
    "title" => "User message",
    "type" => "object"
  }
}