defmodule RenderReactWeb.PageController do
  use RenderReactWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
