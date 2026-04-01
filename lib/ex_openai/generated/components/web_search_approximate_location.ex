defmodule ExOpenAI.Components.WebSearchApproximateLocation do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema WebSearchApproximateLocation.

  ## Type

  `{:%{}, [], [{{:optional, [], [:city]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:country]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:region]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:timezone]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:type]}, :approximate}]} | any()`
  """
  @type t() ::
          %{
            optional(:city) => String.t() | any(),
            optional(:country) => String.t() | any(),
            optional(:region) => String.t() | any(),
            optional(:timezone) => String.t() | any(),
            optional(:type) => :approximate
          }
          | any()
end
