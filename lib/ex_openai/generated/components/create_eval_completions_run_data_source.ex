defmodule ExOpenAI.Components.CreateEvalCompletionsRunDataSource do
  use ExOpenAI.Jason

  @moduledoc """
  A CompletionsRunDataSource object describing a model sampling configuration.


  ## Fields

  * `:input_messages` - **optional** - `%{ required(:template) => list(ExOpenAI.Components.EasyInputMessage.t() | ExOpenAI.Components.EvalItem.t()), required(:type) => :template } | %{required(:item_reference) => String.t(), required(:type) => :item_reference}`
    Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input_trajectory`), or a template with variable references to the `item` namespace.

  * `:model` - **optional** - `String.t()`
    The name of the model to use for generating completions (e.g. "o3-mini").

  * `:sampling_params` - **optional** - `%{ optional(:max_completion_tokens) => integer(), optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.t(), optional(:response_format) => ExOpenAI.Components.ResponseFormatText.t() | ExOpenAI.Components.ResponseFormatJsonSchema.t() | ExOpenAI.Components.ResponseFormatJsonObject.t(), optional(:seed) => integer(), optional(:temperature) => number(), optional(:tools) => list(ExOpenAI.Components.ChatCompletionTool.t()), optional(:top_p) => number() }`

  * `:source` - **required** - `ExOpenAI.Components.EvalJsonlFileContentSource.t() | ExOpenAI.Components.EvalJsonlFileIdSource.t() | ExOpenAI.Components.EvalStoredCompletionsSource.t()`
    Determines what populates the `item` namespace in this run's data source.

  * `:type` - **required** - `:completions`
    The type of run data source. Always `completions`.
    Allowed values: `"completions"`
    Default: `"completions"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_messages:
            (%{
               required(:template) =>
                 list(ExOpenAI.Components.EasyInputMessage.t() | ExOpenAI.Components.EvalItem.t()),
               required(:type) => :template
             }
             | %{required(:item_reference) => String.t(), required(:type) => :item_reference})
            | nil,
          model: String.t() | nil,
          sampling_params:
            %{
              optional(:max_completion_tokens) => integer(),
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.t(),
              optional(:response_format) =>
                (ExOpenAI.Components.ResponseFormatText.t()
                 | ExOpenAI.Components.ResponseFormatJsonSchema.t())
                | ExOpenAI.Components.ResponseFormatJsonObject.t(),
              optional(:seed) => integer(),
              optional(:temperature) => number(),
              optional(:tools) => list(ExOpenAI.Components.ChatCompletionTool.t()),
              optional(:top_p) => number()
            }
            | nil,
          source:
            (ExOpenAI.Components.EvalJsonlFileContentSource.t()
             | ExOpenAI.Components.EvalJsonlFileIdSource.t())
            | ExOpenAI.Components.EvalStoredCompletionsSource.t(),
          type: :completions
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input_messages) =>
                %{
                  required(:template) =>
                    list(
                      ExOpenAI.Components.EasyInputMessage.input()
                      | ExOpenAI.Components.EvalItem.input()
                    ),
                  required(:type) => :template | String.t()
                }
                | %{
                    required(:item_reference) => String.t(),
                    required(:type) => :item_reference | String.t()
                  },
              optional(:model) => String.t(),
              optional(:sampling_params) => %{
                optional(:max_completion_tokens) => integer(),
                optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.input(),
                optional(:response_format) =>
                  (ExOpenAI.Components.ResponseFormatText.input()
                   | ExOpenAI.Components.ResponseFormatJsonSchema.input())
                  | ExOpenAI.Components.ResponseFormatJsonObject.input(),
                optional(:seed) => integer(),
                optional(:temperature) => number(),
                optional(:tools) => list(ExOpenAI.Components.ChatCompletionTool.input()),
                optional(:top_p) => number()
              },
              required(:source) =>
                (ExOpenAI.Components.EvalJsonlFileContentSource.input()
                 | ExOpenAI.Components.EvalJsonlFileIdSource.input())
                | ExOpenAI.Components.EvalStoredCompletionsSource.input(),
              required(:type) => :completions | String.t()
            }
  defstruct [:input_messages, :model, :sampling_params, :source, :type]
end
