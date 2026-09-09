defmodule ExOpenAI.Components.EvalGraderStringCheck do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EvalGraderStringCheck.

  ## Fields

  * `:input` - **required** - `String.t()`
    The input text. This may include template strings.

  * `:name` - **required** - `String.t()`
    The name of the grader.

  * `:operation` - **required** - `:eq | :ne | :like | :ilike`
    The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
    Allowed values: `"eq"`, `"ne"`, `"like"`, `"ilike"`

  * `:reference` - **required** - `String.t()`
    The reference text. This may include template strings.

  * `:type` - **required** - `:string_check`
    The object type, which is always `string_check`.
    Allowed values: `"string_check"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: String.t(),
          name: String.t(),
          operation: ((:eq | :ne) | :like) | :ilike,
          reference: String.t(),
          type: :string_check
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) => String.t(),
              required(:name) => String.t(),
              required(:operation) => (((:eq | :ne) | :like) | :ilike) | String.t(),
              required(:reference) => String.t(),
              required(:type) => :string_check | String.t()
            }
  defstruct [:input, :name, :operation, :reference, :type]
end
