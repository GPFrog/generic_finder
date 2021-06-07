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
    # code, 제품명, 가격
    defmodule MedicineLookup do
        def medicineLookup(name, activeingredient, company, symptom) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT code, name, price FROM Medicine, Medicine_has_ActiveIngredient, Medicine_has_Symptom, Area_has_Medicine WHERE name LIKE \'%" <> name <> "%\' AND ActiveIngredient_name LIKE \'%" <> activeingredient <> "%\' AND Company_name LIKE \'%" <> company <> "%\' AND Symptom_name LIKE \'%" <> symptom <> "%\'",
                # "SELECT * FROM Medicine", 
                []
            )
            # IO.puts query
            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                "error"
            else
                result = ""
            val = hd row
            #일단 row하나만 받았을 경우
            tval = List.to_tuple(val)
            Integer.to_string(elem(tval,0)) <> "/" <> elem(tval,1) <> "/" <> Integer.to_string(elem(tval,2))
            end
            
        end
    end
end
