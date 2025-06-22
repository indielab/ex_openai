defmodule ExOpenAI.Codegen.PathModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Path structs.
  
  Groups paths by their tag and generates modules with function stubs
  for each operation.
  """

  alias ExOpenAI.Codegen.DocsParser.{Path, Operation}

  @doc """
  Generates modules from a list of Path structs.
  
  Groups paths by their tag and returns a list of module ASTs.
  """
  @spec generate_modules([Path.t()]) :: [Macro.t()]
  def generate_modules(paths) when is_list(paths) do
    paths
    |> group_paths_by_tag()
    |> Enum.map(fn {tag, paths} -> generate_module(tag, paths) end)
  end

  @doc """
  Generates a single module from paths that share the same tag.
  """
  @spec generate_module(String.t() | nil, [Path.t()]) :: Macro.t()
  def generate_module(tag, paths) when is_list(paths) do
    module_name = determine_module_name(tag, paths)
    functions = extract_all_functions(paths)
    
    quote do
      defmodule unquote(module_name) do
        @moduledoc false
        
        unquote_splicing(functions)
      end
    end
  end

  # Group paths by their tag
  defp group_paths_by_tag(paths) do
    paths
    |> Enum.flat_map(fn path ->
      # Get all unique tags from all operations in this path
      tags = path.operations
             |> Map.values()
             |> Enum.flat_map(fn op -> op.tags || [] end)
             |> Enum.uniq()
      
      # If no tags, use nil as the key
      if tags == [] do
        [{nil, path}]
      else
        # Create an entry for each tag
        Enum.map(tags, fn tag -> {tag, path} end)
      end
    end)
    |> Enum.group_by(
      fn {tag, _path} -> tag end,
      fn {_tag, path} -> path end
    )
  end

  # Determine module name from tag or operation
  defp determine_module_name(tag, _paths) when is_binary(tag) do
    String.to_atom("Elixir.ExOpenAI.#{tag}")
  end
  
  defp determine_module_name(nil, paths) do
    # Try to derive from first operation_id
    first_op = paths
               |> List.first()
               |> Map.get(:operations)
               |> Map.values()
               |> List.first()
    
    case first_op do
      %Operation{operation_id: op_id} when is_binary(op_id) ->
        # Extract module name from operation_id
        # e.g., "ListContainers" -> "Containers"
        module_part = op_id
                     |> String.replace(~r/^(list|create|get|update|delete|modify)/i, "")
                     |> String.trim()
        
        String.to_atom("Elixir.ExOpenAI.#{module_part}")
      
      _ ->
        # Fallback to Unknown
        String.to_atom("Elixir.ExOpenAI.Unknown")
    end
  end

  # Extract all functions from all paths
  defp extract_all_functions(paths) do
    paths
    |> Enum.flat_map(fn path ->
      path.operations
      |> Map.values()
      |> Enum.map(&generate_function/1)
    end)
  end

  # Generate a function stub from an operation
  defp generate_function(%Operation{operation_id: nil}), do: nil
  defp generate_function(%Operation{operation_id: op_id}) do
    function_name = operation_id_to_function_name(op_id)
    
    quote do
      def unquote(function_name)() do
        # TODO: Implement
        :ok
      end
    end
  end

  # Convert operationId from camelCase to snake_case
  defp operation_id_to_function_name(operation_id) do
    operation_id
    # Handle transitions from lowercase to uppercase
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    # Handle transitions from multiple uppercase letters to lowercase
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.downcase()
    |> String.to_atom()
  end
end