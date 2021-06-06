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
                "{result: duplication}"
            else
                # 존재하지 않음
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "INSERT INTO User(eMail, passwd, authority) VALUES (\""<> id <> "\", \""<> password <>"\", 1)",
                    []
                )
                "{result: ok}"
            end
        end
    end

    defmodule Signin do
        def signin(id, password) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT authority FROM User WHERE eMail = \"" <> id <> "\" AND passwd = \"" <> password <> "\"",
                []
            )

            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                # 일치하지 않음
                "{result: error}"
            else
                # 일치함
                val = hd row |> hd

                "{" <> "result: ok, value: " <> val <> "}"
            end
        end
    end

    defmodule Withdraw do
        def withdraw(id) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT * FROM User WHERE eMail = \"" <> id <> "\"",
                []
            )

            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                # 일치하지 않음
                "{result: error}"
            else
                # 일치함
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "DELETE FROM User WHERE eMail = \"" <> id <> "\"",
                    []
                )
                "{result: ok}"
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
            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                # 등록실패
                "{result: error}"
            else
                # 등록성공
                "{result: ok}"
            end
        end
    end
end