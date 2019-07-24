main = putStrLn $ show nthprime

-- shamelessly taken from haskell.org frontpage / 0003
primes = filterPrime [2..]
    where filterPrime (p:xs) =
            p : filterPrime [x | x <- xs, x `mod` p /= 0]


-- (!!) looks ugly
-- -1 corrects for 0-indexing; we want the 10_001th element
nthprime = primes !! (10001 - 1)