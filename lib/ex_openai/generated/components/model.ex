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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created) => integer(),
              required(:id) => String.t(),
              required(:object) => :model | String.t(),
              required(:owned_by) => String.t()
            }
  defstruct [:created, :id, :object, :owned_by]
end
