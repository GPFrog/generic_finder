defmodule GenericFinderServer.Api do

    defmodule Call do
        def callApi do
            # supervisor(NodeJS, [[path: "/generic_finder_server", pool_size: 4]])
            # supervisor(NodeJS, [[path: "/node_app_root", pool_size: 4]])
            NodeJS.start_link()
            # NodeJS.call("echo", ["hello"]) #=> {:ok, "hello"}
            # NodeJS.call!("echo", ["hello"]) #=> "hello"
            result = NodeJS.call({"math", :add}, [1, 2]) # => {:ok, 3}

            :ok
        end
    end
end
