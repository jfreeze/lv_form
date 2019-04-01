defmodule LvFormWeb.Router do
  use LvFormWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {LvFormWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LvFormWeb.LiveView do
    pipe_through :browser

    live("/registrations/new", RegistrationLive.New)
#    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LvFormWeb do
  #   pipe_through :api
  # end
end
