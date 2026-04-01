defmodule ExOpenAI.Components.ValidateGraderResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ValidateGraderResponse.

  ## Fields

  * `:grader` - **optional** - `map()`  
    The grader used for the fine-tuning job.
  """
  @type t() :: %{__struct__: __MODULE__, grader: map() | nil}
  defstruct [:grader]
end
