defmodule ShoppingMall.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {ShoppingMall.CartAgent, %ShoppingMall.ShopingCart{}},
      # Start the Telemetry supervisor
      ShoppingMallWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShoppingMall.PubSub},
      # Start the Endpoint (http/https)
      ShoppingMallWeb.Endpoint
      # Start a worker by calling: ShoppingMall.Worker.start_link(arg)
      # {ShoppingMall.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShoppingMall.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShoppingMallWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
