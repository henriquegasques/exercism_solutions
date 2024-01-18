module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = isDivisibleBy 4 year && (not (isDivisibleBy 100 year) || isDivisibleBy 400 year)

isDivisibleBy :: Integer -> Integer -> Bool
isDivisibleBy n year = year `mod` n == 0
