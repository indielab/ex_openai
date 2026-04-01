defmodule ExOpenAI.Components.ChatkitConfigurationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Optional per-session configuration settings for ChatKit behavior.

  ## Fields

  * `:automatic_thread_titling` - **optional** - `ExOpenAI.Components.AutomaticThreadTitlingParam.t()`  
    Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.

  * `:file_upload` - **optional** - `ExOpenAI.Components.FileUploadParam.t()`  
    Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max_files 10, max_file_size 512 MB).

  * `:history` - **optional** - `ExOpenAI.Components.HistoryParam.t()`  
    Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent_threads (null).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          automatic_thread_titling: ExOpenAI.Components.AutomaticThreadTitlingParam.t() | nil,
          file_upload: ExOpenAI.Components.FileUploadParam.t() | nil,
          history: ExOpenAI.Components.HistoryParam.t() | nil
        }
  defstruct [:automatic_thread_titling, :file_upload, :history]
end
