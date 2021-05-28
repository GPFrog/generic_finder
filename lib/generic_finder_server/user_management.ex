defmodule GenericFinderServer.UserManagement do
    defmodule Signup do
        def signup(id, password) do
            #중복확인
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * FROM User WHERE eMail = \"" <> id <> "\" AND passwd = \"" <> password <> "\"",
                []
            )
            
            %MyXQL.Result{num_rows: distinct} = query

            IO.puts distinct

            unless distinct == 0 do
                # 이미 존재
                result = "duplication"
            else
                # 존재하지 않음
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "INSERT INTO User(eMail, passwd, authority) VALUES (\""<> id <> "\", \""<> password <>"\", 1)",
                    []
                )
                
                result = "ok"
            end
        end
    end

    defmodule Signin do
        def signin(id, password) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * FROM User WHERE eMail = \"" <> id <> "\" AND passwd = \"" <> password <> "\"",
                []
            )

            %MyXQL.Result{num_rows: distinct} = query
            if distinct == 0 do
                # 일치하지 않음
                result = "error"
            else
                # 일치함
                result = "ok"
            end

            # column = to_maps(query)
            # column2 = hd column

            # IO.puts column2

        end

        # def to_maps(%MyXQL.Result{columns: columns  , rows: rows}) do
        #     Enum.map(rows, fn row ->
        #       columns
        #       |> Enum.zip(row)
        #       |> Enum.into(%{})
        #     end)
        # end
    end

    defmodule Withdraw do
        def withdraw(id) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * FROM User WHERE eMail = \"" <> id <> "\"",
                []
            )

            %MyXQL.Result{num_rows: distinct} = query
            if distinct == 0 do
                # 일치하지 않음
                result = "error"
            else
                # 일치함
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "DELETE FROM User WHERE eMail = \"" <> id <> "\"",
                    []
                )

                result = "complete"
            end
        end
    end

    defmodule Blacklist do
        def blacklist(id) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "UPDATE User SET authority = 3 WHERE eMail = \"" <> id <> "\"",
                []
            )
            %MyXQL.Result{num_rows: distinct} = query
            if distinct == 0 do
                # 등록실패
                result = "error"
            else
                # 등록성공
                result = "complete"
            end
        end
    end
end