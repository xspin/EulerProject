--Number letter counts
--Problem 17
--If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

--If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


--NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
    --

main = do 
    print $ sum $ map (numLen . translate) [1..1000] 
    --putStr $ unlines $ map (words' . translate) [300..320]
    let a = translate 1020
    print $ words' a
    print $ numLen a

numbers = [ (-1, "and")
          , (0, "")
          , (1, "one")
          , (2, "two")
          , (3, "three")
          , (4, "four")
          , (5, "five")
          , (6, "six")
          , (7, "seven")
          , (8, "eight")
          , (9, "nine")
          , (10, "ten")
          , (11, "eleven")
          , (12, "twelve")
          , (13, "thirteen")
          , (14, "fourteen")
          , (15, "fifteen")
          , (16, "sixteen")
          , (17, "seventeen")
          , (18, "eighteen")
          , (19, "nineteen")
          , (20, "twenty")
          , (30, "thirty")
          , (40, "forty")
          , (50, "fifty")
          , (60, "sixty")
          , (70, "seventy")
          , (80, "eighty")
          , (90, "ninety")
          , (100, "hundred")
          , (1000, "thousand")
          ]

words' Nothing = ""
words' (Just ns) = unwords ns
translate :: Int -> Maybe [String]
translate n = mapM (\m -> lookup m numbers) $ refresh $ helper n
    where helper n 
            = let a = show n 
                  in let len = length a - 1
                         in zipWith (\k m -> (read [m]) * 10 ^ (len - k)) [0 ..] a
          refresh n = re n 0
          f n k m = if k>0 then [-1, div n m, m] else [div n m, m]
          re (n:ns) k
            | n >= 1000         = f n k 1000 ++ re ns (k+1)
            | n >= 100          = f n k 100 ++ re ns (k+1)
            | n > 10 && k > 0   = [-1, n] ++ re ns (k+1)
            | n == 10           = (if k > 0 then [-1] else [])  ++ [last ns +10]
            | n == 0 && length ns == 1 && ns /= [0] = [-1] ++ ns
            | otherwise         = n:ns

numLen :: Maybe [String] -> Int
numLen Nothing = 0
numLen (Just ns) = sum $ map length ns
