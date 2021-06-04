defmodule GenericFinderServer.Sender do
    def send(address) do
        GenericFinderServer.Email.Email.send(address)
        |> GenericFinderServer.Mailer.deliver_now()
    end
end