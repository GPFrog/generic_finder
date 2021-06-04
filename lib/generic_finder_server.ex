defmodule GenericFinderServer do
  @moduledoc """
  GenericFinderServer keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @impl Crawly.Spider
  def base_url(), do: ""

  def medicine_url(), do: "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq="

  def businessNum_url(), do: "https://bizno.net/article/"

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.homebase.co.uk/our-range/tools"
      ]
    ]
  end

  def get_med_info(itemSeq) do
    response = Crawly.fetch(medicine_url()<>itemSeq)
    {:ok, document} = Floki.parse_document(response.body)
    (document |> Floki.find(".s-dr_table.dr_table_type1 tr") |> Floki.text()) #기본 정보
    <> "\n" <> (document |> Floki.find(".note") |> Floki.text()) #유효성분
    <> "\n" <> (document |> Floki.find("#_ee_doc") |> Floki.text()) #효능효과
    <> "\n" <> (document |> Floki.find("#_ud_doc") |> Floki.text()) #용법용량
    <> "\n" <> (document |> Floki.find("#_nb_doc") |> Floki.text()) #사용상주의사항
  end

  def get_pharm_info(businessNum) do
    response = Crawly.fetch(businessNum_url() <> businessNum)
    {:ok, document} = Floki.parse_document(response.body)
    (document |> Floki.find(".table_guide01 tr") |> Floki.text()) #가게 명
    <> "\n" <> (document |> Floki.find("tr") |> Floki.text() |> String.split("회사주소", parts: 2)
                |> List.last() |> String.split("결산월") |> List.first())
  end

  crawlFlag = %{
    medicine: 0,
    pharmacy: 1,}
end
