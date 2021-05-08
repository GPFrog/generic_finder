defmodule GenericFinderServer.Api do
    defmodule Call do
        # defp printItems(map_list) do
        #     Enum.each(map_list, fn %{"id" => id, "title" => title} ->
        #         IO.puts "ID:#{id} , #{title}"
        #     end
        #     )
        # end

        # # status_code가 200 인 경우 
        # defp bodyProc(200,body) do
        #     case Jason.decode(body) do
        #       {:ok, todos_map_list} ->
        #         Enum.filter(todos_map_list, fn %{"completed" => completed} -> completed == false end)
        #           |> printItems
        #       err -> 
        #           IO.puts "Json Decoding 실패 : #{inspect err}"
        #     end
        # end

        # # status_code가 200(성공) 이 아닌경우 
        # defp bodyProc(status_code, body) do
        #     IO.puts "Status code가 200 이 아닙니다. : #{status_code}"
        #     IO.puts "Body : #{inspect body}"
        # end

#        def callApi do
#            url = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService1/getMdcinPrductList"
#            <> "?ServiceKey=82RghzhLBOKluQ4%2BruQ%2FMgzMOuO8fpCtgk23n8kDm%2BrbpjWSVA520gLHKsa%2BHAragYtt%2BpNSaaUa0WWqCcRGOw%3D%3D"
#            <> ""
#            # "https://jsonplaceholder.typicode.com/todos"
#
#            {:ok, result} = HTTPoison.get url
#            IO.puts(result)
#            xml = XmlToMap.naive_map(result)
#            xmlResult = map[body:]
#            IO.puts(xmlResult)
#            #   {:ok,%{body: body, status_code: status_code}} ->
#            #       bodyProc(status_code, body)
#            #   {:error, error} ->
#            #       IO.puts "오류 발생 : #{inspect error}"
#
#        end
    end
end
