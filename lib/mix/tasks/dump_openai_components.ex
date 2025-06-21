defmodule Mix.Tasks.DumpOpenaiComponents do
  @moduledoc """
  Writes all OpenAPI components as Elixir files to disk
  """

  use Mix.Task

  @impl Mix.Task

  @docs_file "lib/ex_openai/docs/docs.yaml"
  @output_dir "openai/components"

  def run(_) do
    case File.read(@docs_file) do
      {:ok, content} ->
        docs = ExOpenAI.Codegen.DocsParser.get_documentation(content)

        # Create output directory
        File.mkdir_p!(@output_dir)

        IO.puts("Writing OpenAPI Components to #{@output_dir}...")
        IO.puts("=" <> String.duplicate("=", String.length(@output_dir) + 29))

        docs.components
        |> Enum.sort_by(fn {name, _schema} -> name end)
        |> Enum.each(fn {name, schema} ->
          write_component_file(name, schema)
          IO.puts("Written: #{name}.exs")
        end)

        IO.puts("\nTotal components written: #{map_size(docs.components)}")

      {:error, reason} ->
        IO.puts("Error reading docs file: #{reason}")
        IO.puts("Make sure to run 'mix update_openai_docs' first")
    end
  end

  defp write_component_file(name, schema) do
    file_path = Path.join(@output_dir, "#{name}.exs")
    content = format_component_as_elixir(name, schema)
    File.write!(file_path, content)
  end

  defp format_component_as_elixir(name, schema) do
    inspect(schema, pretty: true)
  end
end
