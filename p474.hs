import Data.List

num = 65432

f n = filter (\x -> mod x (10^n) == 0) $ map (* num) $ filter (\x -> mod x 10 /= 0) [1 .. 99999]

primes 1 = []
primes n 
    = let (Just a) = find (\i -> n `mod` i == 0) [2 .. n]
          in a : primes (n `div` a)

factor 1 = 1
factor n = n * factor (n-1)

main = do 
    print $ primes num
    print $ factor 1000000
