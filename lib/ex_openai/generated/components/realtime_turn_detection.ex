defmodule ExOpenAI.Components.RealtimeTurnDetection do
  @moduledoc """
  Module for representing the OpenAI schema RealtimeTurnDetection.

  ## Type

  `%{ optional(:create_response) => boolean(), optional(:idle_timeout_ms) => integer() | nil, optional(:interrupt_response) => boolean(), optional(:prefix_padding_ms) => integer(), optional(:silence_duration_ms) => integer(), optional(:threshold) => number(), required(:type) => String.t() } | %{ optional(:create_response) => boolean(), optional(:eagerness) => :low | :medium | :high | :auto, optional(:interrupt_response) => boolean(), required(:type) => String.t() } | nil`
  """
  @type t() ::
          (%{
             optional(:create_response) => boolean(),
             optional(:idle_timeout_ms) => integer() | nil,
             optional(:interrupt_response) => boolean(),
             optional(:prefix_padding_ms) => integer(),
             optional(:silence_duration_ms) => integer(),
             optional(:threshold) => number(),
             required(:type) => String.t()
           }
           | %{
               optional(:create_response) => boolean(),
               optional(:eagerness) => ((:low | :medium) | :high) | :auto,
               optional(:interrupt_response) => boolean(),
               required(:type) => String.t()
             })
          | nil
  @type input() ::
          (%{
             optional(:create_response) => boolean(),
             optional(:idle_timeout_ms) => integer() | nil,
             optional(:interrupt_response) => boolean(),
             optional(:prefix_padding_ms) => integer(),
             optional(:silence_duration_ms) => integer(),
             optional(:threshold) => number(),
             required(:type) => String.t()
           }
           | %{
               optional(:create_response) => boolean(),
               optional(:eagerness) => (((:low | :medium) | :high) | :auto) | String.t(),
               optional(:interrupt_response) => boolean(),
               required(:type) => String.t()
             })
          | nil
end
