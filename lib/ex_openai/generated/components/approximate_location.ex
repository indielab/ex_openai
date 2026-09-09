defmodule ExOpenAI.Components.ApproximateLocation do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ApproximateLocation.

  ## Fields

  * `:city` - **optional** - `String.t() | nil`

  * `:country` - **optional** - `String.t() | nil`

  * `:region` - **optional** - `String.t() | nil`

  * `:timezone` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:approximate`
    The type of location approximation. Always `approximate`.
    Allowed values: `"approximate"`
    Default: `"approximate"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          city: (String.t() | nil) | nil,
          country: (String.t() | nil) | nil,
          region: (String.t() | nil) | nil,
          timezone: (String.t() | nil) | nil,
          type: :approximate
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:city) => String.t() | nil,
              optional(:country) => String.t() | nil,
              optional(:region) => String.t() | nil,
              optional(:timezone) => String.t() | nil,
              required(:type) => :approximate | String.t()
            }
  defstruct [:city, :country, :region, :timezone, :type]
end
