defmodule GenericFinderServerWeb.PageController do
  use GenericFinderServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # 쿼리문 예시파일
  def query(conn, _params) do
    conn
    # |> assign(:result, GenericFinderServer.DbModel.Queries.selectOne)
    |> assign(:result, GenericFinderServer.Pharmacy.Pharmacy.getPharmacy)
    |> render("query.html")
  end

  # api사용 예시파일
  def api(conn, _params) do
    conn
    |> assign(:result, GenericFinderServer.Api.Call.callApi)
    |> render("api.html")
  end

  def email(conn, %{"email" => email_address}) do
    json conn, GenericFinderServer.Test.start(conn, email_address, :email)
  end

  def certification(conn, %{"code" => code}) do
    json conn, GenericFinderServer.Test.start(conn, code, :certification)
  end

  def signin(conn, %{"id" => id, "password" => password}) do
    json conn, GenericFinderServer.Test.start(id, password, :signin)
  end

  def signup(conn, %{"id"=> id, "password" => password}) do
    json conn, GenericFinderServer.Test.start(id, :signup)
  end

  def withdraw(conn, %{"id" => id}) do
    json conn, GenericFinderServer.Test.start(id, :withdraw)
  end

  def blacklist(conn, %{"id" => id}) do
    json conn, GenericFinderServer.Test.start(id, :blacklist)
  end

   def medicineDetail(conn, %{"medicineCode" => medicineCode}) do
     json conn, GenericFinderServer.Test.start(medicineCode, :medicine)
     #json conn, GenericFinderServer.get_med_info(medicineCode)
   end

  def getPharmacyInfo(conn, %{"businessNum" => businessNum}) do
    json conn, GenericFinderServer.Test.start(businessNum, :pharmacy)
  end

  def medicine(conn, _params) do
    json conn, GenericFinderServer.Test.start(:medicine)
  end

  def medicinePriceEnroll(conn, %{"email" => email, "medicine_code" => medicine_code, "price" => price, "bussiness_number" => bussiness_number})do
    json conn, GenericFinderServer.Test.start(email, medicine_code, price, bussiness_number, :medicinePriceEnroll)
  end

  # def medicinePriceDelete()do
  #   json conn, GenericFinderServer.Test.start(medicineCode, :medicinePriceDelete)
  # end

  def medicinePriceLookup(conn, %{"medicineName" => medicineName}) do
    json conn, GenericFinderServer.Test.start(medicineName, :medicinePriceLookup)
  end
  
end
