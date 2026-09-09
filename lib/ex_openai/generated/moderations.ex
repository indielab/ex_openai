defmodule ExOpenAI.Moderations do
  @moduledoc """
  Functions for the OpenAI moderations API.
  """
  (
    @doc """
    Classifies if text and/or image inputs are potentially harmful. Learn
    more in the [moderation guide](https://platform.openai.com/docs/guides/moderation).


    ## Parameters

    * `input` - **required** - `String.t() | list(String.t()) | list( %{ required(:image_url) => %{required(:url) => String.t()}, required(:type) => :image_url | String.t() } | %{required(:text) => String.t(), required(:type) => :text | String.t()} )`
      Input (or inputs) to classify. Can be a single string, an array of strings, or
    an array of multi-modal input objects similar to other models.

    ## Options

    * `model` - **optional** - `String.t() | :"omni-moderation-latest" | :"omni-moderation-2024-09-26" | :"text-moderation-latest" | :"text-moderation-stable" | String.t()`
      The content moderation model you would like to use. Learn more in
    [the moderation guide](https://platform.openai.com/docs/guides/moderation), and learn about
    available models [here](https://platform.openai.com/docs/models#moderation).
      Default: `"omni-moderation-latest"`
      Example: `"omni-moderation-2024-09-26"`
    """
    (
      @type create_moderation_opt() ::
              {:model,
               String.t()
               | (((:"omni-moderation-latest" | :"omni-moderation-2024-09-26")
                   | :"text-moderation-latest")
                  | :"text-moderation-stable")
               | String.t()}
              | ExOpenAI.request_option()
      @spec create_moderation(
              input ::
                (String.t() | list(String.t()))
                | list(
                    %{
                      required(:image_url) => %{required(:url) => String.t()},
                      required(:type) => :image_url | String.t()
                    }
                    | %{required(:text) => String.t(), required(:type) => :text | String.t()}
                  ),
              opts :: [create_moderation_opt()]
            ) :: {:ok, ExOpenAI.Components.CreateModerationResponse.t()} | {:error, any()}
    )

    def create_moderation(input, opts \\ []) do
      url = "/moderations"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [input: input]
      optional_body_params = Keyword.take(opts, [:model])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:model] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/CreateModerationResponse"
          }
        )
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
end
