defmodule ExOpenAI.Codegen.SourceFileGenerator do
  @moduledoc """
  Writes generated SDK modules to source files under `lib/ex_openai/generated`.
  """

  alias ExOpenAI.Codegen.ComponentModuleGenerator
  alias ExOpenAI.Codegen.DocsParser
  alias ExOpenAI.Codegen.PathModuleGenerator

  @generated_root Path.expand("../generated", __DIR__)
  @docs_path Path.expand("../docs/docs.yaml", __DIR__)

  @spec generated_root() :: String.t()
  def generated_root, do: @generated_root

  @spec load_documentation() :: DocsParser.t()
  def load_documentation do
    @docs_path
    |> File.read!()
    |> DocsParser.get_documentation()
  end

  @spec write_all!() :: [String.t()]
  def write_all! do
    files =
      sources()
      |> Enum.map(fn {path, source} ->
        File.mkdir_p!(Path.dirname(path))
        File.write!(path, source)
        path
      end)

    prune_stale_files!(files)

    files
  end

  @spec sources() :: %{String.t() => String.t()}
  def sources do
    load_documentation()
    |> generated_modules()
    |> Map.new(fn ast ->
      {ast |> extract_module_name!() |> module_to_path(), render_source(ast)}
    end)
  end

  @spec stale_sources() :: [String.t()]
  def stale_sources do
    sources = sources()

    changed =
      Enum.flat_map(sources, fn {path, source} ->
        if File.read(path) == {:ok, source}, do: [], else: [path]
      end)

    removed = Path.wildcard(Path.join(@generated_root, "**/*.ex")) -- Map.keys(sources)
    Enum.sort(changed ++ removed)
  end

  defp generated_modules(documentation) do
    component_modules =
      documentation.components
      |> Enum.sort_by(fn {name, _schema} -> name end)
      |> Enum.map(fn {name, schema} ->
        schema
        |> Map.put(:name, name)
        |> ComponentModuleGenerator.generate_module(documentation.components)
      end)

    path_modules =
      documentation.paths
      |> Map.values()
      |> Enum.sort_by(& &1.path)
      |> PathModuleGenerator.generate_modules(documentation.components)

    component_modules ++ path_modules
  end

  defp extract_module_name!({:defmodule, _, [module_name, _body]}) when is_atom(module_name),
    do: module_name

  defp extract_module_name!(ast) do
    raise ArgumentError, "unable to extract module name from AST: #{inspect(ast)}"
  end

  defp module_to_path(module) do
    relative_parts =
      module
      |> Module.split()
      |> Enum.drop_while(&(&1 != "ExOpenAI"))
      |> Enum.drop(1)
      |> Enum.map(&Macro.underscore/1)

    Path.join([@generated_root | relative_parts]) <> ".ex"
  end

  defp render_source(ast) do
    ast
    |> Macro.to_string()
    |> rewrite_doc_attributes()
    |> Code.format_string!()
    |> IO.iodata_to_binary()
    |> Kernel.<>("\n")
  end

  defp rewrite_doc_attributes(source) do
    Regex.replace(~r/@(moduledoc|doc)\s+"((?:[^"\\]|\\.)*)"/, source, fn _, attr, escaped ->
      doc = Code.string_to_quoted!("\"#{escaped}\"")

      doc =
        doc
        |> then(&Regex.replace(~r/[ \t]+\n/, &1, "\n"))
        |> String.replace("](/", "](https://platform.openai.com/")
        |> String.replace("](../", "](https://platform.openai.com/docs/api-reference/")
        |> String.replace("\\", "\\\\")
        |> String.replace("\#{", "\\\#{")
        |> String.replace("\"\"\"", "\\\"\\\"\\\"")

      ~s/@#{attr} """\n#{doc}\n"""/
    end)
  end

  defp prune_stale_files!(expected_files) do
    expected = MapSet.new(expected_files)

    @generated_root
    |> Path.join("**/*.ex")
    |> Path.wildcard()
    |> Enum.reject(&MapSet.member?(expected, &1))
    |> Enum.each(&File.rm!/1)
  end
end
