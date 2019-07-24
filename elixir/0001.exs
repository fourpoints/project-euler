# https://github.com/JordiPolo/euler_on_elixir/blob/master/lib/001.ex

defmodule Problem1 do
  defp sum_multiples x, factors do
    multiples = fn(x) ->
      Enum.map(factors, fn(y) -> rem(x, y) == 0 end) |> Enum.any?
    end

    x |> Enum.filter(multiples) |> Enum.sum
  end

  def solution do
    sum_multiples(1..999, [3, 5])
  end
end


IO.puts "The solution is #{Problem1.solution}"