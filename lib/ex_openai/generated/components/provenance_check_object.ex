defmodule ExOpenAI.Components.ProvenanceCheckObject do
  @moduledoc """
  Module for representing the OpenAI schema ProvenanceCheckObject.

  ## Type

  `:content_provenance_check`

  ## Allowed Values

  `"content_provenance_check"`
  """
  @type t() :: :content_provenance_check
  @type input() :: :content_provenance_check | String.t()
end
