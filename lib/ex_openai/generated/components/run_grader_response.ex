defmodule ExOpenAI.Components.RunGraderResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunGraderResponse.

  ## Fields

  * `:metadata` - **required** - `{:%{}, [], [{{:required, [], [:errors]}, {:%{}, [], [{{:required, [], [:formula_parse_error]}, {:boolean, [], []}}, {{:required, [], [:invalid_variable_error]}, {:boolean, [], []}}, {{:required, [], [:model_grader_parse_error]}, {:boolean, [], []}}, {{:required, [], [:model_grader_refusal_error]}, {:boolean, [], []}}, {{:required, [], [:model_grader_server_error]}, {:boolean, [], []}}, {{:required, [], [:model_grader_server_error_details]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:other_error]}, {:boolean, [], []}}, {{:required, [], [:python_grader_runtime_error]}, {:boolean, [], []}}, {{:required, [], [:python_grader_runtime_error_details]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:python_grader_server_error]}, {:boolean, [], []}}, {{:required, [], [:python_grader_server_error_type]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:sample_parse_error]}, {:boolean, [], []}}, {{:required, [], [:truncated_observation_error]}, {:boolean, [], []}}, {{:required, [], [:unresponsive_reward_error]}, {:boolean, [], []}}]}}, {{:required, [], [:execution_time]}, {:number, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:sampled_model_name]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:scores]}, {:map, [], []}}, {{:required, [], [:token_usage]}, {:|, [], [{:integer, [], []}, {:any, [], []}]}}, {{:required, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:model_grader_token_usage_per_model` - **required** - `map()`

  * `:reward` - **required** - `number()`

  * `:sub_rewards` - **required** - `map()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: %{
            required(:errors) => %{
              required(:formula_parse_error) => boolean(),
              required(:invalid_variable_error) => boolean(),
              required(:model_grader_parse_error) => boolean(),
              required(:model_grader_refusal_error) => boolean(),
              required(:model_grader_server_error) => boolean(),
              required(:model_grader_server_error_details) => String.t() | any(),
              required(:other_error) => boolean(),
              required(:python_grader_runtime_error) => boolean(),
              required(:python_grader_runtime_error_details) => String.t() | any(),
              required(:python_grader_server_error) => boolean(),
              required(:python_grader_server_error_type) => String.t() | any(),
              required(:sample_parse_error) => boolean(),
              required(:truncated_observation_error) => boolean(),
              required(:unresponsive_reward_error) => boolean()
            },
            required(:execution_time) => number(),
            required(:name) => String.t(),
            required(:sampled_model_name) => String.t() | any(),
            required(:scores) => map(),
            required(:token_usage) => integer() | any(),
            required(:type) => String.t()
          },
          model_grader_token_usage_per_model: map(),
          reward: number(),
          sub_rewards: map()
        }
  defstruct [:metadata, :model_grader_token_usage_per_model, :reward, :sub_rewards]
end
