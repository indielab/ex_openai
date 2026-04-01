defmodule ExOpenAI.Components.CreateImageVariationRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateImageVariationRequest.

  ## Fields

  * `:image` - **required** - `binary()`  
    The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.  
    Format: `binary`

  * `:model` - **optional** - `String.t() | :"dall-e-2" | nil`  
    The model to use for image generation. Only `dall-e-2` is supported at this time.  
    Default: `"dall-e-2"`

  * `:n` - **optional** - `integer() | nil`  
    The number of images to generate. Must be between 1 and 10.  
    Default: `1`  
    Constraints: minimum: 1, maximum: 10

  * `:response_format` - **optional** - `:url | :b64_json | nil`  
    The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.  
    Allowed values: `"url"`, `"b64_json"`  
    Default: `"url"`

  * `:size` - **optional** - `:"256x256" | :"512x512" | :"1024x1024" | nil`  
    The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.  
    Allowed values: `"256x256"`, `"512x512"`, `"1024x1024"`  
    Default: `"1024x1024"`

  * `:user` - **optional** - `String.t()`  
    A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image: binary(),
          model: (String.t() | :"dall-e-2") | nil,
          n: integer() | nil,
          response_format: (:url | :b64_json) | nil,
          size: ((:"256x256" | :"512x512") | :"1024x1024") | nil,
          user: String.t() | nil
        }
  defstruct [:image, :model, :n, :response_format, :size, :user]
end
