defmodule GenericFinderServer.Email do
    defmodule Email do
    #     import Bamboo.Email
        use Bamboo.Phoenix, view: GenericFinderServerWeb.Views.EmailView

          def welcome_email(email_address) do
            new_email(
              to: email_address,
              from: "tngh147258@gmail.com",
              subject: "Email_authentication",
              html_body: "<strong>test</strong>",
              text_body: "test!"
            )
          end

          def send(email_address) do
            GenericFinderServer.Email.Email.welcome_email(email_address)   # Create your email
            |> GenericFinderServer.Mailer.deliver_now() # Send your email
          end

          def certification(code) do

          end
    end
end