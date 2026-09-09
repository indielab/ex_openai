defmodule ExOpenAI.Images do
  @moduledoc """
  Functions for the OpenAI images API.
  """
  (
    @doc """
    Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.

    You can call this endpoint with either:

    - `multipart/form-data`: use binary uploads via `image` (and optional `mask`).
    - `application/json`: use `images` (and optional `mask`) as references with either `image_url` or `file_id`.

    Note that JSON requests use `images` (array) instead of the multipart `image` field.


    ## Parameters

    * `image` - **required** - `binary() | {String.t(), binary()} | list(binary() | {String.t(), binary()})`
      The image(s) to edit. Must be a supported image file or an array of images.

    For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
    file less than 50MB. You can provide up to 16 images.
    `chatgpt-image-latest` follows the same input constraints as GPT image models.

    For `dall-e-2`, you can only provide one image, and it should be a square
    `png` file less than 4MB.

    * `prompt` - **required** - `String.t()`
      A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.
      Example: `"A cute baby sea otter wearing a beret"`

    ## Options

    * `background` - **optional** - `:transparent | :opaque | :auto | nil | String.t() | nil`
      Allows to set transparency for the background of the generated image(s).
    This parameter is only supported for the GPT image models. Must be one of
    `transparent`, `opaque` or `auto` (default value). When `auto` is used, the
    model will automatically determine the best background for the image.

    If `transparent`, the output format needs to support transparency, so it
    should be set to either `png` (default value) or `webp`.
      Allowed values: `"transparent"`, `"opaque"`, `"auto"`
      Default: `"auto"`
      Example: `"transparent"`

    * `input_fidelity` - **optional** - `ExOpenAI.Components.InputFidelity.input() | nil`

    * `mask` - **optional** - `binary() | {String.t(), binary()}`
      An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
      Format: `binary`

    * `model` - **optional** - `String.t() | :"gpt-image-1.5" | :"dall-e-2" | :"gpt-image-1" | :"gpt-image-1-mini" | :"chatgpt-image-latest" | String.t() | nil`
      The model to use for image generation. Defaults to `gpt-image-1.5`.
      Default: `"gpt-image-1.5"`
      Example: `"gpt-image-1.5"`

    * `n` - **optional** - `integer() | nil`
      The number of images to generate. Must be between 1 and 10.
      Default: `1`
      Constraints: minimum: 1, maximum: 10
      Example: `1`

    * `output_compression` - **optional** - `integer() | nil`
      The compression level (0-100%) for the generated images. This parameter
    is only supported for the GPT image models with the `webp` or `jpeg` output
    formats, and defaults to 100.
      Default: `100`
      Example: `100`

    * `output_format` - **optional** - `:png | :jpeg | :webp | nil | String.t() | nil`
      The format in which the generated images are returned. This parameter is
    only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
    The default value is `png`.
      Allowed values: `"png"`, `"jpeg"`, `"webp"`
      Default: `"png"`
      Example: `"png"`

    * `partial_images` - **optional** - `ExOpenAI.Components.PartialImages.input()`

    * `quality` - **optional** - `:standard | :low | :medium | :high | :auto | nil | String.t() | nil`
      The quality of the image that will be generated for GPT image models. Defaults to `auto`.
      Allowed values: `"standard"`, `"low"`, `"medium"`, `"high"`, `"auto"`
      Default: `"auto"`
      Example: `"high"`

    * `response_format` - **optional** - `:url | :b64_json | nil | String.t() | nil`
      The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.
      Allowed values: `"url"`, `"b64_json"`
      Example: `"url"`

    * `size` - **optional** - `String.t() | :"256x256" | :"512x512" | :"1024x1024" | :"1536x1024" | :"1024x1536" | :auto | String.t() | nil`
      The size of the generated images. For `gpt-image-2` and `gpt-image-2-2026-04-21`, arbitrary resolutions are supported as `WIDTHxHEIGHT` strings, for example `1536x864`. Width and height must both be divisible by 16 and the requested aspect ratio must be between 1:3 and 3:1. Resolutions above `2560x1440` are experimental, and the maximum supported resolution is `3840x2160`. The requested size must also satisfy the model's current pixel and edge limits. The standard sizes `1024x1024`, `1536x1024`, and `1024x1536` are supported by the GPT image models; `auto` is supported for models that allow automatic sizing. For `dall-e-2`, use one of `256x256`, `512x512`, or `1024x1024`. For `dall-e-3`, use one of `1024x1024`, `1792x1024`, or `1024x1792`.
      Default: `"1024x1024"`
      Example: `"1024x1024"`

    * `stream` - **optional** - `boolean() | nil`
      Edit the image in streaming mode. Defaults to `false`. See the
    [Image generation guide](https://platform.openai.com/docs/guides/image-generation) for more information.
      Default: `false`
      Example: `false`

    * `user` - **optional** - `String.t()`
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
      Example: `"user-1234"`
    """
    (
      @type create_image_edit_opt() ::
              (((((((((((({:background,
                           ((((:transparent | :opaque) | :auto) | nil) | String.t()) | nil}
                          | {:input_fidelity, ExOpenAI.Components.InputFidelity.input() | nil})
                         | {:mask, binary() | {String.t(), binary()}})
                        | {:model,
                           (String.t()
                            | ((((:"gpt-image-1.5" | :"dall-e-2") | :"gpt-image-1")
                                | :"gpt-image-1-mini")
                               | :"chatgpt-image-latest")
                            | String.t())
                           | nil})
                       | {:n, integer() | nil})
                      | {:output_compression, integer() | nil})
                     | {:output_format, ((((:png | :jpeg) | :webp) | nil) | String.t()) | nil})
                    | {:partial_images, ExOpenAI.Components.PartialImages.input()})
                   | {:quality,
                      ((((((:standard | :low) | :medium) | :high) | :auto) | nil) | String.t())
                      | nil})
                  | {:response_format, (((:url | :b64_json) | nil) | String.t()) | nil})
                 | {:size,
                    (String.t()
                     | (((((:"256x256" | :"512x512") | :"1024x1024") | :"1536x1024")
                         | :"1024x1536")
                        | :auto)
                     | String.t())
                    | nil})
                | {:stream, boolean() | nil})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec create_image_edit(
              image ::
                (binary() | {String.t(), binary()}) | list(binary() | {String.t(), binary()}),
              prompt :: String.t(),
              opts :: [create_image_edit_opt()]
            ) :: {:ok, ExOpenAI.Components.ImagesResponse.t() | reference()} | {:error, any()}
    )

    def create_image_edit(image, prompt, opts \\ []) do
      url = "/images/edits"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [image: image, prompt: prompt]

      optional_body_params =
        Keyword.take(opts, [
          :background,
          :input_fidelity,
          :mask,
          :model,
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :response_format,
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
          :n,
          :output_compression,
          :output_format,
          :partial_images,
          :quality,
          :response_format,
          :size,
          :stream,
          :user
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/ImageEditStreamEvent"
              }
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ImagesResponse"}
            )
          end
        end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:image, :mask], %{})

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
    Creates an image given a prompt. [Learn more](https://platform.openai.com/docs/guides/images).


    ## Parameters

    * `prompt` - **required** - `String.t()`
      A text description of the desired image(s). The maximum length is 32000 characters for the GPT image models, 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.
      Example: `"A cute baby sea otter"`

    ## Options

    * `background` - **optional** - `:transparent | :opaque | :auto | nil | String.t() | nil`
      Allows to set transparency for the background of the generated image(s).
    This parameter is only supported for the GPT image models. Must be one of
    `transparent`, `opaque` or `auto` (default value). When `auto` is used, the
    model will automatically determine the best background for the image.

    If `transparent`, the output format needs to support transparency, so it
    should be set to either `png` (default value) or `webp`.
      Allowed values: `"transparent"`, `"opaque"`, `"auto"`
      Default: `"auto"`
      Example: `"transparent"`

    * `model` - **optional** - `String.t() | :"gpt-image-1.5" | :"dall-e-2" | :"dall-e-3" | :"gpt-image-1" | :"gpt-image-1-mini" | String.t() | nil`
      The model to use for image generation. One of `dall-e-2`, `dall-e-3`, or a GPT image model (`gpt-image-1`, `gpt-image-1-mini`, `gpt-image-1.5`). Defaults to `dall-e-2` unless a parameter specific to the GPT image models is used.
      Default: `"dall-e-2"`
      Example: `"gpt-image-1.5"`

    * `moderation` - **optional** - `:low | :auto | nil | String.t() | nil`
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

    * `output_format` - **optional** - `:png | :jpeg | :webp | nil | String.t() | nil`
      The format in which the generated images are returned. This parameter is only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
      Allowed values: `"png"`, `"jpeg"`, `"webp"`
      Default: `"png"`
      Example: `"png"`

    * `partial_images` - **optional** - `ExOpenAI.Components.PartialImages.input()`

    * `quality` - **optional** - `:standard | :hd | :low | :medium | :high | :auto | nil | String.t() | nil`
      The quality of the image that will be generated.

    - `auto` (default value) will automatically select the best quality for the given model.
    - `high`, `medium` and `low` are supported for the GPT image models.
    - `hd` and `standard` are supported for `dall-e-3`.
    - `standard` is the only option for `dall-e-2`.
      Allowed values: `"standard"`, `"hd"`, `"low"`, `"medium"`, `"high"`, `"auto"`
      Default: `"auto"`
      Example: `"medium"`

    * `response_format` - **optional** - `:url | :b64_json | nil | String.t() | nil`
      The format in which generated images with `dall-e-2` and `dall-e-3` are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter isn't supported for the GPT image models, which always return base64-encoded images.
      Allowed values: `"url"`, `"b64_json"`
      Default: `"url"`
      Example: `"url"`

    * `size` - **optional** - `String.t() | :auto | :"1024x1024" | :"1536x1024" | :"1024x1536" | :"256x256" | :"512x512" | :"1792x1024" | :"1024x1792" | String.t() | nil`
      The size of the generated images. For `gpt-image-2` and `gpt-image-2-2026-04-21`, arbitrary resolutions are supported as `WIDTHxHEIGHT` strings, for example `1536x864`. Width and height must both be divisible by 16 and the requested aspect ratio must be between 1:3 and 3:1. Resolutions above `2560x1440` are experimental, and the maximum supported resolution is `3840x2160`. The requested size must also satisfy the model's current pixel and edge limits. The standard sizes `1024x1024`, `1536x1024`, and `1024x1536` are supported by the GPT image models; `auto` is supported for models that allow automatic sizing. For `dall-e-2`, use one of `256x256`, `512x512`, or `1024x1024`. For `dall-e-3`, use one of `1024x1024`, `1792x1024`, or `1024x1792`.
      Default: `"auto"`
      Example: `"1024x1024"`

    * `stream` - **optional** - `boolean() | nil`
      Generate the image in streaming mode. Defaults to `false`. See the
    [Image generation guide](https://platform.openai.com/docs/guides/image-generation) for more information.
    This parameter is only supported for the GPT image models.
      Default: `false`
      Example: `false`

    * `style` - **optional** - `:vivid | :natural | nil | String.t() | nil`
      The style of the generated images. This parameter is only supported for `dall-e-3`. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images.
      Allowed values: `"vivid"`, `"natural"`
      Default: `"vivid"`
      Example: `"vivid"`

    * `user` - **optional** - `String.t()`
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
      Example: `"user-1234"`
    """
    (
      @type create_image_opt() ::
              (((((((((((({:background,
                           ((((:transparent | :opaque) | :auto) | nil) | String.t()) | nil}
                          | {:model,
                             (String.t()
                              | ((((:"gpt-image-1.5" | :"dall-e-2") | :"dall-e-3")
                                  | :"gpt-image-1")
                                 | :"gpt-image-1-mini")
                              | String.t())
                             | nil})
                         | {:moderation, (((:low | :auto) | nil) | String.t()) | nil})
                        | {:n, integer() | nil})
                       | {:output_compression, integer() | nil})
                      | {:output_format, ((((:png | :jpeg) | :webp) | nil) | String.t()) | nil})
                     | {:partial_images, ExOpenAI.Components.PartialImages.input()})
                    | {:quality,
                       (((((((:standard | :hd) | :low) | :medium) | :high) | :auto) | nil)
                        | String.t())
                       | nil})
                   | {:response_format, (((:url | :b64_json) | nil) | String.t()) | nil})
                  | {:size,
                     (String.t()
                      | (((((((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | :"256x256")
                           | :"512x512")
                          | :"1792x1024")
                         | :"1024x1792")
                      | String.t())
                     | nil})
                 | {:stream, boolean() | nil})
                | {:style, (((:vivid | :natural) | nil) | String.t()) | nil})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec create_image(prompt :: String.t(), opts :: [create_image_opt()]) ::
              {:ok, ExOpenAI.Components.ImagesResponse.t() | reference()} | {:error, any()}
    )

    def create_image(prompt, opts \\ []) do
      url = "/images/generations"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
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
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ImageGenStreamEvent"}
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ImagesResponse"}
            )
          end
        end

      nil

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

    * `image` - **required** - `binary() | {String.t(), binary()}`
      The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
      Format: `binary`

    ## Options

    * `model` - **optional** - `String.t() | :"dall-e-2" | String.t() | nil`
      The model to use for image generation. Only `dall-e-2` is supported at this time.
      Default: `"dall-e-2"`
      Example: `"dall-e-2"`

    * `n` - **optional** - `integer() | nil`
      The number of images to generate. Must be between 1 and 10.
      Default: `1`
      Constraints: minimum: 1, maximum: 10
      Example: `1`

    * `response_format` - **optional** - `:url | :b64_json | nil | String.t() | nil`
      The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.
      Allowed values: `"url"`, `"b64_json"`
      Default: `"url"`
      Example: `"url"`

    * `size` - **optional** - `:"256x256" | :"512x512" | :"1024x1024" | nil | String.t() | nil`
      The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
      Allowed values: `"256x256"`, `"512x512"`, `"1024x1024"`
      Default: `"1024x1024"`
      Example: `"1024x1024"`

    * `user` - **optional** - `String.t()`
      A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
      Example: `"user-1234"`
    """
    (
      @type create_image_variation_opt() ::
              (((({:model, (String.t() | :"dall-e-2" | String.t()) | nil} | {:n, integer() | nil})
                 | {:response_format, (((:url | :b64_json) | nil) | String.t()) | nil})
                | {:size, ((((:"256x256" | :"512x512") | :"1024x1024") | nil) | String.t()) | nil})
               | {:user, String.t()})
              | ExOpenAI.request_option()
      @spec create_image_variation(
              image :: binary() | {String.t(), binary()},
              opts :: [create_image_variation_opt()]
            ) :: {:ok, ExOpenAI.Components.ImagesResponse.t()} | {:error, any()}
    )

    def create_image_variation(image, opts \\ []) do
      url = "/images/variations"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [image: image]
      optional_body_params = Keyword.take(opts, [:model, :n, :response_format, :size, :user])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:model, :n, :response_format, :size, :user] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ImagesResponse"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:image], %{})

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
