defmodule ExOpenAI.Components.CustomToolChatCompletions do
  use ExOpenAI.Jason

  @moduledoc """
  A custom tool that processes input using a specified format.


  ## Fields

  * `:custom` - **required** - `%{ optional(:description) => String.t(), optional(:format) => %{required(:type) => :text} | %{ required(:grammar) => %{ required(:definition) => String.t(), required(:syntax) => :lark | :regex }, required(:type) => :grammar }, required(:name) => String.t() }`
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:custom) => %{
                optional(:description) => String.t(),
                optional(:format) =>
                  %{required(:type) => :text | String.t()}
                  | %{
                      required(:grammar) => %{
                        required(:definition) => String.t(),
                        required(:syntax) => (:lark | :regex) | String.t()
                      },
                      required(:type) => :grammar | String.t()
                    },
                required(:name) => String.t()
              },
              required(:type) => :custom | String.t()
            }
  defstruct [:custom, :type]
end
