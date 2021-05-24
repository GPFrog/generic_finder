defmodule GenericFinderServer.Login do
    defmodule Check do
        def login(id, password) do
            # query = Ecto.Adapters.SQL.query!(
            #     GenericFinderServer.Repo,
            #     "SELECT * FROM User WHERE id = " <> id <> "password = " <> password,
            #     []
            # )

            # column = to_maps(query)
            # column2 = hd column
            # IO.puts(column2)
            
            # result
            # HTTPoison
             

        end

        def to_maps(%MyXQL.Result{columns: columns  , rows: rows}) do
            Enum.map(rows, fn row ->
              columns
              |> Enum.zip(row)
              |> Enum.into(%{})
            end)
        end
    end
end