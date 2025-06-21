defmodule ExOpenAI.Codegen.DocsParser do
  def get_documentation(yml) do
    parsed_yaml = YamlElixir.read_from_string!(yml)

    %{
      components: parsed_yaml["components"]["schemas"],
      paths: parsed_yaml["paths"]
    }
  end
end
