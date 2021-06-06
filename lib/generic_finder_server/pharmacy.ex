defmodule GenericFinderServer.Pharmacy do
    defmodule Pharmacy do
        def getPharmacy do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT bussinessNumber FROM Pharmacy",
                []
            )
            %MyXQL.Result{rows: tmp} = query
            #tuple로 결과 값 가져옴
            distinct = List.to_tuple(tmp)
            #사용시 이렇게
            value = hd elem(distinct, 0)
            
        end
    end
end