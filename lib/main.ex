defmodule Server do
  use Application

  @spec start(:normal | :supervised, term()) :: {:ok, pid()} | {:error, term()}
  def start(_type, _args) do
    Supervisor.start_link([{Task, fn -> Server.listen() end}], strategy: :one_for_one)
  end

  @spec listen() :: :ok
  def listen() do
    {:ok, socket} = :gen_tcp.listen(4221, [:binary, active: false, reuseaddr: true])
    {:ok, client} = :gen_tcp.accept(socket)
    :gen_tcp.send(client, "HTTP/1.1 200 OK\r\n\r\n")
  end
end

defmodule CLI do
  @spec main([String.t()]) :: :ok
  def main(_args) do
    # Start the Server application
    {:ok, _pid} = Application.ensure_all_started(:codecrafters_http_server)

    # Run forever
    Process.sleep(:infinity)
  end
end
