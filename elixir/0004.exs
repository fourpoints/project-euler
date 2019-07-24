defmodule Problem4 do
  def reverse_digits(n) when n == 0 do
    0
  end

  def reverse_digits(n) do
    rem(n, 10)*(:math.pow(10, :math.log10(n) |> trunc) |> trunc) + reverse_digits(div(n, 10))
  end

  def is_palindrome?(n) do
    n == reverse_digits n
  end

  @spec Enum &&& Enum :: Enum
  def x &&& y do
    # Cartesian product
    for i <- x, j <- y, do: [i, j]
  end

  def product it do
      Enum.reduce(it,  &*/2)
  end

  def largest_palindrome seq do
    seq |> Enum.filter(&is_palindrome?/1) |> Enum.max
  end

  def solution do
    (1..999 &&& 1..999) |> Enum.map(&product/1) |> largest_palindrome
  end
end


IO.puts "The solution is #{Problem4.solution}"