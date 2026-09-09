defmodule ExOpenAI.Components.BetaWebSearchApproximateLocation do
  @moduledoc """
  Module for representing the OpenAI schema BetaWebSearchApproximateLocation.

  ## Type

  `%{ optional(:city) => String.t() | nil, optional(:country) => String.t() | nil, optional(:region) => String.t() | nil, optional(:timezone) => String.t() | nil, optional(:type) => :approximate } | nil`
  """
  @type t() ::
          %{
            optional(:city) => String.t() | nil,
            optional(:country) => String.t() | nil,
            optional(:region) => String.t() | nil,
            optional(:timezone) => String.t() | nil,
            optional(:type) => :approximate
          }
          | nil
  @type input() ::
          %{
            optional(:city) => String.t() | nil,
            optional(:country) => String.t() | nil,
            optional(:region) => String.t() | nil,
            optional(:timezone) => String.t() | nil,
            optional(:type) => :approximate | String.t()
          }
          | nil
end
