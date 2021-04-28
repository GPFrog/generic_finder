defmodule GenericFinderServer.DbModel do
    use Ecto.Schema

    schema "User" do
        field :eMail, :string
        field :passwd, :string
        field :authority, :string
    end
    
    defmodule Queries do
        def selectAll do
            # query = Ecto.Adapters.SQL.query!(
            #     GenericFinderServer.Repo,
            #     "SELECT * from User",
            #     []
            # )
            #     query[:ok] = 
            #     %MyXQL.Result{
            #         columns: [String],
            #         connection_id: Integer,
            #         last_insert_id: Integer,
            #         num_rows: Integer,
            #         num_warnings: Integer,
            #         rows: [[String]]
            #     } = query
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * from User",
                []
            )
            
            #나중에
            column = to_maps(query)
            column2 = hd column
            # column = get_query(query)
            # ["authority"]
            # case Jason.decode(resultQuery) do
            #     {:ok, todos_map_list} ->
                    
            #     err ->
            #         IO.puts("실패")
            #     end

            authority = column2["authority"]
            eMail = column2["eMail"]
            passwd = column2["passwd"]
            result = authority <> " " <> eMail <> " " <> passwd
            %GenericFinderServer.DbModel{result}
        end

        def get_query(%MyXQL.Result{columns: columns  , rows: rows}) do
            
        end

        def to_maps(%MyXQL.Result{columns: columns  , rows: rows}) do
            Enum.map(rows, fn row ->
              columns
              |> Enum.zip(row)
              |> Enum.into(%{})
              #|> Map.keys()
              #|> Map.get(str)
            end)
        end
    end
end