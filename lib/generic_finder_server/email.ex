defmodule GenericFinderServer.Email do
    defmodule Email do
        use Bamboo.Phoenix, view: MyApp.EmailView
        def send(email_address) do
            new_email
            |> to(email_address)
            |> from("us@example.com")
            |> subject("Welcome!")
            |> text_body("Welcome to MyApp!")
        end
    end
end