defmodule ExOpenAI.ClientStreamOptionsTest do
  use ExUnit.Case

  alias ExOpenAI.Client

  test "starts streaming client when only stream_to is provided" do
    callback = fn _ -> :ok end

    [stream_to: pid] =
      Client.stream_options([stream: true, stream_to: callback], fn resp -> resp end)

    assert is_pid(pid)
    assert Process.alive?(pid)
    Process.exit(pid, :normal)
  end
end
