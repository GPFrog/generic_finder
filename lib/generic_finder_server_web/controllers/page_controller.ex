defmodule GenericFinderServerWeb.PageController do
  use GenericFinderServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # 쿼리문 예시파일
  def query(conn, _params) do
    conn
    |> assign(:result, GenericFinderServer.DbModel.Queries.selectOne)
    |> render("query.html")
  end

  # api사용 예시파일
  def api(conn, _params) do
    conn
    |> assign(:result, GenericFinderServer.Api.Call.callApi)
    |> render("api.html")
  end

  def email(conn, %{"email" => email_address}) do
    GenericFinderServer.Email.Email.send(conn, email_address)
    conn
    |> assign(:result, "ok")
    |> render("email.html")
  end

  #미구현
  def certification(conn, %{"code" => code}) do
    result = GenericFinderServer.Email.Email.certification(conn, code)
    conn
    |> assign(:result, result)
    |> render("certification.html")
  end

  def signin(conn, %{"id" => id, "password" => password}) do
    conn
    |> assign(:result, GenericFinderServer.UserManagement.Signin.signin(id, password))
    |> render("signin.html")
  end

  def signup(conn, %{"id"=> id, "password" => password}) do
    conn
    |> assign(:result, GenericFinderServer.UserManagement.Signup.signup(id, password))
    |> render("signup.html")
  end

  def withdraw(conn, %{"id" => id}) do
    conn
    |> assign(:result, GenericFinderServer.UserManagement.Withdraw.withdraw(id))
    |> render("withdraw.html")
  end

  def blacklist(conn, %{"id" => id}) do
    conn
    |> assign(:result, GenericFinderServer.UserManagement.Blacklist.blacklist(id))
    |> render("blacklist.html")
  end
end
