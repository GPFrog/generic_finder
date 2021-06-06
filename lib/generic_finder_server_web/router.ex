defmodule GenericFinderServerWeb.Router do
  use GenericFinderServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GenericFinderServerWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/query", PageController, :query

    get "/api", PageController, :api

    get "/signin", PageController, :signin

    get "/signup", PageController, :signup

    get "/withdraw", PageController, :withdraw

    get "/blacklist", PageController, :blacklist

    get "/email", PageController, :email

    get "/certification", PageController, :certification

    get "/medicineDetail", PageController, :medicineDetail

    get "/medicine", PageController, :medicine

    get "/medicinePriceEnroll", PageController, :medicinePriceEnroll

    get "/medicinePriceDelete", PageController, :medicinePriceDelete

    get "/medicinePriceLookup", PageController, :medicinePriceLookup
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", GenericFinderServerWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: GenericFinderServerWeb.Telemetry
    end
  end
end
