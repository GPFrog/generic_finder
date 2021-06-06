defmodule GenericFinderServer.Medicine do
    defmodule Medicine do
        def getMedicine(startNum, endNum) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT code FROM Medicine ORDER BY code ASC LIMIT " <> Integer.to_string(startNum) <> "," <> Integer.to_string(endNum),
                []
            )
            # IO.puts query
            %MyXQL.Result{rows: result} = query
            # result가 list
            {:ok, file} = File.open("symptoms"<>Integer.to_string(startNum) <> "-" <> Integer.to_string(startNum+endNum-1) <>".csv", [:write, {:unicode, :utf8}])
            IO.binwrite(file, "\"증상\"\n")
            Enum.each(result, fn x ->
                txt = ((List.first(x) |> Integer.to_string()) |> GenericFinderServer.get_med_effect())
                IO.binwrite(file, txt)
            end)
#            txt = (result |> List.first() |> List.first() |> Integer.to_string() |> GenericFinderServer.get_med_effect())
#            IO.puts(txt)
#            IO.binwrite(file, txt)
            File.close(file)
            IO.puts(:ok)
        end
    end
end