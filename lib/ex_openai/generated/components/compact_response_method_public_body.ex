defmodule ExOpenAI.Components.CompactResponseMethodPublicBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CompactResponseMethodPublicBody.

  ## Fields

  * `:input` - **optional** - `String.t() | [ExOpenAI.Components.InputItem.t()] | any()`

  * `:instructions` - **optional** - `String.t() | any()`

  * `:model` - **required** - `ExOpenAI.Components.ModelIdsCompaction.t()`

  * `:previous_response_id` - **optional** - `String.t() | any()`

  * `:prompt_cache_key` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: ((String.t() | list(ExOpenAI.Components.InputItem.t())) | any()) | nil,
          instructions: (String.t() | any()) | nil,
          model: ExOpenAI.Components.ModelIdsCompaction.t(),
          previous_response_id: (String.t() | any()) | nil,
          prompt_cache_key: (String.t() | any()) | nil
        }
  defstruct [:input, :instructions, :model, :previous_response_id, :prompt_cache_key]
end
