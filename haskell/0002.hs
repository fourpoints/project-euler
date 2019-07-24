main = putStrLn $ show evenfibsum

evenfibsum = sum $ takeWhile (< 4000000) (filter even fibonacci)
    where
        -- shamelessly taken from the haskell wiki
        -- this sums an element with the next element in the sequence
        fibonacci = [0, 1] ++ zipWith (+) fibonacci (tail fibonacci)