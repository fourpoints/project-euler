main = putStrLn $ show primesum

-- shamelessly taken from haskell.org frontpage / 0003
primes = filterPrime [2..]
    where filterPrime (p:xs) =
            p : filterPrime [x | x <- xs, x `mod` p /= 0]

-- slow (~55min)
primesum = sum $ takeWhile (<2000000) primes

