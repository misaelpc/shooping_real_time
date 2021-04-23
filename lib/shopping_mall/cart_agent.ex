defmodule ShoppingMall.CartAgent do
  use Agent
  alias ShoppingMall.ShopingCart

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, fn cart ->
      ShopingCart.add(cart)
    end)
  end

  def decrement do
    Agent.update(__MODULE__, fn cart ->
      ShopingCart.subtract(cart)
    end)
  end


end
