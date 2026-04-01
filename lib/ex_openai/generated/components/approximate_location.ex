defmodule ExOpenAI.Components.ApproximateLocation do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ApproximateLocation.

  ## Fields

  * `:city` - **optional** - `String.t() | any()`

  * `:country` - **optional** - `String.t() | any()`

  * `:region` - **optional** - `String.t() | any()`

  * `:timezone` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:approximate`  
    The type of location approximation. Always `approximate`.  
    Allowed values: `"approximate"`  
    Default: `"approximate"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          city: (String.t() | any()) | nil,
          country: (String.t() | any()) | nil,
          region: (String.t() | any()) | nil,
          timezone: (String.t() | any()) | nil,
          type: :approximate
        }
  defstruct [:city, :country, :region, :timezone, :type]
end
