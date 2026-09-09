defmodule ExOpenAI.Components.BetaApplyPatchOperationParam do
  @moduledoc """
  One of the create_file, delete_file, or update_file operations supplied to the apply_patch tool.

  ## Type

  `ExOpenAI.Components.BetaApplyPatchCreateFileOperationParam.t() | ExOpenAI.Components.BetaApplyPatchDeleteFileOperationParam.t() | ExOpenAI.Components.BetaApplyPatchUpdateFileOperationParam.t()`
  """
  @type t() ::
          (ExOpenAI.Components.BetaApplyPatchCreateFileOperationParam.t()
           | ExOpenAI.Components.BetaApplyPatchDeleteFileOperationParam.t())
          | ExOpenAI.Components.BetaApplyPatchUpdateFileOperationParam.t()
  @type input() ::
          (ExOpenAI.Components.BetaApplyPatchCreateFileOperationParam.input()
           | ExOpenAI.Components.BetaApplyPatchDeleteFileOperationParam.input())
          | ExOpenAI.Components.BetaApplyPatchUpdateFileOperationParam.input()
end
