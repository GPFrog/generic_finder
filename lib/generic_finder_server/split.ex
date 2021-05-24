#사용 안함
defmodule Split do
    def split(list, rows) when rows <= 1 do
        IO.puts "split 마지막 시작"
        IO.puts(list[:CANCEL_NAME])
    end

    def split([head|tail], rows) do
        IO.puts Map.get(head, :CANCEL_NAME)
        IO.puts head
        IO.puts tail
        split(tail, rows - 1)
    end
end