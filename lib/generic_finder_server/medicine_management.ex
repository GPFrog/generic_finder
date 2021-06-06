defmodule GenericFinderServer.MedicineManagement do
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

    # 제품명, 주성분, 제조사, 유효증상
    # 제품명, 가격
    # defmodule MedicineLookup do
    #     def medicineLookup(name, ) do

    #     end
    # end

    
end