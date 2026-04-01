defmodule ExOpenAI.Components.ThreadStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ThreadStreamEvent.

  ## Type

  `{:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.ThreadObject, :t]}, [], []}}, {{:optional, [], [:enabled]}, {:boolean, [], []}}, {{:required, [], [:event]}, :"thread.created"}]}`
  """
  @type t() :: %{
          required(:data) => ExOpenAI.Components.ThreadObject.t(),
          optional(:enabled) => boolean(),
          required(:event) => :"thread.created"
        }
end
