defmodule DocsIntroWeb.PageController do
  use DocsIntroWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
