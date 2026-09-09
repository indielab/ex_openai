defmodule ExOpenAI.Components.VideoModel do
  @moduledoc """
  Module for representing the OpenAI schema VideoModel.

  ## Type

  `String.t() | :"sora-2" | :"sora-2-pro" | :"sora-2-2025-10-06" | :"sora-2-pro-2025-10-06" | :"sora-2-2025-12-08"`
  """
  @type t() ::
          String.t()
          | (((:"sora-2" | :"sora-2-pro") | :"sora-2-2025-10-06") | :"sora-2-pro-2025-10-06")
          | :"sora-2-2025-12-08"
  @type input() ::
          String.t()
          | ((((:"sora-2" | :"sora-2-pro") | :"sora-2-2025-10-06") | :"sora-2-pro-2025-10-06")
             | :"sora-2-2025-12-08")
          | String.t()
end
