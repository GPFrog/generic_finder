defmodule GenericFinderServerWeb.PageController do
  use GenericFinderServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def query(conn, _params) do
    conn
    |> assign(:result, GenericFinderServer.DbModel.Queries.selectOne)
    |> render("query.html")
  end

  def api(conn, _params) do
    conn
    |> assign(:result, GenericFinderServer.Api.Call.callApi)
    |> render("api.html")
  end

  def login(conn, %{"id" => id, "password" => password}) do
    GenericFinderServer.Login.Check.login(id, password)
  end

end
