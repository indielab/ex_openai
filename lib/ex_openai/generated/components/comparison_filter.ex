defmodule ExOpenAI.Components.ComparisonFilter do
  use ExOpenAI.Jason

  @moduledoc """
  A filter used to compare a specified attribute key to a given value using a defined comparison operation.


  ## Fields

  * `:key` - **required** - `String.t()`
    The key to compare against the value.

  * `:type` - **required** - `:eq | :ne | :gt | :gte | :lt | :lte | :in | :nin`
    Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
  - `eq`: equals
  - `ne`: not equal
  - `gt`: greater than
  - `gte`: greater than or equal
  - `lt`: less than
  - `lte`: less than or equal
  - `in`: in
  - `nin`: not in
    Allowed values: `"eq"`, `"ne"`, `"gt"`, `"gte"`, `"lt"`, `"lte"`, `"in"`, `"nin"`
    Default: `"eq"`

  * `:value` - **required** - `String.t() | number() | boolean() | list(String.t() | number())`
    The value to compare against the attribute key; supports string, number, or boolean types.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          key: String.t(),
          type: ((((((:eq | :ne) | :gt) | :gte) | :lt) | :lte) | :in) | :nin,
          value: ((String.t() | number()) | boolean()) | list(String.t() | number())
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:key) => String.t(),
              required(:type) =>
                (((((((:eq | :ne) | :gt) | :gte) | :lt) | :lte) | :in) | :nin) | String.t(),
              required(:value) =>
                ((String.t() | number()) | boolean()) | list(String.t() | number())
            }
  defstruct [:key, :type, :value]
end
