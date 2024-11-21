defmodule Server do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([{Task, fn -> Server.listen() end}], strategy: :one_for_one)
  end

  def listen() do
    IO.puts("Ola")
    {:ok, socket} = :gen_tcp.listen(4221, [:binary, active: false, reuseaddr: true])
    {:ok, _client} = :gen_tcp.accept(socket)
  end
end

defmodule CLI do
  def main(_args) do
    # Start the Server application
    {:ok, _pid} = Application.ensure_all_started(:elixserve)

    # Run forever
    Process.sleep(:infinity)
  end
end
