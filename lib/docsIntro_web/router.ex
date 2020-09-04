defmodule DocsIntroWeb.Router do
  use DocsIntroWeb, :router

  pipeline :browser do
    plug(:accepts, ["html", "text", "json"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    # plug(DocsIntro.Plugs.Locale, "en")
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # Onto all the routes
  scope "/", DocsIntroWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/redirect_test", PageController, :redirect_test)

    get("/hello", HelloController, :index)
    get("/hello/:messenger", HelloController, :show)
  end

  scope "/api", DocsIntroWeb do
    pipe_through(:api)

    resources("reviews", ReviewController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", DocsIntroWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if(Mix.env() in [:dev, :test]) do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: DocsIntroWeb.Telemetry)
    end
  end
end

# resources("/users", UserController, except: [:update]) *or* resources("/users", UserController, only: [:index, show])
# scope "/admin", DocsIntroWeb.Admin, as: :admin do
# :admin makes "mix phx.routes" have a prefix of admin for all the path helpers for these routes
# This is important when referencing this (especially as links in the html), so that you can navigate effectively between the different routes

# Redirect is like an http funnel to a specific address, it's useful for not recreating any extra code
