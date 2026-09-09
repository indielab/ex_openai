defmodule ExOpenAI.Videos do
  @moduledoc """
  Functions for the OpenAI videos API.
  """
  (
    @doc """
    List recently generated videos for the current project.

    ## Options

    * `:limit` - **optional** - `integer()`
      Number of items to retrieve
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `ExOpenAI.Components.OrderEnum.input()`
      Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.

    * `:after` - **optional** - `String.t()`
      Identifier for the last item from the previous pagination request
    """
    (
      @type list_videos_opt() ::
              (({:limit, integer()} | {:order, ExOpenAI.Components.OrderEnum.input()})
               | {:after, String.t()})
              | ExOpenAI.request_option()
      @spec list_videos(opts :: [list_videos_opt()]) ::
              {:ok, ExOpenAI.Components.VideoListResource.t()} | {:error, any()}
    )

    def list_videos(opts \\ []) do
      url = "/videos"
      query_params = Keyword.take(opts, [:limit, :order, :after])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoListResource"}
        )
      end

      nil

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

    ## Options

    * `input_reference` - **optional** - `binary() | {String.t(), binary()} | :"Elixir.ExOpenAI.Components.ImageRefParam-2".input()`

    * `model` - **optional** - `ExOpenAI.Components.VideoModel.input()`
      The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.

    * `prompt` - **optional** - `String.t()`
      Text prompt that describes the video to generate.
      Constraints: minLength: 1, maxLength: 32000

    * `seconds` - **optional** - `ExOpenAI.Components.VideoSeconds.input()`
      Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.

    * `size` - **optional** - `ExOpenAI.Components.VideoSize.input()`
      Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
    """
    (
      @type create_video_opt() ::
              (((({:input_reference,
                   (binary() | {String.t(), binary()})
                   | :"Elixir.ExOpenAI.Components.ImageRefParam-2".input()}
                  | {:model, ExOpenAI.Components.VideoModel.input()})
                 | {:prompt, String.t()})
                | {:seconds, ExOpenAI.Components.VideoSeconds.input()})
               | {:size, ExOpenAI.Components.VideoSize.input()})
              | ExOpenAI.request_option()
      @spec create_video(opts :: [create_video_opt()]) ::
              {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    )

    def create_video(opts \\ []) do
      url = "/videos"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:input_reference, :model, :prompt, :seconds, :size])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:input_reference, :model, :prompt, :seconds, :size] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:input_reference], %{})

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

    ## Options

    * `name` - **optional** - `String.t()`
      Display name for this API character.
      Constraints: minLength: 1, maxLength: 80

    * `video` - **optional** - `binary() | {String.t(), binary()}`
      Video file used to create a character.
      Format: `binary`
    """
    (
      @type create_video_character_opt() ::
              ({:name, String.t()} | {:video, binary() | {String.t(), binary()}})
              | ExOpenAI.request_option()
      @spec create_video_character(opts :: [create_video_character_opt()]) ::
              {:ok, ExOpenAI.Components.VideoCharacterResource.t()} | {:error, any()}
    )

    def create_video_character(opts \\ []) do
      url = "/videos/characters"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:name, :video])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name, :video] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoCharacterResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:video], %{})

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
    (
      @type get_video_character_opt() :: ExOpenAI.request_option()
      @spec get_video_character(character_id :: String.t(), opts :: [get_video_character_opt()]) ::
              {:ok, ExOpenAI.Components.VideoCharacterResource.t()} | {:error, any()}
    )

    def get_video_character(character_id, opts \\ []) do
      url = "/videos/characters/{character_id}"
      url = String.replace(url, "{character_id}", to_string(character_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoCharacterResource"}
        )
      end

      nil

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

    ## Options

    * `prompt` - **optional** - `String.t()`
      Text prompt that describes how to edit the source video.
      Constraints: minLength: 1, maxLength: 32000

    * `video` - **optional** - `binary() | {String.t(), binary()} | ExOpenAI.Components.VideoReferenceInputParam.input()`
    """
    (
      @type create_video_edit_opt() ::
              ({:prompt, String.t()}
               | {:video,
                  (binary() | {String.t(), binary()})
                  | ExOpenAI.Components.VideoReferenceInputParam.input()})
              | ExOpenAI.request_option()
      @spec create_video_edit(opts :: [create_video_edit_opt()]) ::
              {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    )

    def create_video_edit(opts \\ []) do
      url = "/videos/edits"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:prompt, :video])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:prompt, :video] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:video], %{})

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

    ## Options

    * `prompt` - **optional** - `String.t()`
      Updated text prompt that directs the extension generation.
      Constraints: minLength: 1, maxLength: 32000

    * `seconds` - **optional** - `ExOpenAI.Components.VideoSeconds.input()`
      Length of the newly generated extension segment in seconds (allowed values: 4, 8, 12, 16, 20).

    * `video` - **optional** - `ExOpenAI.Components.VideoReferenceInputParam.input() | binary() | {String.t(), binary()}`
    """
    (
      @type create_video_extend_opt() ::
              (({:prompt, String.t()} | {:seconds, ExOpenAI.Components.VideoSeconds.input()})
               | {:video,
                  ExOpenAI.Components.VideoReferenceInputParam.input()
                  | binary()
                  | {String.t(), binary()}})
              | ExOpenAI.request_option()
      @spec create_video_extend(opts :: [create_video_extend_opt()]) ::
              {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    )

    def create_video_extend(opts \\ []) do
      url = "/videos/extensions"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:prompt, :seconds, :video])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:prompt, :seconds, :video] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:video], %{})

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
    (
      @type delete_video_opt() :: ExOpenAI.request_option()
      @spec delete_video(video_id :: String.t(), opts :: [delete_video_opt()]) ::
              {:ok, ExOpenAI.Components.DeletedVideoResource.t()} | {:error, any()}
    )

    def delete_video(video_id, opts \\ []) do
      url = "/videos/{video_id}"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeletedVideoResource"}
        )
      end

      nil

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
    (
      @type get_video_opt() :: ExOpenAI.request_option()
      @spec get_video(video_id :: String.t(), opts :: [get_video_opt()]) ::
              {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    )

    def get_video(video_id, opts \\ []) do
      url = "/videos/{video_id}"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoResource"}
        )
      end

      nil

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

    * `:variant` - **optional** - `ExOpenAI.Components.VideoContentVariant.input()`
      Which downloadable asset to return. Defaults to the MP4 video.
    """
    (
      @type retrieve_video_content_opt() ::
              {:variant, ExOpenAI.Components.VideoContentVariant.input()}
              | ExOpenAI.request_option()
      @spec retrieve_video_content(video_id :: String.t(), opts :: [retrieve_video_content_opt()]) ::
              {:ok, String.t()} | {:error, any()}
    )

    def retrieve_video_content(video_id, opts \\ []) do
      url = "/videos/{video_id}/content"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [:variant])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:variant] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{type: "string"}
        )
      end

      nil

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

    ## Options

    * `prompt` - **optional** - `String.t()`
      Updated text prompt that directs the remix generation.
      Constraints: minLength: 1, maxLength: 32000
    """
    (
      @type create_video_remix_opt() :: {:prompt, String.t()} | ExOpenAI.request_option()
      @spec create_video_remix(video_id :: String.t(), opts :: [create_video_remix_opt()]) ::
              {:ok, ExOpenAI.Components.VideoResource.t()} | {:error, any()}
    )

    def create_video_remix(video_id, opts \\ []) do
      url = "/videos/{video_id}/remix"
      url = String.replace(url, "{video_id}", to_string(video_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:prompt])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:prompt] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VideoResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [], %{})

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
