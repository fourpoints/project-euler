main = putStrLn $ show largestpalindrome

largestpalindrome = maximum [x*y | (x, y) <- threedigit, ispalindrome $ x*y]
    where
        ispalindrome :: Int -> Bool
        ispalindrome x = show x == reverse (show x)

        -- three digit numbers
        threedigit :: [(Int, Int)]
        threedigit = [(x,y) | x <- [100..999], y <- [100..999]]