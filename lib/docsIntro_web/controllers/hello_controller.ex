defmodule DocsIntroWeb.HelloController do
  use DocsIntroWeb, :controller

  require Logger

  def index(conn, _params) do
    conn
    # |> put_layout("admin.html")
    |> render(:index)
  end

  # It's good to remember that the keys to the params map will always be strings, and that the
  # equals sign does not represent assignment, but is instead a pattern match assertion.
  # def show(conn, %{"messenger" => messenger} = params) do
  #   render(conn, "show.html", messenger: messenger)
  # end
  def show(conn, %{"messenger" => messenger}) do
    # Logger.info(inspect(conn, pretty: true))

    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render("show.html")
  end
end
