defmodule GenericFinderServer.Api do

    defmodule Call do
        def callApi do
            #supervisor(NodeJS, [[path: "/node_app_root", pool_size: 4]])
            # NodeJS.start_link()
            # NodeJS.call("echo", ["hello"]) #=> {:ok, "hello"}
            # {result, "hello"}
            # %GenericFinderServer.Api{result}
        end
    end
end
