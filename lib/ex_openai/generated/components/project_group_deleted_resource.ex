defmodule ExOpenAI.Components.ProjectGroupDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after removing a group from a project.

  ## Fields

  * `:deleted` - **required** - `boolean()`  
    Whether the group membership in the project was removed.

  * `:object` - **required** - `:"project.group.deleted"`  
    Always `project.group.deleted`.  
    Allowed values: `"project.group.deleted"`
  """
  @type t() :: %{__struct__: __MODULE__, deleted: boolean(), object: :"project.group.deleted"}
  defstruct [:deleted, :object]
end
