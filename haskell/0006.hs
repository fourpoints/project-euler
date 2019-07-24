main = putStrLn $ show squaresumsumsquaredifference

-- bad variable name
squaresumsumsquaredifference = abs ((sum $ map (^2) xs) - (sum xs)^2)
    where xs = [1..100]