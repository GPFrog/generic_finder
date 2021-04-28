defmodule GenericFinderServerWeb.ApiController do
    use GenericFinderServerWeb, :controller

    def api(conn, _params) do
        conn
        |> assign(:user, GenericFinderServer.Api.Call.callApi)
        |> render(conn, "api.html")
    end
end