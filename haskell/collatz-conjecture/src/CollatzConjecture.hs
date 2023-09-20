module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just (calculateSteps n 0)

calculateSteps :: Integer -> Integer -> Integer
calculateSteps n steps
  | n == 1 = steps
  | even n = calculateSteps (n `div` 2) (steps + 1)
  | otherwise = calculateSteps (3 * n + 1) (steps + 1)
