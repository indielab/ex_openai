defmodule ExOpenAI.Components.CreateModerationResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents if a given text input is potentially harmful.

  ## Fields

  * `:id` - **required** - `String.t()`  
    The unique identifier for the moderation request.

  * `:model` - **required** - `String.t()`  
    The model used to generate the moderation results.

  * `:results` - **required** - `[{:%{}, [], [{{:required, [], [:categories]}, {:%{}, [], [{{:required, [], [:harassment]}, {:boolean, [], []}}, {{:required, [], [:"harassment/threatening"]}, {:boolean, [], []}}, {{:required, [], [:hate]}, {:boolean, [], []}}, {{:required, [], [:"hate/threatening"]}, {:boolean, [], []}}, {{:required, [], [:illicit]}, {:|, [], [{:boolean, [], []}, {:any, [], []}]}}, {{:required, [], [:"illicit/violent"]}, {:|, [], [{:boolean, [], []}, {:any, [], []}]}}, {{:required, [], [:"self-harm"]}, {:boolean, [], []}}, {{:required, [], [:"self-harm/instructions"]}, {:boolean, [], []}}, {{:required, [], [:"self-harm/intent"]}, {:boolean, [], []}}, {{:required, [], [:sexual]}, {:boolean, [], []}}, {{:required, [], [:"sexual/minors"]}, {:boolean, [], []}}, {{:required, [], [:violence]}, {:boolean, [], []}}, {{:required, [], [:"violence/graphic"]}, {:boolean, [], []}}]}}, {{:required, [], [:category_applied_input_types]}, {:%{}, [], [{{:required, [], [:harassment]}, {:list, [], [:text]}}, {{:required, [], [:"harassment/threatening"]}, {:list, [], [:text]}}, {{:required, [], [:hate]}, {:list, [], [:text]}}, {{:required, [], [:"hate/threatening"]}, {:list, [], [:text]}}, {{:required, [], [:illicit]}, {:list, [], [:text]}}, {{:required, [], [:"illicit/violent"]}, {:list, [], [:text]}}, {{:required, [], [:"self-harm"]}, {:list, [], [{:|, [], [:text, :image]}]}}, {{:required, [], [:"self-harm/instructions"]}, {:list, [], [{:|, [], [:text, :image]}]}}, {{:required, [], [:"self-harm/intent"]}, {:list, [], [{:|, [], [:text, :image]}]}}, {{:required, [], [:sexual]}, {:list, [], [{:|, [], [:text, :image]}]}}, {{:required, [], [:"sexual/minors"]}, {:list, [], [:text]}}, {{:required, [], [:violence]}, {:list, [], [{:|, [], [:text, :image]}]}}, {{:required, [], [:"violence/graphic"]}, {:list, [], [{:|, [], [:text, :image]}]}}]}}, {{:required, [], [:category_scores]}, {:%{}, [], [{{:required, [], [:harassment]}, {:number, [], []}}, {{:required, [], [:"harassment/threatening"]}, {:number, [], []}}, {{:required, [], [:hate]}, {:number, [], []}}, {{:required, [], [:"hate/threatening"]}, {:number, [], []}}, {{:required, [], [:illicit]}, {:number, [], []}}, {{:required, [], [:"illicit/violent"]}, {:number, [], []}}, {{:required, [], [:"self-harm"]}, {:number, [], []}}, {{:required, [], [:"self-harm/instructions"]}, {:number, [], []}}, {{:required, [], [:"self-harm/intent"]}, {:number, [], []}}, {{:required, [], [:sexual]}, {:number, [], []}}, {{:required, [], [:"sexual/minors"]}, {:number, [], []}}, {{:required, [], [:violence]}, {:number, [], []}}, {{:required, [], [:"violence/graphic"]}, {:number, [], []}}]}}, {{:required, [], [:flagged]}, {:boolean, [], []}}]}]`  
    A list of moderation objects.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          model: String.t(),
          results:
            list(%{
              required(:categories) => %{
                required(:harassment) => boolean(),
                required(:"harassment/threatening") => boolean(),
                required(:hate) => boolean(),
                required(:"hate/threatening") => boolean(),
                required(:illicit) => boolean() | any(),
                required(:"illicit/violent") => boolean() | any(),
                required(:"self-harm") => boolean(),
                required(:"self-harm/instructions") => boolean(),
                required(:"self-harm/intent") => boolean(),
                required(:sexual) => boolean(),
                required(:"sexual/minors") => boolean(),
                required(:violence) => boolean(),
                required(:"violence/graphic") => boolean()
              },
              required(:category_applied_input_types) => %{
                required(:harassment) => list(:text),
                required(:"harassment/threatening") => list(:text),
                required(:hate) => list(:text),
                required(:"hate/threatening") => list(:text),
                required(:illicit) => list(:text),
                required(:"illicit/violent") => list(:text),
                required(:"self-harm") => list(:text | :image),
                required(:"self-harm/instructions") => list(:text | :image),
                required(:"self-harm/intent") => list(:text | :image),
                required(:sexual) => list(:text | :image),
                required(:"sexual/minors") => list(:text),
                required(:violence) => list(:text | :image),
                required(:"violence/graphic") => list(:text | :image)
              },
              required(:category_scores) => %{
                required(:harassment) => number(),
                required(:"harassment/threatening") => number(),
                required(:hate) => number(),
                required(:"hate/threatening") => number(),
                required(:illicit) => number(),
                required(:"illicit/violent") => number(),
                required(:"self-harm") => number(),
                required(:"self-harm/instructions") => number(),
                required(:"self-harm/intent") => number(),
                required(:sexual) => number(),
                required(:"sexual/minors") => number(),
                required(:violence) => number(),
                required(:"violence/graphic") => number()
              },
              required(:flagged) => boolean()
            })
        }
  defstruct [:id, :model, :results]
end
