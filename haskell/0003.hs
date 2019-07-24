main = putStrLn $ show largestprimedivisor

bignum = 600851475143


-- shamelessly taken from haskell.org frontpage
-- really slow for p > 1_000_000 (~5 min)
primes = filterPrime [2..]
    where filterPrime (p:xs) =
            -- each new prime adds a new x `mod` p /= 0 condition
            p : filterPrime [x | x <- xs, x `mod` p /= 0]


-- this is techincally gives the largest factor below the square root, so this solution doesn't work for squarefree semiprimes.
largestprimedivisor = maximum $ filter (`divides` bignum) (takeWhile (< isqrt bignum) primes)
    where
        divides :: Int -> Int -> Bool
        x `divides` y = y `mod` x == 0

        isqrt :: Int -> Int
        isqrt = floor . sqrt . fromIntegral