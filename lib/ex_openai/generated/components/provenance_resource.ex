defmodule ExOpenAI.Components.ProvenanceResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProvenanceResource.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp, in seconds, when the provenance check was created.
    Format: `unixtime`

  * `:object` - **required** - `ExOpenAI.Components.ProvenanceCheckObject.t()`
    The object type. Always `content_provenance_check` for this endpoint.

  * `:results` - **required** - `list( ExOpenAI.Components.C2PAProvenanceResult.t() | ExOpenAI.Components.SynthIDProvenanceResult.t() )`
    The provenance results that apply to the uploaded file. Image results include C2PA and SynthID; audio results include SynthID.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          object: ExOpenAI.Components.ProvenanceCheckObject.t(),
          results:
            list(
              ExOpenAI.Components.C2PAProvenanceResult.t()
              | ExOpenAI.Components.SynthIDProvenanceResult.t()
            )
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:object) => ExOpenAI.Components.ProvenanceCheckObject.input(),
              required(:results) =>
                list(
                  ExOpenAI.Components.C2PAProvenanceResult.input()
                  | ExOpenAI.Components.SynthIDProvenanceResult.input()
                )
            }
  defstruct [:created_at, :object, :results]
end
