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
                "duplication"
            else
                # 존재하지 않음
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "INSERT INTO User(eMail, passwd, authority) VALUES (\""<> id <> "\", \""<> password <>"\", 1)",
                    []
                )
                "ok"
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
                "error"
            else
                # 일치함
                "ok"
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

            %MyXQL.Result{num_rows: distinct} = query
            if distinct == 0 do
                # 일치하지 않음
                "error"
            else
                # 일치함
                query = Ecto.Adapters.SQL.query!(
                    GenericFinderServer.Repo,
                    "DELETE FROM User WHERE eMail = \"" <> id <> "\"",
                    []
                )

                "complete"
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
                "error"
            else
                # 등록성공
                "complete"
            end
        end
    end
end