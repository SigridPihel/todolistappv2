defmodule Todolistappv2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Todolistappv2Web.Telemetry,
      Todolistappv2.Repo,
      {DNSCluster, query: Application.get_env(:todolistappv2, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Todolistappv2.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Todolistappv2.Finch},
      # Start a worker by calling: Todolistappv2.Worker.start_link(arg)
      # {Todolistappv2.Worker, arg},
      # Start to serve requests, typically the last entry
      Todolistappv2Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todolistappv2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Todolistappv2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
