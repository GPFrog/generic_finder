defmodule GenericFinderServer.DbModel do
    use Ecto.Schema

    schema "User" do
        field :eMail, :string
        field :passwd, :string
        field :authority, :string
    end
    
    defmodule Queries do
        def selectOne do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * from User",
                []
            )
            
            #나중에
            column = to_maps(query)
            column2 = hd column

            authority = column2["authority"]
            eMail = column2["eMail"]
            passwd = column2["passwd"]
            result = "authority : " <> authority <> ", eMail : " <> eMail <> ", passwd : " <> passwd



            
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