main = putStrLn $ show tripletproduct

triplet = [[x, y, z] | x <- [1..m], y <- [1..x], let z = m-x-y,x^2 + y^2 == z^2]
    where m = 1000

tripletproduct = product $ head triplet