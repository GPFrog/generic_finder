defmodule GenericFinderServer.Email do
    defmodule Email do
    use Bamboo.Phoenix, view: GenericFinderServerWeb.Views.EmailView
    alias Randomizer

    #세션 결국 값 저장 불러오기 못함
    def make_email(conn, email_address) do
      code = Randomizer.randomizer(10)
      IO.puts code
      Plug.Conn.put_session(conn, code, {email_address, NaiveDateTime.utc_now})
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      Plug.Conn.delete_session(conn, code)
      # Plug.Conn.clear_session(conn)
      # new_email(
      #   to: email_address,
      #   from: "tngh147258@gmail.com",
      #   subject: "Email_certification",
      #   html_body: "<strong>인증번호는 " <> code <> "입니다.</strong>",
      #   text_body: ""
      # )
    end

    def send(conn, email_address) do
      GenericFinderServer.Email.Email.make_email(conn, email_address)   # Create your email
      # |> GenericFinderServer.Mailer.deliver_now() # Send your email
    end

    def certification(conn, code) do
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      IO.puts(Plug.Conn.get_session(conn, code))
      if Plug.Conn.get_session(conn, code) != nil do
        {email_address, upload_time} = Plug.Conn.get_session(conn, code)
        current_time = NaiveDateTime.utc_now
        diff_time = NaiveDateTime.diff(upload_time, current_time)
        #성공
        if diff_time < 300 do
          :ets.delete(:user_lookup, code)
          result = "success"
        #실패
        else
          :ets.delete(:user_lookup, code)
          result = "timeover"
        end
      else
        result = "incorrect"
      end
    end
  end
end