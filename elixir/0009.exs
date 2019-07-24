defmodule Problem9 do
  @n 1000

  @spec Enum &&& Enum :: Enum
  def x &&& y do
    # Cartesian product
    for i <- x, j <- y, do: [i, j]
  end

  def triple [a, b] do
    [a, b, @n-a-b]
  end

  def pythagorean_triple? [a, b, c] do
    a*a + b*b == c*c
  end

  def product it do
      Enum.reduce(it,  &*/2)
  end

  def solution do
    (1..@n &&& 1..@n)
      |> Enum.map(&triple/1)
      |> Enum.filter(&pythagorean_triple?/1)
      |> Enum.at(0)
      |> product
  end
end


IO.puts "The solution is #{Problem9.solution}"