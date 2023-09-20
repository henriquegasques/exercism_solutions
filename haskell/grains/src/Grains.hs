module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n <= 0 || n >= 65 = Nothing
  | otherwise = Just(last $ take (fromInteger n) $ iterate (* 2) 1)

total :: Integer
total =
  case square 64 of
  Just  x -> x * 2 - 1 -- I could just hardcode 18446744073709551615..
  Nothing -> 0
