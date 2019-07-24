main = putStrLn $ show lcdsmall

-- shamelessly taken from haskell.org frontpage / 0003
primes = filterPrime [2..]
    where filterPrime (p:xs) =
            p : filterPrime [x | x <- xs, x `mod` p /= 0]

ilog :: Int -> Int -> Int
ilog x y = floor (log (fromIntegral y) / log (fromIntegral x))

n = 20

lcdsmall = product $ map (\x -> x ^ ilog x n) (takeWhile (<n) primes)