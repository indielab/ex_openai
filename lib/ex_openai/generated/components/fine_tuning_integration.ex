defmodule ExOpenAI.Components.FineTuningIntegration do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FineTuningIntegration.

  ## Fields

  * `:type` - **required** - `:wandb`
    The type of the integration being enabled for the fine-tuning job
    Allowed values: `"wandb"`

  * `:wandb` - **required** - `%{ optional(:entity) => String.t() | nil, optional(:name) => String.t() | nil, required(:project) => String.t(), optional(:tags) => list(String.t()) }`
    The settings for your integration with Weights and Biases. This payload specifies the project that
  metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
  to your run, and set a default entity (team, username, etc) to be associated with your run.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          type: :wandb,
          wandb: %{
            optional(:entity) => String.t() | nil,
            optional(:name) => String.t() | nil,
            required(:project) => String.t(),
            optional(:tags) => list(String.t())
          }
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:type) => :wandb | String.t(),
              required(:wandb) => %{
                optional(:entity) => String.t() | nil,
                optional(:name) => String.t() | nil,
                required(:project) => String.t(),
                optional(:tags) => list(String.t())
              }
            }
  defstruct [:type, :wandb]
end
