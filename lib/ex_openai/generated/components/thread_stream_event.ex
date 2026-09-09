defmodule ExOpenAI.Components.ThreadStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema ThreadStreamEvent.

  ## Type

  `%{ required(:data) => ExOpenAI.Components.ThreadObject.t(), optional(:enabled) => boolean(), required(:event) => :"thread.created" }`
  """
  @type t() :: %{
          required(:data) => ExOpenAI.Components.ThreadObject.t(),
          optional(:enabled) => boolean(),
          required(:event) => :"thread.created"
        }
  @type input() :: %{
          required(:data) => ExOpenAI.Components.ThreadObject.input(),
          optional(:enabled) => boolean(),
          required(:event) => :"thread.created" | String.t()
        }
end
