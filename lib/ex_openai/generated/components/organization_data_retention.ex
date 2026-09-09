defmodule ExOpenAI.Components.OrganizationDataRetention do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the organization's data retention control setting.

  ## Fields

  * `:object` - **required** - `:"organization.data_retention"`
    The object type, which is always `organization.data_retention`.
    Allowed values: `"organization.data_retention"`

  * `:type` - **required** - `:zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring`
    The configured organization data retention type.
    Allowed values: `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          object: :"organization.data_retention",
          type:
            ((:zero_data_retention | :modified_abuse_monitoring) | :enhanced_zero_data_retention)
            | :enhanced_modified_abuse_monitoring
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:object) => :"organization.data_retention" | String.t(),
              required(:type) =>
                (((:zero_data_retention | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t()
            }
  defstruct [:object, :type]
end
