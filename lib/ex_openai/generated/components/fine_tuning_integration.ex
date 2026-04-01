defmodule ExOpenAI.Components.FineTuningIntegration do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FineTuningIntegration.

  ## Fields

  * `:type` - **required** - `:wandb`  
    The type of the integration being enabled for the fine-tuning job  
    Allowed values: `"wandb"`

  * `:wandb` - **required** - `{:%{}, [], [{{:optional, [], [:entity]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:name]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:project]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:tags]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}`  
    The settings for your integration with Weights and Biases. This payload specifies the project that
  metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
  to your run, and set a default entity (team, username, etc) to be associated with your run.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          type: :wandb,
          wandb: %{
            optional(:entity) => String.t() | any(),
            optional(:name) => String.t() | any(),
            required(:project) => String.t(),
            optional(:tags) => list(String.t())
          }
        }
  defstruct [:type, :wandb]
end
