defmodule Spawn do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_proceses(n) do
    last = Enum.reduce 1..n, self,
    fn(_, send_to) ->
      spawn(Spawn, :counter, [send_to])
    end

    # start the count by sending
    send last, 0

    #and wait for the result to come back to us
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Spawn, :create_proceses, [n])
  end
end
