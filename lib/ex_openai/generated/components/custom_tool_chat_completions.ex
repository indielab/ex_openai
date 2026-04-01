defmodule ExOpenAI.Components.CustomToolChatCompletions do
  use ExOpenAI.Jason

  @moduledoc """
  A custom tool that processes input using a specified format.


  ## Fields

  * `:custom` - **required** - `{:%{}, [], [{{:optional, [], [:description]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:format]}, {:|, [], [{:%{}, [], [{{:required, [], [:type]}, :text}]}, {:%{}, [], [{{:required, [], [:grammar]}, {:%{}, [], [{{:required, [], [:definition]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:syntax]}, {:|, [], [:lark, :regex]}}]}}, {{:required, [], [:type]}, :grammar}]}]}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Properties of the custom tool.

  * `:type` - **required** - `:custom`  
    The type of the custom tool. Always `custom`.  
    Allowed values: `"custom"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          custom: %{
            optional(:description) => String.t(),
            optional(:format) =>
              %{required(:type) => :text}
              | %{
                  required(:grammar) => %{
                    required(:definition) => String.t(),
                    required(:syntax) => :lark | :regex
                  },
                  required(:type) => :grammar
                },
            required(:name) => String.t()
          },
          type: :custom
        }
  defstruct [:custom, :type]
end
