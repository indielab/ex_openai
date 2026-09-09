defmodule ExOpenAI.Components.ProjectDataRetention do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a project's data retention control setting.

  ## Fields

  * `:object` - **required** - `:"project.data_retention"`
    The object type, which is always `project.data_retention`.
    Allowed values: `"project.data_retention"`

  * `:type` - **required** - `:organization_default | :none | :zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring`
    The configured project data retention type.
    Allowed values: `"organization_default"`, `"none"`, `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          object: :"project.data_retention",
          type:
            ((((:organization_default | :none) | :zero_data_retention)
              | :modified_abuse_monitoring)
             | :enhanced_zero_data_retention)
            | :enhanced_modified_abuse_monitoring
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:object) => :"project.data_retention" | String.t(),
              required(:type) =>
                (((((:organization_default | :none) | :zero_data_retention)
                   | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t()
            }
  defstruct [:object, :type]
end
