defmodule ExOpenAI.Components.CreateTranslationResponseJson do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateTranslationResponseJson.

  ## Fields

  * `:text` - **required** - `String.t()`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:text) => String.t()}
  defstruct [:text]
end
