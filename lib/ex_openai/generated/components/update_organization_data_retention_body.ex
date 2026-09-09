defmodule ExOpenAI.Components.UpdateOrganizationDataRetentionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for updating organization data retention controls.

  ## Fields

  * `:retention_type` - **required** - `:zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring`
    The desired organization data retention type.
    Allowed values: `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          retention_type:
            ((:zero_data_retention | :modified_abuse_monitoring) | :enhanced_zero_data_retention)
            | :enhanced_modified_abuse_monitoring
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:retention_type) =>
                (((:zero_data_retention | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t()
            }
  defstruct [:retention_type]
end
