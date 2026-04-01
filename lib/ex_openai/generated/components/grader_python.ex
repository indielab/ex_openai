defmodule ExOpenAI.Components.GraderPython do
  use ExOpenAI.Jason

  @moduledoc """
  A PythonGrader object that runs a python script on the input.


  ## Fields

  * `:image_tag` - **optional** - `String.t()`  
    The image tag to use for the python script.

  * `:name` - **required** - `String.t()`  
    The name of the grader.

  * `:source` - **required** - `String.t()`  
    The source code of the python script.

  * `:type` - **required** - `:python`  
    The object type, which is always `python`.  
    Allowed values: `"python"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_tag: String.t() | nil,
          name: String.t(),
          source: String.t(),
          type: :python
        }
  defstruct [:image_tag, :name, :source, :type]
end
