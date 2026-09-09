defmodule ExOpenAI.Components.ProjectServiceAccountCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountCreateRequest.

  ## Fields

  * `:create_service_account_only` - **optional** - `boolean() | nil`

  * `:name` - **required** - `String.t()`
    The name of the service account being created.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          create_service_account_only: (boolean() | nil) | nil,
          name: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:create_service_account_only) => boolean() | nil,
              required(:name) => String.t()
            }
  defstruct [:create_service_account_only, :name]
end
