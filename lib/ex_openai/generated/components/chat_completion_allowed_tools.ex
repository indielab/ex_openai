defmodule ExOpenAI.Components.ChatCompletionAllowedTools do
  use ExOpenAI.Jason

  @moduledoc """
  Constrains the tools available to the model to a pre-defined set.


  ## Fields

  * `:mode` - **required** - `:auto | :required`
    Constrains the tools available to the model to a pre-defined set.

  `auto` allows the model to pick from among the allowed tools and generate a
  message.

  `required` requires the model to call one or more of the allowed tools.
    Allowed values: `"auto"`, `"required"`

  * `:tools` - **required** - `list(map())`
    A list of tool definitions that the model should be allowed to call.

  For the Chat Completions API, the list of tool definitions might look like:
  ```json
  [
    { "type": "function", "function": { "name": "get_weather" } },
    { "type": "function", "function": { "name": "get_time" } }
  ]
  ```
  """
  @type t() :: %{__struct__: __MODULE__, mode: :auto | :required, tools: list(map())}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:mode) => (:auto | :required) | String.t(),
              required(:tools) => list(map())
            }
  defstruct [:mode, :tools]
end
