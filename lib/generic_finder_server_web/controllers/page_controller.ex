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

  def medicineDetail(conn, %{"medicineCode" => medicineCode}) do
    json conn, GenericFinderServer.Test.start(medicineCode, :medicine)
    #json conn, GenericFinderServer.get_med_info(medicineCode)
  end

  def pharmacy(conn, %{"businessNum" => businessNum}) do
    json conn, GenericFinderServer.Test.start(businessNum, :pharmacy)
    #json conn, GenericFinderServer.get_pharm_info(businessNum)
  end
end
