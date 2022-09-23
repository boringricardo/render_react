defmodule RenderReactWeb.RandomLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(RenderReactWeb.LiveView, "random.html", assigns)
  end

  def handle_event("randomnumbers.request_new", _, socket) do
    numbers = Stream.repeatedly(fn -> :rand.uniform(50) end) |> Stream.uniq() |> Enum.take(6)
    {:reply, %{numbers: numbers}, socket}
  end
end
