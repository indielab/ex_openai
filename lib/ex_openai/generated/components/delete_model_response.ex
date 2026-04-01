defmodule ExOpenAI.Components.DeleteModelResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteModelResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `String.t()`
  """
  @type t() :: %{__struct__: __MODULE__, deleted: boolean(), id: String.t(), object: String.t()}
  defstruct [:deleted, :id, :object]
end
