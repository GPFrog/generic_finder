defmodule GenericFinderServer.MedicinePriceManagement do
    defmodule PriceEnroll do
        # medicine_code는 medicine_name으로 대체하고 name select해서 code 뽑아내고 그걸 insert하기
        def priceEnroll(email, medicine_code, price, bussiness_number) do
            current_time = NaiveDateTime.utc_now |> NaiveDateTime.to_date |> Date.to_string()

            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "INSERT INTO User_has_Medicine(User_eMail, Medicine_code, price, registeredDate, Pharmacy_bussinessNumber) VALUES (\'" <> email <> "\', " <> medicine_code <> ", " <> price <> ", \'" <> current_time <> "\', " <> bussiness_number <> ")",
                []
            )
            %MyXQL.Result{num_rows: distinct} = query
            IO.puts distinct
            if distinct == 0 do
                # 실패
                "false"
            else
                # 성공
                "true"
            end
        end
    end

    # 날짜 약국이름 약이름 가격
    defmodule PriceDelete do
        def priceDelete(email, date, bussiness_number, medicine_name, price) do
            #중복확인
            query = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "DELETE FROM generic_finder.User_has_Medicine 
                WHERE Medicine_code=(SELECT Medicine.code FROM Medicine WHERE name =\"" <> medicine_name <> "\") 
                AND User_has_Medicine.registeredDate=\"" <> date <> "\" 
                AND User_has_Medicine.Pharmacy_bussinessNumber=" <> bussiness_number <> " 
                AND User_has_Medicine.price=" <> price <> "
                AND User_has_Medicine.User_eMail=" <> email,
                []
            )
                        
            %MyXQL.Result{num_rows: distinct} = query


            unless distinct == 0 do
                # 성공
                "ok"
            else
                # 실패
                "error"
            end
        end
    end


    # request 약 이름
    # response 약국이름, 가격, 사용자이메일
    defmodule PriceLookup do
        def priceLookup(medicineName) do
            query1 = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT code FROM Medicine WHERE name=\"" <> medicineName <> "\"",
                []
            )
            %MyXQL.Result{num_rows: distinct, rows: row} = query1
            val = hd row |> hd
            IO.puts is_integer(val)
            #여기서 문제
            query2 = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT Pharmacy_bussinessNumber, price, User_eMail FROM User_has_Medicine WHERE Medicine_code=" <> Integer.to_string(val),
                []
            )
            %MyXQL.Result{num_rows: distinct, rows: row} = query2
            tmp = hd row
            tuple = List.to_tuple(tmp)
            bnumber = elem(tuple, 0) |> Integer.to_string
            price = elem(tuple, 1) |> Integer.to_string
            uemail = elem(tuple, 2)

            bnumber <> "/" <> price <> "/" <> uemail    
        end
    end

    defmodule PriceSelfLookup do
        def priceSelfLookup(email) do
            query1 = Ecto.Adapters.SQL.query!(
                GenericFinderServer.Repo,
                "SELECT registeredDate, Pharmacy_bussinessNumber, (SELECT Medicine.name FROM Medicine WHERE code=Medicine_code), price FROM generic_finder.User_has_Medicine WHERE User_eMail=\'" <> email <> "\'",
                []
            )
            %MyXQL.Result{num_rows: distinct, rows: row} = query1
            tmp = hd row
            if distinct == 0 do
                # 날짜 약국이름 약이름 가격
                "error"
            else
                row
            end
        end
    end
end