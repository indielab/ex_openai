defmodule ExOpenAI.Components.UrlCitationBody do
  use ExOpenAI.Jason

  @moduledoc """
  A citation for a web resource used to generate a model response.

  ## Fields

  * `:end_index` - **required** - `integer()`
    The index of the last character of the URL citation in the message.

  * `:start_index` - **required** - `integer()`
    The index of the first character of the URL citation in the message.

  * `:title` - **required** - `String.t()`
    The title of the web resource.

  * `:type` - **required** - `:url_citation`
    The type of the URL citation. Always `url_citation`.
    Allowed values: `"url_citation"`
    Default: `"url_citation"`

  * `:url` - **required** - `String.t()`
    The URL of the web resource.
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
