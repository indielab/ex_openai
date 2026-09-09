defmodule ExOpenAI.StreamingClient do
  @moduledoc """
  Receives SSE chunks and forwards data, errors, and completion to a callback or process.

  Use this module to implement a receiver with `handle_data/2`, `handle_error/2`,
  and `handle_finish/1`. The HTTP stream helper stops when its request ends;
  the receiver process retains its own state and lifecycle.
  """
  use GenServer

  @callback handle_data(any(), any()) :: {:noreply, any()}
  @callback handle_finish(any()) :: {:noreply, any()}
  @callback handle_error(any(), any()) :: {:noreply, any()}

  defmacro __using__(_opts) do
    quote do
      use GenServer
      @behaviour ExOpenAI.StreamingClient

      def start_link(init_args, opts \\ []) do
        GenServer.start_link(__MODULE__, init_args, opts)
      end

      @impl GenServer
      def init(init_args), do: {:ok, init_args}

      @impl GenServer
      def handle_cast({:data, data}, state), do: handle_data(data, state)
      def handle_cast({:error, error}, state), do: handle_error(error, state)
      def handle_cast(:finish, state), do: handle_finish(state)
    end
  end

  def start_link(stream_to, convert_response) do
    GenServer.start_link(__MODULE__, {stream_to, convert_response})
  end

  @impl true
  def init({stream_to, convert_response}) do
    {:ok,
     %{
       stream_to: stream_to,
       convert_response_fx: convert_response,
       buffer: "",
       finished: false,
       http_error: false
     }}
  end

  @doc "Forwards an event by GenServer cast or a one-argument callback."
  def forward_response(pid, data) when is_pid(pid), do: GenServer.cast(pid, data)
  def forward_response(callback, data) when is_function(callback, 1), do: callback.(data)

  @doc false
  def atomize_keys(value), do: ExOpenAI.Codegen.ResponseConverter.deep_atomize_keys(value)

  @impl true
  def handle_cast(:stop, state), do: {:stop, :normal, state}

  @impl true
  def handle_info(%HTTPoison.AsyncChunk{chunk: chunk}, state) do
    buffer = String.replace(state.buffer <> chunk, "\r\n", "\n")

    case Jason.decode(buffer) do
      {:ok, payload} ->
        payload |> process_payload(%{state | buffer: ""}) |> continue_or_stop()

      {:error, _} ->
        parts = String.split(buffer, "\n\n")
        {messages, [pending]} = Enum.split(parts, -1)

        messages
        |> Enum.reduce_while(%{state | buffer: pending}, fn message, current ->
          next = process_message(message, current)
          if next.finished, do: {:halt, next}, else: {:cont, next}
        end)
        |> continue_or_stop()
    end
  end

  def handle_info(%HTTPoison.Error{reason: reason}, state) do
    state |> fail(reason) |> continue_or_stop()
  end

  def handle_info(%HTTPoison.AsyncStatus{code: code}, state) when code >= 400 do
    forward_response(state.stream_to, {:error, "received error status code: #{code}"})
    {:noreply, %{state | http_error: true}}
  end

  def handle_info(%HTTPoison.AsyncEnd{}, state) do
    state =
      if String.trim(state.buffer) == "", do: state, else: process_message(state.buffer, state)

    state = if state.finished or state.http_error, do: state, else: finish(state)
    {:stop, :normal, state}
  end

  def handle_info(_info, state), do: {:noreply, state}

  defp continue_or_stop(%{finished: true} = state), do: {:stop, :normal, state}
  defp continue_or_stop(state), do: {:noreply, state}

  defp process_message(message, state) do
    {event, data} =
      message
      |> String.split("\n")
      |> Enum.reduce({nil, []}, fn line, {event, data} ->
        case String.split(line, ":", parts: 2) do
          ["event", value] -> {strip_space(value), data}
          ["data", value] -> {event, data ++ [strip_space(value)]}
          ["data"] -> {event, data ++ [""]}
          _ -> {event, data}
        end
      end)

    cond do
      event == "[DONE]" ->
        finish(state)

      data == [] ->
        state

      Enum.join(data, "\n") == "[DONE]" ->
        finish(state)

      true ->
        case Jason.decode(Enum.join(data, "\n")) do
          {:ok, payload} -> process_payload(payload, state)
          {:error, error} -> fail(state, error)
        end
    end
  end

  defp strip_space(" " <> value), do: value
  defp strip_space(value), do: value

  defp process_payload(%{"error" => error}, state) when not is_nil(error), do: fail(state, error)
  defp process_payload(%{"type" => "error"} = error, state), do: fail(state, error)

  defp process_payload(payload, state) do
    case state.convert_response_fx.({:ok, payload}) do
      {:ok, message} ->
        forward_response(state.stream_to, {:data, message})
        state

      {:error, error} ->
        fail(state, error)
    end
  end

  defp finish(state) do
    forward_response(state.stream_to, :finish)
    %{state | finished: true}
  end

  defp fail(state, error) do
    forward_response(state.stream_to, {:error, error})
    %{state | finished: true}
  end
end
