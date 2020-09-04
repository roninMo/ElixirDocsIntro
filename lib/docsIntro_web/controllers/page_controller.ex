defmodule DocsIntroWeb.PageController do
  use DocsIntroWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/redirect_test")
  end

  def redirect_test(conn, _params) do
    render(conn, "index.html")
  end
end
