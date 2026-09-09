defmodule ExOpenAI.Components.TruncationObject do
  use ExOpenAI.Jason

  @moduledoc """
  Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.

  ## Fields

  * `:last_messages` - **optional** - `integer() | nil`

  * `:type` - **required** - `:auto | :last_messages`
    The truncation strategy to use for the thread. The default is `auto`. If set to `last_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max_prompt_tokens`.
    Allowed values: `"auto"`, `"last_messages"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          last_messages: (integer() | nil) | nil,
          type: :auto | :last_messages
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:last_messages) => integer() | nil,
              required(:type) => (:auto | :last_messages) | String.t()
            }
  defstruct [:last_messages, :type]
end
