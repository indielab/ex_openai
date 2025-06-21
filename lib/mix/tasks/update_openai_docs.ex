defmodule Mix.Tasks.UpdateOpenaiDocs do
  @moduledoc """
  Updates OpenAI API documentation files
  """

  use Mix.Task

  @impl Mix.Task

  @target_dir "lib/ex_openai/docs"
  def run(_) do
    File.mkdir_p!(@target_dir)
    docs_url = "https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml"
    System.cmd("curl", ["-L", docs_url, "-o", "#{@target_dir}/docs.yaml"])
  end
end
