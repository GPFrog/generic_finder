defmodule GenericFinderServer.Medicine do
    defmodule Medicine do
        def getMedicine do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT code FROM Medicine",
                []
            )
            # IO.puts query
            %MyXQL.Result{rows: result} = query
            # result가 list
        end
    end
end