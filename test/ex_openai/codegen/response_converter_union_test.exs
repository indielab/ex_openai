defmodule ExOpenAI.Components.UnionMessage do
  defstruct [:id, :type, :foo]

  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t() | nil,
          type: :message,
          foo: any() | nil
        }
end

defmodule ExOpenAI.Components.UnionReasoning do
  defstruct [:id, :type, :foo]

  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t() | nil,
          type: :reasoning,
          foo: any() | nil
        }
end

defmodule ExOpenAI.Codegen.ResponseConverterUnionTest do
  use ExUnit.Case, async: false

  alias ExOpenAI.Codegen.ResponseConverter

  @moduledoc """
  Focused tests around union handling in `ResponseConverter`.

  These tests deliberately construct small fake component types and union
  typespecs to exercise:

  * How `parse_remote_type/2` behaves for unions over maps and lists
  * That maps are atomized when passed through union handling
  * That list unions prefer the list arm and preserve list values

  The real-world, more complex union behavior (e.g. `OutputItem.t/0`) is
  covered by the integration test in `ResponseConverterTest`, which asserts
  that `Response.output` items become concrete structs.
  """

  test "union leaves maps untouched" do
    type_ast =
      {:type, 0, :union,
       [
         {:type, 0, :map, []},
         {:type, 0, :string, []}
       ]}

    value = %{"foo" => 1}
    assert ResponseConverter.parse_remote_type(type_ast, value) == %{foo: 1}
  end

  test "union leaves lists untouched" do
    type_ast =
      {:type, 0, :union,
       [
         {:type, 0, :list, [{:type, 0, :integer, []}]},
         {:type, 0, :string, []}
       ]}

    value = [1, 2, 3]
    assert ResponseConverter.parse_remote_type(type_ast, value) == [1, 2, 3]
  end
end
