defmodule ExOpenAI.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_openai,
      version: "2.0.0-beta4",
      elixir: "~> 1.16",
      description: description(),
      start_permanent: Mix.env() == :prod,
      test_ignore_filters: [~r"/testdata/"],
      deps: deps(),
      package: package(),
      name: "ex_openai.ex",
      source_url: "https://github.com/dvcrn/ex_openai",
      dialyzer: [plt_add_apps: [:mix]]
    ]
  end

  def cli do
    [preferred_envs: [vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:hackney, :httpoison, :jason, :logger, :yaml_elixir]
    ]
  end

  defp description do
    """
    Auto-generated Elixir SDK for OpenAI APIs with proper typespec and @docs support
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      exclude_patterns: ["./config/*"],
      links: %{
        "GitHub" => "https://github.com/dvcrn/ex_openai"
      },
      maintainers: [
        "dvcrn"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:mock, "~> 0.3.8", only: :test},
      # Mock and ExVCR pin Meck versions that cannot compile on OTP 29.
      {:meck, "~> 1.2", only: :test, override: true},
      {:httpoison, "~> 2.2.1"},
      {:mix_test_watch, "~> 1.2", only: :test, runtime: false},
      {:ex_doc, ">= 0.34.1", only: :dev},
      {:exvcr, "~> 0.16.0", only: :test},
      {:exjsx, "~> 4.0", only: :test},
      {:yaml_elixir, "~> 2.11"},
      {:dialyxir, "~> 1.4", only: [:dev], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mime, "~> 2.0"}
    ]
  end
end
