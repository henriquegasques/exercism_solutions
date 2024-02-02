module Raindrops (convert) where

convert :: Int -> String
convert n = if length result > 0 then result else show n
    where result = pling n <> plang n <> plong n

pling :: Int -> String
pling n = if isFactorOf 3 n then "Pling" else ""

plang :: Int -> String
plang n = if isFactorOf 5 n then "Plang" else ""

plong :: Int -> String
plong n = if isFactorOf 7 n then "Plong" else ""

isFactorOf :: Int -> Int -> Bool
isFactorOf n1 n2 = n2 `mod` n1 == 0
