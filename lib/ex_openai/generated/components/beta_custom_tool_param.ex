defmodule ExOpenAI.Components.BetaCustomToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A custom tool that processes input using a specified format. Learn more about   [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil`

  * `:defer_loading` - **optional** - `boolean()`
    Whether this tool should be deferred and discovered via tool search.

  * `:description` - **optional** - `String.t()`
    Optional description of the custom tool, used to provide more context.

  * `:format` - **optional** - `ExOpenAI.Components.BetaCustomTextFormatParam.t() | ExOpenAI.Components.BetaCustomGrammarFormatParam.t()`
    The input format for the custom tool. Default is unconstrained text.

  * `:name` - **required** - `String.t()`
    The name of the custom tool, used to identify it in tool calls.

  * `:type` - **required** - `:custom`
    The type of the custom tool. Always `custom`.
    Allowed values: `"custom"`
    Default: `"custom"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers:
            (list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil) | nil,
          defer_loading: boolean() | nil,
          description: String.t() | nil,
          format:
            (ExOpenAI.Components.BetaCustomTextFormatParam.t()
             | ExOpenAI.Components.BetaCustomGrammarFormatParam.t())
            | nil,
          name: String.t(),
          type: :custom
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.BetaCallableToolAllowedCaller.input()) | nil,
              optional(:defer_loading) => boolean(),
              optional(:description) => String.t(),
              optional(:format) =>
                ExOpenAI.Components.BetaCustomTextFormatParam.input()
                | ExOpenAI.Components.BetaCustomGrammarFormatParam.input(),
              required(:name) => String.t(),
              required(:type) => :custom | String.t()
            }
  defstruct [:allowed_callers, :defer_loading, :description, :format, :name, :type]
end
