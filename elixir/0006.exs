defmodule Problem6 do
  def square x do :math.pow(x, 2) |> trunc end

  def square_sum x do (x |> Enum.sum |> square) end

  def sum_square x do (x |> Enum.map(&square/1) |> Enum.sum) end

  def func_difference(x, f, g) do f.(x) - g.(x) end

  def solution do
    1..100 |> func_difference(&square_sum/1, &sum_square/1)
  end
end


IO.puts "The solution is #{Problem6.solution}"