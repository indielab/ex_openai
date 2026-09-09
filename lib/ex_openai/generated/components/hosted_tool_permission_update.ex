defmodule ExOpenAI.Components.HostedToolPermissionUpdate do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema HostedToolPermissionUpdate.

  ## Fields

  * `:enabled` - **required** - `boolean()`
    Whether to enable the hosted tool for the project.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:enabled) => boolean()}
  defstruct [:enabled]
end
