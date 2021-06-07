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
                []
            )
            # IO.puts query
            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                "error/error/1234"
            else
                result = ""
            val = hd row
            #일단 row하나만 받았을 경우
            tval = List.to_tuple(val)
            Integer.to_string(elem(tval,0)) <> "/" <> elem(tval,1) <> "/" <> Integer.to_string(elem(tval,2))
            end
            
        end
    end
    
    defmodule MedicineLookup do
        def medicineLookup(name) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT code, name, price FROM Medicine, Medicine_has_ActiveIngredient, Medicine_has_Symptom, Area_has_Medicine WHERE name LIKE \'%" <> name <> "%\'",
                []
            )
            # IO.puts query
            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                "error/nameerror/1234"
            else
                result = ""
            val = hd row
            #일단 row하나만 받았을 경우
            tval = List.to_tuple(val)
            Integer.to_string(elem(tval,0)) <> "/" <> elem(tval,1) <> "/" <> Integer.to_string(elem(tval,2))
            end
            
        end
    end
    

    # 코드받기
    # 사진, 의약품명, 제조사, 약품모양, 장축, 단축, 성분, 효능, 복용법, 주의사항, 유통기한, 포장정보, 지역평균가격, 사용자등록가격[리스트]
    defmodule MedicineDetailLookup do
        def medicineDetailLookup(code) do
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT User_eMail, price FROM User_has_Medicine WHERE Medicine_code=" <> code,
                []
            )
            %MyXQL.Result{num_rows: distinct, rows: row} = query
            if distinct == 0 do
                "error"
            else
            val = hd row
            tval = List.to_tuple(val)
            # User_eMail
            elem(tval, 0)
            # price
            elem(tval, 1)
            end
        end
    end
end
