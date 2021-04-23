defmodule ShoppingMall.ShopingCart  do
  defstruct [
    count: 0
  ]

  def add(cart) do
    %{cart | count: cart.count + 1}
  end

  def subtract(cart) do
    %{cart | count: cart.count - 1}
  end
end
