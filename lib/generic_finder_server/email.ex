defmodule GenericFinderServer.Email do
    defmodule Email do
        use Bamboo.Phoenix, view: MyApp.EmailView
        def send(email_address) do
            new_email
            |> to(email_address)
            |> from("tngh147258@naver.com")
            |> subject("Email_authentication")
            |> text_body("testing")
        end
    end
end