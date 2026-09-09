defmodule ExOpenAI.Components.VideoSize do
  @moduledoc """
  Module for representing the OpenAI schema VideoSize.

  ## Type

  `:"720x1280" | :"1280x720" | :"1024x1792" | :"1792x1024"`

  ## Allowed Values

  `"720x1280"`, `"1280x720"`, `"1024x1792"`, `"1792x1024"`
  """
  @type t() :: ((:"720x1280" | :"1280x720") | :"1024x1792") | :"1792x1024"
  @type input() :: (((:"720x1280" | :"1280x720") | :"1024x1792") | :"1792x1024") | String.t()
end
