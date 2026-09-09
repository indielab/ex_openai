defmodule ExOpenAI.Components.RealtimeMCPHTTPError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RealtimeMCPHTTPError.

  ## Fields

  * `:code` - **required** - `integer()`

  * `:message` - **required** - `String.t()`

  * `:type` - **required** - `:http_error`
    Allowed values: `"http_error"`
  """
  @type t() :: %{__struct__: __MODULE__, code: integer(), message: String.t(), type: :http_error}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => integer(),
              required(:message) => String.t(),
              required(:type) => :http_error | String.t()
            }
  defstruct [:code, :message, :type]
end
