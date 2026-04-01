defmodule ExOpenAI.Videos do
  @moduledoc false
  (
    @doc """
    List recently generated videos for the current project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      Number of items to retrieve  
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `any()`  
      Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.

    * `:after` - **optional** - `String.t()`  
      Identifier for the last item from the previous pagination request
    """
    @spec list_videos(opts :: [({:limit, integer()} | {:order, any()}) | {:after, String.t()}]) ::
            {:ok, ExOpenAI.Components.VideoListResource.t()} | {:error, any()}
    def list_videos(opts \\ []) do
      url = "/videos"
      query_params = Keyword.take(opts, [:limit, :order, :after])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoListResource",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
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
    Create a new video generation job from a prompt and optional reference assets.

    ## Parameters

    * `prompt` - **required** - `String.t()`  
      Text prompt that describes the video to generate.  
      Constraints: minLength: 1, maxLength: 32000

    ## Options

    * `input_reference` - **optional** - `any()`  
      Optional reference object that guides generation. Provide exactly one of `image_url` or `file_id`.

    * `model` - **optional** - `any()`  
      The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.

    * `seconds` - **optional** - `any()`  
      Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.

    * `size` - **optional** - `any()`  
      Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
    """
    @spec create_video(
            opts :: [
              (({:input_reference, :"Elixir.ExOpenAI.Components.ImageRefParam-2".t()}
                | {:model, ExOpenAI.Components.VideoModel.t()})
               | {:seconds, ExOpenAI.Components.VideoSeconds.t()})
              | {:size, ExOpenAI.Components.VideoSize.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    def create_video(opts \\ []) do
      url = "/videos"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:input_reference, :model, :seconds, :size])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:input_reference, :model, :seconds, :size] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Create a character from an uploaded video.

    ## Parameters

    * `name` - **required** - `String.t()`  
      Display name for this API character.  
      Constraints: minLength: 1, maxLength: 80

    * `video` - **required** - `binary()`  
      Video file used to create a character.  
      Format: `binary`
    """
    @spec create_video_character(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoCharacterResource.t()} | {:error, any()}
    def create_video_character(opts \\ []) do
      url = "/videos/characters"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoCharacterResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Fetch a character.

    ## Parameters

    * `:character_id` - **required** - `String.t()`  
      The identifier of the character to retrieve.
    """
    @spec get_video_character(character_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoCharacterResource.t()} | {:error, any()}
    def get_video_character(character_id, opts \\ []) do
      url = "/videos/characters/{character_id}"
      url = String.replace(url, "{character_id}", to_string(character_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoCharacterResource",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
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
    Create a new video generation job by editing a source video or existing generated video.

    ## Parameters

    * `prompt` - **required** - `String.t()`  
      Text prompt that describes how to edit the source video.  
      Constraints: minLength: 1, maxLength: 32000

    * `video` - **required** - `any()`  
      Reference to the completed video to edit.
    """
    @spec create_video_edit(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    def create_video_edit(opts \\ []) do
      url = "/videos/edits"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Create an extension of a completed video.

    ## Parameters

    * `prompt` - **required** - `String.t()`  
      Updated text prompt that directs the extension generation.  
      Constraints: minLength: 1, maxLength: 32000

    * `seconds` - **required** - `any()`  
      Length of the newly generated extension segment in seconds (allowed values: 4, 8, 12, 16, 20).

    * `video` - **required** - `any()`  
      Reference to the completed video to extend.
    """
    @spec create_video_extend(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    def create_video_extend(opts \\ []) do
      url = "/videos/extensions"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Permanently delete a completed or failed video and its stored assets.

    ## Parameters

    * `:video_id` - **required** - `String.t()`  
      The identifier of the video to delete.
    """
    @spec delete_video(video_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedVideoResource.t()} | {:error, any()}
    def delete_video(video_id, opts \\ []) do
      url = "/videos/{video_id}"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/DeletedVideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

      ExOpenAI.Config.http_client().api_call(
        :delete,
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
    Fetch the latest metadata for a generated video.

    ## Parameters

    * `:video_id` - **required** - `String.t()`  
      The identifier of the video to retrieve.
    """
    @spec get_video(video_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    def get_video(video_id, opts \\ []) do
      url = "/videos/{video_id}"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
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
    Download the generated video bytes or a derived preview asset.

    Streams the rendered video content for the specified video job.

    ## Parameters

    * `:video_id` - **required** - `String.t()`  
      The identifier of the video whose media to download.

    ## Options

    * `:variant` - **optional** - `any()`  
      Which downloadable asset to return. Defaults to the MP4 video.
    """
    @spec retrieve_video_content(video_id :: String.t(), opts :: [variant: any()]) ::
            {:ok, map()} | {:error, any()}
    def retrieve_video_content(video_id, opts \\ []) do
      url = "/videos/{video_id}/content"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [:variant])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:variant])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:variant] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
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
    Create a remix of a completed video using a refreshed prompt.

    ## Parameters

    * `:video_id` - **required** - `String.t()`  
      The identifier of the completed video to remix.

    * `prompt` - **required** - `String.t()`  
      Updated text prompt that directs the remix generation.  
      Constraints: minLength: 1, maxLength: 32000
    """
    @spec create_video_remix(video_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    def create_video_remix(video_id, opts \\ []) do
      url = "/videos/{video_id}/remix"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
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
          ref: "#/components/schemas/VideoResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
