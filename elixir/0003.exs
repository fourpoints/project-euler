defmodule Problem3 do
  @n 600_851_475_143

  # largest prime factor
  # \\ denotes default argument
  def lpf(n, i \\ 2) do
    case :math.pow(i, 2) <= n do
      true  -> case rem(n, i) == 0 do
          true  -> lpf(div(n, i), i)
          false -> lpf(n, i+1)
        end
      false -> n
    end
  end

  def solution do
    lpf @n
  end
end


IO.puts "The solution is #{Problem3.solution}"