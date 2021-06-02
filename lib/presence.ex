defmodule GenericFinderServer.Presence do
  use Phoenix.Presence,
    otp_app: :generic_finder,
    pubsub_server: GenericFinder.PubSub

    def join()
end