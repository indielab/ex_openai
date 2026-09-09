defmodule ExOpenAI.Components.ApplyPatchOperationParam do
  @moduledoc """
  One of the create_file, delete_file, or update_file operations supplied to the apply_patch tool.

  ## Type

  `ExOpenAI.Components.ApplyPatchCreateFileOperationParam.t() | ExOpenAI.Components.ApplyPatchDeleteFileOperationParam.t() | ExOpenAI.Components.ApplyPatchUpdateFileOperationParam.t()`
  """
  @type t() ::
          (ExOpenAI.Components.ApplyPatchCreateFileOperationParam.t()
           | ExOpenAI.Components.ApplyPatchDeleteFileOperationParam.t())
          | ExOpenAI.Components.ApplyPatchUpdateFileOperationParam.t()
  @type input() ::
          (ExOpenAI.Components.ApplyPatchCreateFileOperationParam.input()
           | ExOpenAI.Components.ApplyPatchDeleteFileOperationParam.input())
          | ExOpenAI.Components.ApplyPatchUpdateFileOperationParam.input()
end
