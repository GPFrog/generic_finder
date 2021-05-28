defmodule GenericFinderServer.Api do
    defmodule Call do
        def callApi do
            url = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService1/getMdcinPrductList"
            <> "?ServiceKey=82RghzhLBOKluQ4%2BruQ%2FMgzMOuO8fpCtgk23n8kDm%2BrbpjWSVA520gLHKsa%2BHAragYtt%2BpNSaaUa0WWqCcRGOw%3D%3D"
            <> ""

            #파싱완료
            getter = HTTPoison.get(url)
            xmlMap = elem(getter, 1)
            xml = xmlMap.body
            result = XmlToMap.naive_map(xml)
            
            response = Map.get(result, "response")
            body = Map.get(response, "body")
            # 행 갯수
            rows = Map.get(body, "numOfRows")
            |> String.to_integer
            items = Map.get(body, "items")
            item = Map.get(items, "item")

            #정보별로 리스트 생성
            cancelDate = Enum.map(item, fn (x) -> x["CANCEL_DATE"] end)
            List.insert_at(["cancelDate"], String.to_integer("0"), cancelDate)
            cancelName = Enum.map(item, fn (x) -> x["CANCEL_NAME"] end)
            entpName = Enum.map(item, fn (x) -> x["ENTP_NAME"] end)
            induty = Enum.map(item, fn (x) -> x["INDUTY"] end)
            itemIngrCnt = Enum.map(item, fn (x) -> x["ITEM_INGR_CNT"] end)
            itemIngrName = Enum.map(item, fn (x) -> x["ITEM_INGR_NAME"] end)
            itemName = Enum.map(item, fn (x) -> x["ITEM_NAME"] end)
            itemPermitDate = Enum.map(item, fn (x) -> x["ITEM_PERMIT_DATE"] end)
            itemSeq = Enum.map(item, fn (x) -> x["ITEM_SEQ"] end)
            permitKindCode = Enum.map(item, fn (x) -> x["PERMIT_KIND_CODE"] end)
            prdlstStdrCode = Enum.map(item, fn (x) -> x["PRDLST_STDR_CODE"] end)
            prductPrmisnNo = Enum.map(item, fn (x) -> x["PRDUCT_PRMISN_NO"] end)
            prductType = Enum.map(item, fn (x) -> x["PRDUCT_TYPE"] end)
            spcltyPblc = Enum.map(item, fn (x) -> x["SPCLTY_PBLC"] end)
            
            IO.puts cancelDate

            # zip = Enum.zip(cancelDate, cancelName, entpName, induty, 
            # itemIngrCnt, itemIngrName, itemName, itemPermitDate, itemSeq, 
            # permitKindCode, prdlstStdrCode, prductPrmisnNo, prductType, spcltyPblc)

            # result = Poison.encode!(zip)
            
            #이제 클라로 보내기
            # result
        end
    end
end
