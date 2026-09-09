%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/", "config/", "mix.exs"],
        excluded: ["lib/ex_openai/generated/", "test/testdata/"]
      },
      checks: %{
        extra: [
          # Schema traversal and AST rendering have broad pattern dispatch.
          {Credo.Check.Refactor.CyclomaticComplexity, max_complexity: 30},
          {Credo.Check.Refactor.Nesting, max_nesting: 4}
        ],
        disabled: [
          # Fully qualified modules keep emitted AST independent of caller aliases.
          {Credo.Check.Design.AliasUsage, []}
        ]
      }
    }
  ]
}
