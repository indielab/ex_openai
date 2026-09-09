defmodule ExOpenAI.Components.EvalGraderPython do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalGraderPython.

  ## Fields

  * `:image_tag` - **optional** - `String.t()`
    The image tag to use for the python script.

  * `:name` - **required** - `String.t()`
    The name of the grader.

  * `:pass_threshold` - **optional** - `number()`
    The threshold for the score.

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
          pass_threshold: number() | nil,
          source: String.t(),
          type: :python
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:image_tag) => String.t(),
              required(:name) => String.t(),
              optional(:pass_threshold) => number(),
              required(:source) => String.t(),
              required(:type) => :python | String.t()
            }
  defstruct [:image_tag, :name, :pass_threshold, :source, :type]
end
