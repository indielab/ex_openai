defmodule ExOpenAI.Components.UpdateProjectDataRetentionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for updating project data retention controls.

  ## Fields

  * `:retention_type` - **required** - `:organization_default | :none | :zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring`
    The desired project data retention type.
    Allowed values: `"organization_default"`, `"none"`, `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          retention_type:
            ((((:organization_default | :none) | :zero_data_retention)
              | :modified_abuse_monitoring)
             | :enhanced_zero_data_retention)
            | :enhanced_modified_abuse_monitoring
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:retention_type) =>
                (((((:organization_default | :none) | :zero_data_retention)
                   | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t()
            }
  defstruct [:retention_type]
end
