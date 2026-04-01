defmodule :"Elixir.ExOpenAI.Components.ImageRefParam-2" do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ImageRefParam-2.

  ## Fields

  * `:file_id` - **optional** - `String.t()`

  * `:image_url` - **optional** - `String.t()`  
    A fully qualified URL or base64-encoded data URL.  
    Constraints: maxLength: 20971520
  """
  @type t() :: %{__struct__: __MODULE__, file_id: String.t() | nil, image_url: String.t() | nil}
  defstruct [:file_id, :image_url]
end
