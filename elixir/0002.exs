defmodule Problem2 do
  # The even fibonacci numbers are 0, 2, 8, 34, 144, ...
  # This satisfies the linear recurrence a(n) = 4a(n-1) + a(n-2)

  # Solving the linear recurrence, we obtain the explicit formula
  # evenfib = (n) => ((2+sqrt(5))**n - (2-sqrt(5))**n) / sqrt(5)

  # Realizing that the second term is absolutely less than 1/4, we may write
  # evenfib = (n) => floor((2+sqrt(5))**n / sqrt(5) + 1/4)

  # This can be solved explicitly for n; inverting this relation we obtain
  # evenfibindex = (F) => floor(log(F*sqrt(5) + 1/4, 2+sqrt(5)))
  def nthevenfib f do
    import :math
    log(f*sqrt(5) + 1/4) / log(2+sqrt(5)) |> trunc
  end

  def evenfib n do
    import :math
    (pow(2+sqrt(5), n) / sqrt(5) + 1/4) |> trunc
  end

  def mapreduce range, map_func, reduce_func do
    range |> Enum.map(map_func) |> Enum.reduce(0, reduce_func)
  end

  def solution do
    1..nthevenfib(4_000_000) |> mapreduce(&evenfib/1, &+/2)
  end
end


IO.puts "The solution is #{Problem2.solution}"