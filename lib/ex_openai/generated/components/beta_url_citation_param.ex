defmodule ExOpenAI.Components.BetaUrlCitationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaUrlCitationParam.

  ## Fields

  * `:end_index` - **required** - `integer()`
    The index of the last character of the citation in the message.
    Constraints: minimum: 0

  * `:start_index` - **required** - `integer()`
    The index of the first character of the citation in the message.
    Constraints: minimum: 0

  * `:title` - **required** - `String.t()`
    The title of the cited resource.

  * `:type` - **required** - `:url_citation`
    The citation type. Always `url_citation`.
    Allowed values: `"url_citation"`
    Default: `"url_citation"`

  * `:url` - **required** - `String.t()`
    The URL of the cited resource.
    Format: `uri`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_index: integer(),
          start_index: integer(),
          title: String.t(),
          type: :url_citation,
          url: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:end_index) => integer(),
              required(:start_index) => integer(),
              required(:title) => String.t(),
              required(:type) => :url_citation | String.t(),
              required(:url) => String.t()
            }
  defstruct [:end_index, :start_index, :title, :type, :url]
end
