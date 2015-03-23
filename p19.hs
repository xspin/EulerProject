--Counting Sundays
--Problem 19
--You are given the following information, but you may prefer to do some research for yourself.

--1 Jan 1900 was a Monday.
--Thirty days has September,
--April, June and November.
--All the rest have thirty-one,
--Saving February alone,
--Which has twenty-eight, rain or shine.
--And on leap years, twenty-nine.
--A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
--How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
    --

main = do
    print $ sum $ map sundays [1901 .. 2000]
    --print $ sunays 2014

sundays y = length $ filter (== 0) $ map (f y . snd) $ days y

f x y = (`mod` 7) $ x - 1 + div (x-1) 4 - div (x-1) 100 + div (x-1) 400 + y 

days y = let as = fol $ zip [1 .. 12] $ 1 : [0, 0 .. ]
             in if y `mod` 4 == 0 && y `mod` 400 /= 0 then map add as
                                                      else as
    where cal (m1, n) (m2, _)
            | any (== m1) [1, 3, 5, 7, 8, 10, 12] = (m2, n + 31)
            | m1 == 2 = (m2, n + 28)
            | otherwise = (m2, n + 30)
          add (m, n) = (m, n + if m > 2 then 1 else 0)
          fol [x] = [x]
          fol (x : y : xs) = let a = cal x y in x : fol (a : xs)
