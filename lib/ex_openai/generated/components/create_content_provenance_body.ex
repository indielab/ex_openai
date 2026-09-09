defmodule ExOpenAI.Components.CreateContentProvenanceBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateContentProvenanceBody.

  ## Fields

  * `:file` - **required** - `binary()`
    The image or audio file to check for supported OpenAI provenance signals.
    Format: `binary`
  """
  @type t() :: %{__struct__: __MODULE__, file: binary()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:file) => binary() | {String.t(), binary()}}
  defstruct [:file]
end
