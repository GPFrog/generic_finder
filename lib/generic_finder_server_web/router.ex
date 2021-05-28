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
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", GenericFinderServerWeb do
  #   pipe_through :api
  # end
end
