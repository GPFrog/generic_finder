defmodule Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_call({:medicine, medKey}, _from, state) do
    IO.puts("process #{inspect(self)} fetching medicine number: #{medKey}")
    {:reply, GenericFinderServer.get_med_info(medKey), state}
  end

  def handle_call({:pharmacy, businessNum}, _from, state) do
    IO.puts("process #{inspect(self)} fetching pharmacy businessNumber: #{businessNum}")
    {:reply, GenericFinderServer.get_pharm_info(businessNum), state}
  end

  # 블랙리스트 등록
  def handle_call({:blacklist, id}, _from, state) do
    # IO.puts("process #{inspect(self)} fetching pharmacy businessNumber: #{businessNum}")
    {:reply, GenericFinderServer.UserManagement.Blacklist.blacklist(id), state}
  end

  # 인증 이메일 발송
  def handle_call({:email, conn, email_address}, _from, state) do
    {:reply, GenericFinderServer.Email.Email.send(conn, email_address), state}
  end

  # 인증 이메일 검증
  def handle_call({:certification, conn, code}, _from, state) do
    {:reply, GenericFinderServer.Email.Email.certification(conn, code), state}
  end

  # 로그인
  def handle_call({:signin, id, password}, _from, state) do
    {:reply, GenericFinderServer.UserManagement.Signin.signin(id, password), state}
  end

   # 회원가입
   def handle_call({:signup, id, password}, _from, state) do
    {:reply, GenericFinderServer.UserManagement.Signup.signup(id, password), state}
  end

  # 회원탈퇴
  def handle_call({:withdraw, id}, _from, state) do
    {:reply, GenericFinderServer.UserManagement.Withdraw.withdraw(id), state}
  end

  # 약 가격 등록
  def handle_call({:medicinePriceEnroll, email, medicine_code, price, bussiness_number}, _from, state) do
    {:reply, GenericFinderServer.MedicinePriceManagement.PriceEnroll.priceEnroll(email, medicine_code, price, bussiness_number), state}
  end

  # # 약 가격 삭제
  # def handle_call({:medicinePriceDelete, email, medicine_code, price, bussiness_number}, _from, state) do
  #   {:reply, GenericFinderServer.MedicinePriceManagement.PriceDelete.priceDelete(id), state}
  # end

  # # 약 가격 조회
  # def handle_call({:medicinePriceLookup, medicineName}, _from, state) do
  #   {:reply, GenericFinderServer.MedicinePriceManagement.PriceLookup.priceLookup(medicineName), state}
  # end
end