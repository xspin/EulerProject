--Power digit sum
--Problem 16
--215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

--What is the sum of the digits of the number 21000?
    --

main = do
    print $ digitSum $ 2 ^ 1000
    print $ sum $ map (read . (: [])) $ show $ 2^1000

digitSum n = helper n 0
    where 
    helper 0 s = s
    helper n s = let (ds, d) = n `divMod` 10 in helper ds (s+d)
