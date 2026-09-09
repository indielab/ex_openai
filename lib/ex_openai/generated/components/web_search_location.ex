defmodule ExOpenAI.Components.WebSearchLocation do
  use ExOpenAI.Jason

  @moduledoc """
  Approximate location parameters for the search.

  ## Fields

  * `:city` - **optional** - `String.t()`
    Free text input for the city of the user, e.g. `San Francisco`.

  * `:country` - **optional** - `String.t()`
    The two-letter
  [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user,
  e.g. `US`.

  * `:region` - **optional** - `String.t()`
    Free text input for the region of the user, e.g. `California`.

  * `:timezone` - **optional** - `String.t()`
    The [IANA timezone](https://timeapi.io/documentation/iana-timezones)
  of the user, e.g. `America/Los_Angeles`.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          city: String.t() | nil,
          country: String.t() | nil,
          region: String.t() | nil,
          timezone: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:city) => String.t(),
              optional(:country) => String.t(),
              optional(:region) => String.t(),
              optional(:timezone) => String.t()
            }
  defstruct [:city, :country, :region, :timezone]
end
