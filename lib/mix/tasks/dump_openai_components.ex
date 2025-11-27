defmodule Mix.Tasks.DumpOpenaiComponents do
  @moduledoc """
  Writes all OpenAPI components as Elixir files to disk
  """
  @shortdoc "Dump OpenAI components and paths to disk"

  use Mix.Task

  @impl Mix.Task

  @docs_file "lib/ex_openai/docs/docs.yaml"
  @components_dir "openai/components"
  @paths_dir "openai/paths"

  def run(_) do
    case File.read(@docs_file) do
      {:ok, content} ->
        docs = ExOpenAI.Codegen.DocsParser.get_documentation(content)

        # Create output directories
        File.mkdir_p!(@components_dir)
        File.mkdir_p!(@paths_dir)

        IO.puts("Writing OpenAPI Components to #{@components_dir}...")
        IO.puts("=" <> String.duplicate("=", String.length(@components_dir) + 29))

        docs.components
        |> Enum.sort_by(fn {name, _schema} -> name end)
        |> Enum.each(fn {name, schema} ->
          write_component_file(name, schema)
          IO.puts("Written: #{name}.exs")
        end)

        IO.puts("\nTotal components written: #{map_size(docs.components)}")

        IO.puts("\nWriting OpenAPI Paths to #{@paths_dir}...")
        IO.puts("=" <> String.duplicate("=", String.length(@paths_dir) + 25))

        docs.paths
        |> Enum.sort_by(fn {path, _data} -> path end)
        |> Enum.each(fn {path, path_data} ->
          write_path_file(path, path_data)
          IO.puts("Written: #{sanitize_filename(path)}.exs")
        end)

        IO.puts("\nTotal paths written: #{map_size(docs.paths)}")

      {:error, reason} ->
        IO.puts("Error reading docs file: #{reason}")
        IO.puts("Make sure to run 'mix update_openai_docs' first")
    end
  end

  defp write_component_file(name, schema) do
    file_path = Path.join(@components_dir, "#{name}.exs")
    content = format_component_as_elixir(name, schema)
    File.write!(file_path, content)
  end

  defp write_path_file(path, path_data) do
    filename = sanitize_filename(path)
    file_path = Path.join(@paths_dir, "#{filename}.exs")
    content = format_path_as_elixir(path, path_data)
    File.write!(file_path, content)
  end

  defp format_component_as_elixir(name, schema) do
    inspect(schema, pretty: true)
  end

  defp format_path_as_elixir(path, path_data) do
    inspect(path_data, pretty: true)
  end

  defp sanitize_filename(path) do
    path
    |> String.replace("/", "_")
    |> String.replace("{", "")
    |> String.replace("}", "")
    |> String.replace(":", "")
    |> String.replace(" ", "_")
    |> String.trim_leading("_")
  end
end
