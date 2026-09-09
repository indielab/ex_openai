defmodule Mix.Tasks.GenerateOpenaiSources do
  @moduledoc """
  Generate OpenAI SDK source files under lib/ex_openai/generated.
  """
  @shortdoc "Generate OpenAI SDK source files"

  use Mix.Task

  alias ExOpenAI.Codegen.SourceFileGenerator

  @impl Mix.Task
  def run(["--check"]) do
    case SourceFileGenerator.stale_sources() do
      [] ->
        Mix.shell().info("Generated sources are current")

      files ->
        Mix.raise(
          "Generated sources are stale:\n" <> Enum.map_join(files, "\n", &Path.relative_to_cwd/1)
        )
    end
  end

  def run([]) do
    Mix.shell().info("Generating OpenAI SDK source files...")

    files = SourceFileGenerator.write_all!()

    Mix.shell().info("Wrote #{length(files)} generated source files to lib/ex_openai/generated")
  end
end
