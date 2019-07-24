defmodule Problem5 do
  def gcd(a, b) do
    case b==0 do
      true  -> a
      false -> gcd(b, rem(a, b))
    end
  end

  def lcm(a, b) do
    div(abs(a*b), gcd(a,b))
  end

  def lcm_seq nums do
    nums |> Enum.reduce(1, &lcm/2)
  end

  def solution do
    1..20 |> lcm_seq
  end
end


IO.puts "The solution is #{Problem5.solution}"
