defmodule DocsIntroWeb.HelloController do
  use DocsIntroWeb, :controller
  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # It's good to remember that the keys to the params map will always be strings, and that the
  # equals sign does not represent assignment, but is instead a pattern match assertion.
  def show(conn, %{"messenger" => messenger} = params) do
    render(conn, "show.html", messenger: messenger)
  end
end
