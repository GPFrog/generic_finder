defmodule GenericFinderServerWeb.DbController do
    use GenericFinderServerWeb, :controller

    def query(conn, _params) do
        conn
        |> assign(:result, GenericFinderServer.DbModel.Queries.selectAll)
        |> render(conn, "query.html")
    end
end