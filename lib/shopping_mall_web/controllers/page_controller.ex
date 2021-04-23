defmodule ShoppingMallWeb.PageController do
  use ShoppingMallWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
