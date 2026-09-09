defmodule ExOpenAI.Components.BetaOutputTextContentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaOutputTextContentParam.

  ## Fields

  * `:annotations` - **optional** - `list( ExOpenAI.Components.BetaFileCitationParam.t() | ExOpenAI.Components.BetaUrlCitationParam.t() | ExOpenAI.Components.BetaContainerFileCitationParam.t() )`
    Citations associated with the text content.

  * `:text` - **required** - `String.t()`
    The text content.
    Constraints: maxLength: 10485760

  * `:type` - **required** - `:output_text`
    The content type. Always `output_text`.
    Allowed values: `"output_text"`
    Default: `"output_text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations:
            list(
              (ExOpenAI.Components.BetaFileCitationParam.t()
               | ExOpenAI.Components.BetaUrlCitationParam.t())
              | ExOpenAI.Components.BetaContainerFileCitationParam.t()
            )
            | nil,
          text: String.t(),
          type: :output_text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:annotations) =>
                list(
                  (ExOpenAI.Components.BetaFileCitationParam.input()
                   | ExOpenAI.Components.BetaUrlCitationParam.input())
                  | ExOpenAI.Components.BetaContainerFileCitationParam.input()
                ),
              required(:text) => String.t(),
              required(:type) => :output_text | String.t()
            }
  defstruct [:annotations, :text, :type]
end
