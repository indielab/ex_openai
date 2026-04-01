defmodule ExOpenAI.Components.InviteDeleteResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InviteDeleteResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.invite.deleted"`  
    The object type, which is always `organization.invite.deleted`  
    Allowed values: `"organization.invite.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"organization.invite.deleted"
        }
  defstruct [:deleted, :id, :object]
end
