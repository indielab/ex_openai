defmodule ExOpenAI.Components.ValidateGraderRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ValidateGraderRequest.

  ## Fields

  * `:grader` - **required** - `map()`  
    The grader used for the fine-tuning job.
  """
  @type t() :: %{__struct__: __MODULE__, grader: map()}
  defstruct [:grader]
end
