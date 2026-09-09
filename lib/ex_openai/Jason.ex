defmodule ExOpenAI.Jason do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      defimpl Jason.Encoder, for: [__MODULE__] do
        def encode(struct, opts) do
          to_encode =
            for {key, value} <- Map.to_list(struct),
                value != nil,
                key != :__struct__,
                do: {key, value}

          Jason.Encode.keyword(to_encode, opts)
        end
      end
    end
  end
end
