module Luhn (isValid) where

import Data.Char

isValid :: String -> Bool
isValid n
  | length digits == 1 = False
  | otherwise = luhnChecksum digits `mod` 10 == 0
  where digits = listOfDigitsFrom n

luhnChecksum :: [Int] -> Int
luhnChecksum = sum . doubleEverySecond . reverse

listOfDigitsFrom :: String -> [Int]
listOfDigitsFrom rawString = map digitToInt $ filter isDigit rawString

doubleEverySecond :: [Int] -> [Int]
doubleEverySecond (x:second:xs) = x : doubleSubNine second : doubleEverySecond xs
doubleEverySecond x = x

doubleSubNine :: Int -> Int
doubleSubNine n = if doubled > 9 then doubled - 9 else doubled
  where doubled = 2 * n
