defmodule ExOpenAI.Components.ChatSessionChatkitConfiguration do
  use ExOpenAI.Jason

  @moduledoc """
  ChatKit configuration for the session.

  ## Fields

  * `:automatic_thread_titling` - **required** - `ExOpenAI.Components.ChatSessionAutomaticThreadTitling.t()`
    Automatic thread titling preferences.

  * `:file_upload` - **required** - `ExOpenAI.Components.ChatSessionFileUpload.t()`
    Upload settings for the session.

  * `:history` - **required** - `ExOpenAI.Components.ChatSessionHistory.t()`
    History retention configuration.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          automatic_thread_titling: ExOpenAI.Components.ChatSessionAutomaticThreadTitling.t(),
          file_upload: ExOpenAI.Components.ChatSessionFileUpload.t(),
          history: ExOpenAI.Components.ChatSessionHistory.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:automatic_thread_titling) =>
                ExOpenAI.Components.ChatSessionAutomaticThreadTitling.input(),
              required(:file_upload) => ExOpenAI.Components.ChatSessionFileUpload.input(),
              required(:history) => ExOpenAI.Components.ChatSessionHistory.input()
            }
  defstruct [:automatic_thread_titling, :file_upload, :history]
end
