--Longest Collatz sequence
--Problem 14
--The following iterative sequence is defined for the set of positive integers:

--n  n/2 (n is even)
--n  3n + 1 (n is odd)

--Using the rule above and starting with 13, we generate the following sequence:

--13  40  20  10  5  16  8  4  2  1
--It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

--Which starting number, under one million, produces the longest chain?

--NOTE: Once the chain starts the terms are allowed to go above one million.

{--*- coding: utf-8 -*--}
{-Copyright © 2014 Spin mail:code@e-spin.org-}
import Data.Time
import System.CPUTime

collatz n = collatz' 1 n
    where
    collatz' m 1 = m
    collatz' m n = collatz' (m+1) $ if odd n then (n *3 +1) else (n `div` 2)

maxCollatz n = f n (0, 0)
    where 
          f 0 m = m
          f n m@(_, t) = let m' = collatz n 
                      in f (n-1) $ if m' > t then (n, m') else m

set a n b = take n a ++ [b] ++ drop (n+1) a

hehe n = let (a, b) = divMod (n-1) 3 
             in b == 0 && (odd a) && n > 4

maxCollatz' n = foldl h [0, 0 ..] $ filter hehe [1 .. n]
    where g n = if odd n then (n *3 +1) else (n `div` 2)
          f 1 a = set a 1 1
          f n a = if a !! n > 0 then a
                                else let a' = f (g n) a in set a' n (1 + a' !! (g n)) 
          h xs m = let ys = f m xs in if ys !! m > ys !! (head xs) then set ys 0 m
                                                                   else set ys 0 (head xs)

main = do
    getCurrentTime >>= print
    start <- getCPUTime
    --print $ length $ filter hehe [1..1000000]
    --print $ take 10 $ maxCollatz' 10000
    --print $ collatz 13
    print $ maxCollatz 1000000
    --getCurrentTime >>= print
    end <- getCPUTime
    let time =  read $ show $ (end - start) `div` 10^8
    print $ time / 10000
