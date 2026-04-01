defmodule ExOpenAI.Components.Model do
  use ExOpenAI.Jason

  @moduledoc """
  Describes an OpenAI model offering that can be used with the API.

  ## Type

  `any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created: integer(),
          id: String.t(),
          object: :model,
          owned_by: String.t()
        }
  defstruct [:created, :id, :object, :owned_by]
end
