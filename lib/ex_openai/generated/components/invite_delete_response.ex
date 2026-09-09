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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"organization.invite.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
