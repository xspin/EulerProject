--Lattice paths
--Problem 15
--Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

--How many such routes are there through a 20×20 grid?
    --
{--*- coding: utf-8 -*--}
{-Copyright © 2014 Spin mail:code@e-spin.org-}

routes :: Int -> Int -> Int
routes 0 _ = 1
routes _ 0 = 1
routes m n 
    | m == n    = (*2) $ sum $ map (routes (n-1)) [0 .. n-1]  
    | otherwise = routes (m-1) n + routes m (n-1)

run :: Int -> Int -> Int
run 0 0 = 1
run 0 n = run 0 (n-1)
run m 0 = run (m-1) 0
run m n = run (m-1) n + run m (n-1)

comb n m = product [(n-m+1) .. n] `div`  product [1..m]

ro n = comb (n*2) n

main = print $ ro 20
