defmodule ExOpenAI.Codegen.SchemaOverlay do
  @moduledoc false

  @spec apply!(map(), [map()]) :: map()
  def apply!(document, additions) do
    Enum.reduce(additions, document, fn %{"target" => path, "add" => values}, current ->
      target =
        Enum.reduce(path, current, fn key, node ->
          if is_map(node), do: Map.get(node, key), else: nil
        end)

      unless is_map(target) do
        raise ArgumentError, "schema overlay target no longer exists: #{inspect(path)}"
      end

      existing = Map.keys(values) |> Enum.filter(&Map.has_key?(target, &1))

      if existing != [] do
        raise ArgumentError,
              "schema overlay needs review at #{inspect(path)}: upstream already defines #{inspect(existing)}"
      end

      put_in(current, path, Map.merge(target, values))
    end)
  end
end
