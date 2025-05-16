defmodule Portfolio.Application do
  use Application

  @impl true
  def start(_type, _args) do
    "server started in http://localhost:4001/" |> IO.puts()

    children = [
      {Plug.Cowboy, scheme: :http, plug: Portfolio.DevServer, options: [port: 4001]}
    ]

    opts = [strategy: :one_for_one, name: Portfolio.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
