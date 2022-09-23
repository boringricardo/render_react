defmodule RenderReact.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RenderReactWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RenderReact.PubSub},
      # Start the Endpoint (http/https)
      RenderReactWeb.Endpoint
      # Start a worker by calling: RenderReact.Worker.start_link(arg)
      # {RenderReact.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RenderReact.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RenderReactWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
