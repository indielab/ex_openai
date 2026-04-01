defmodule ExOpenAI.Images do
  @moduledoc false
  (
    @doc """
    Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.

    You can call this endpoint with either:

    - `multipart/form-data`: use binary uploads via `image` (and optional `mask`).
    - `application/json`: use `images` (and optional `mask`) as references with either `image_url` or `file_id`.

    Note that JSON requests use `images` (array) instead of the multipart `image` field.


    ## Parameters

    * `images` - **required** - `[any()]`  
      Input image references to edit.
    For GPT image models, you can provide up to 16 images.  
      Constraints: minItems: 1, maxItems: 16

    * `prompt` - **required** - `String.t()`  
      A text description of the desired image edit.  
      Constraints: minLength: 1, maxLength: 32000  
      Example: `"Add a watercolor effect and keep the subject centered"`

    ## Options

    * `background` - **optional** - `:transparent | :opaque | :auto | any()`  
      Background behavior for generated image output.  
      Default: `"auto"`  
      Example: `"transparent"`

    * `input_fidelity` - **optional** - `:high | :low | any()`  
      Controls fidelity to the original input image(s).

    * `mask` - **optional** - `any()`

    * `model` - **optional** - `String.t() | :"gpt-image-1.5" | :"gpt-image-1" | :"gpt-image-1-mini" | :"chatgpt-image-latest" | any()`  
      The model to use for image editing.  
      Default: `"gpt-image-1.5"`  
      Example: `"gpt-image-1.5"`

    * `moderation` - **optional** - `:low | :auto | any()`  
      Moderation level for GPT image models.  
      Default: `"auto"`  
      Example: `"auto"`

    * `n` - **optional** - `integer() | any()`  
      The number of edited images to generate.  
      Default: `1`  
      Example: `1`

    * `output_compression` - **optional** - `integer() | any()`  
      Compression level for `jpeg` or `webp` output.  
      Example: `100`

    * `output_format` - **optional** - `:png | :jpeg | :webp | any()`  
      Output image format. Supported for GPT image models.  
      Default: `"png"`  
      Example: `"png"`

    * `partial_images` - **optional** - `any()`

    * `quality` - **optional** - `:low | :medium | :high | :auto | any()`  
      Output quality for GPT image models.  
      Default: `"auto"`  
      Example: `"high"`

    * `size` - **optional** - `:auto | :"1024x1024" | :"1536x1024" | :"1024x1536" | any()`  
      Requested output image size.  
      Default: `"auto"`  
      Example: `"1024x1024"`

    * `stream` - **optional** - `boolean() | any()`  
      Stream partial image results as events.  
      Default: `false`  
      Example: `false`

    * `user` - **optional** - `String.t()`  
      A unique identifier representing your end-user, which can help OpenAI
    monitor and detect abuse.  
      Example: `"user-1234"`
    """
    @spec create_image_edit(
            images :: list(ExOpenAI.Components.ImageRefParam.t()),
            prompt :: String.t(),
            opts :: [
              ((((((((((({:background, ((:transparent | :opaque) | :auto) | any()}
                         | {:input_fidelity, (:high | :low) | any()})
                        | {:mask, ExOpenAI.Components.ImageRefParam.t()})
                       | {:model,
                          (String.t()
                           | ((:"gpt-image-1.5" | :"gpt-image-1") | :"gpt-image-1-mini")
                           | :"chatgpt-image-latest")
                          | any()})
                      | {:moderation, (:low | :auto) | any()})
                     | {:n, integer() | any()})
                    | {:output_compression, integer() | any()})
                   | {:output_format, ((:png | :jpeg) | :webp) | any()})
                  | {:partial_images, ExOpenAI.Components.PartialImages.t()})
                 | {:quality, (((:low | :medium) | :high) | :auto) | any()})
                | {:size, (((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | any()})
               | {:stream, boolean() | any()})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ImagesResponse.t()} | {:error, any()}
    def create_image_edit(images, prompt, opts \\ []) do
      url = "/images/edits"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [images: images, prompt: prompt]

      optional_body_params =
        Keyword.take(opts, [
          :background,
          :input_fidelity,
          :mask,
          :model,
          :moderation,
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :size,
          :stream,
          :user
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :background,
          :input_fidelity,
          :mask,
          :model,
          :moderation,
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :size,
          :stream,
          :user
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/ImagesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
        end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Creates an image given a prompt. [Learn more](/docs/guides/images).


    ## Parameters

    * `prompt` - **required** - `String.t()`  
      A text description of the desired image(s). The maximum length is 32000 characters for the GPT image models, 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.  
      Example: `"A cute baby sea otter"`

    ## Options

    * `background` - **optional** - `:transparent | :opaque | :auto | nil`  
      Allows to set transparency for the background of the generated image(s).
    This parameter is only supported for the GPT image models. Must be one of
    `transparent`, `opaque` or `auto` (default value). When `auto` is used, the
    model will automatically determine the best background for the image.

    If `transparent`, the output format needs to support transparency, so it
    should be set to either `png` (default value) or `webp`.  
      Allowed values: `"transparent"`, `"opaque"`, `"auto"`  
      Default: `"auto"`  
      Example: `"transparent"`

    * `model` - **optional** - `String.t() | :"gpt-image-1.5" | :"dall-e-2" | :"dall-e-3" | :"gpt-image-1" | :"gpt-image-1-mini" | nil`  
      The model to use for image generation. One of `dall-e-2`, `dall-e-3`, or a GPT image model (`gpt-image-1`, `gpt-image-1-mini`, `gpt-image-1.5`). Defaults to `dall-e-2` unless a parameter specific to the GPT image models is used.  
      Default: `"dall-e-2"`  
      Example: `"gpt-image-1.5"`

    * `moderation` - **optional** - `:low | :auto | nil`  
      Control the content-moderation level for images generated by the GPT image models. Must be either `low` for less restrictive filtering or `auto` (default value).  
      Allowed values: `"low"`, `"auto"`  
      Default: `"auto"`  
      Example: `"low"`

    * `n` - **optional** - `integer() | nil`  
      The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.  
      Default: `1`  
      Constraints: minimum: 1, maximum: 10  
      Example: `1`

    * `output_compression` - **optional** - `integer() | nil`  
      The compression level (0-100%) for the generated images. This parameter is only supported for the GPT image models with the `webp` or `jpeg` output formats, and defaults to 100.  
      Default: `100`  
      Example: `100`

    * `output_format` - **optional** - `:png | :jpeg | :webp | nil`  
      The format in which the generated images are returned. This parameter is only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.  
      Allowed values: `"png"`, `"jpeg"`, `"webp"`  
      Default: `"png"`  
      Example: `"png"`

    * `partial_images` - **optional** - `any()`

    * `quality` - **optional** - `:standard | :hd | :low | :medium | :high | :auto | nil`  
      The quality of the image that will be generated.

    - `auto` (default value) will automatically select the best quality for the given model.
    - `high`, `medium` and `low` are supported for the GPT image models.
    - `hd` and `standard` are supported for `dall-e-3`.
    - `standard` is the only option for `dall-e-2`.  
      Allowed values: `"standard"`, `"hd"`, `"low"`, `"medium"`, `"high"`, `"auto"`  
      Default: `"auto"`  
      Example: `"medium"`

    * `response_format` - **optional** - `:url | :b64_json | nil`  
      The format in which generated images with `dall-e-2` and `dall-e-3` are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter isn't supported for the GPT image models, which always return base64-encoded images.  
      Allowed values: `"url"`, `"b64_json"`  
      Default: `"url"`  
      Example: `"url"`

    * `size` - **optional** - `:auto | :"1024x1024" | :"1536x1024" | :"1024x1536" | :"256x256" | :"512x512" | :"1792x1024" | :"1024x1792" | nil`  
      The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`, and one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3`.  
      Allowed values: `"auto"`, `"1024x1024"`, `"1536x1024"`, `"1024x1536"`, `"256x256"`, `"512x512"`, `"1792x1024"`, `"1024x1792"`  
      Default: `"auto"`  
      Example: `"1024x1024"`

    * `stream` - **optional** - `boolean() | nil`  
      Generate the image in streaming mode. Defaults to `false`. See the
    [Image generation guide](/docs/guides/image-generation) for more information.
    This parameter is only supported for the GPT image models.  
      Default: `false`  
      Example: `false`

    * `style` - **optional** - `:vivid | :natural | nil`  
      The style of the generated images. This parameter is only supported for `dall-e-3`. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images.  
      Allowed values: `"vivid"`, `"natural"`  
      Default: `"vivid"`  
      Example: `"vivid"`

    * `user` - **optional** - `String.t()`  
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).  
      Example: `"user-1234"`
    """
    @spec create_image(
            prompt :: String.t(),
            opts :: [
              ((((((((((({:background, ((:transparent | :opaque) | :auto) | nil}
                         | {:model,
                            (String.t()
                             | (((:"gpt-image-1.5" | :"dall-e-2") | :"dall-e-3") | :"gpt-image-1")
                             | :"gpt-image-1-mini")
                            | nil})
                        | {:moderation, (:low | :auto) | nil})
                       | {:n, integer() | nil})
                      | {:output_compression, integer() | nil})
                     | {:output_format, ((:png | :jpeg) | :webp) | nil})
                    | {:partial_images, ExOpenAI.Components.PartialImages.t()})
                   | {:quality, (((((:standard | :hd) | :low) | :medium) | :high) | :auto) | nil})
                  | {:response_format, (:url | :b64_json) | nil})
                 | {:size,
                    (((((((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | :"256x256")
                       | :"512x512")
                      | :"1792x1024")
                     | :"1024x1792")
                    | nil})
                | {:stream, boolean() | nil})
               | {:style, (:vivid | :natural) | nil})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ImagesResponse.t()} | {:error, any()}
    def create_image(prompt, opts \\ []) do
      url = "/images/generations"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [prompt: prompt]

      optional_body_params =
        Keyword.take(opts, [
          :background,
          :model,
          :moderation,
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :response_format,
          :size,
          :stream,
          :style,
          :user
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :background,
          :model,
          :moderation,
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :response_format,
          :size,
          :stream,
          :style,
          :user
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/ImagesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
        end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Creates a variation of a given image. This endpoint only supports `dall-e-2`.

    ## Parameters

    * `image` - **required** - `binary()`  
      The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.  
      Format: `binary`

    ## Options

    * `model` - **optional** - `String.t() | :"dall-e-2" | nil`  
      The model to use for image generation. Only `dall-e-2` is supported at this time.  
      Default: `"dall-e-2"`  
      Example: `"dall-e-2"`

    * `n` - **optional** - `integer() | nil`  
      The number of images to generate. Must be between 1 and 10.  
      Default: `1`  
      Constraints: minimum: 1, maximum: 10  
      Example: `1`

    * `response_format` - **optional** - `:url | :b64_json | nil`  
      The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.  
      Allowed values: `"url"`, `"b64_json"`  
      Default: `"url"`  
      Example: `"url"`

    * `size` - **optional** - `:"256x256" | :"512x512" | :"1024x1024" | nil`  
      The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.  
      Allowed values: `"256x256"`, `"512x512"`, `"1024x1024"`  
      Default: `"1024x1024"`  
      Example: `"1024x1024"`

    * `user` - **optional** - `String.t()`  
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).  
      Example: `"user-1234"`
    """
    @spec create_image_variation(
            image :: binary(),
            opts :: [
              ((({:model, (String.t() | :"dall-e-2") | nil} | {:n, integer() | nil})
                | {:response_format, (:url | :b64_json) | nil})
               | {:size, ((:"256x256" | :"512x512") | :"1024x1024") | nil})
              | {:user, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ImagesResponse.t()} | {:error, any()}
    def create_image_variation(image, opts \\ []) do
      url = "/images/variations"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [image: image]
      optional_body_params = Keyword.take(opts, [:model, :n, :response_format, :size, :user])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:model, :n, :response_format, :size, :user] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
              __struct__: ExOpenAI.Codegen.DocsParser.Schema,
              additional_properties: nil,
              all_of: nil,
              any_of: nil,
              default: nil,
              deprecated: nil,
              description: nil,
              discriminator: nil,
              enum: nil,
              example: nil,
              format: nil,
              items: nil,
              name: nil,
              nullable: nil,
              one_of: nil,
              properties: nil,
              raw: nil,
              read_only: nil,
              ref: "#/components/schemas/ImagesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
        end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )
end
