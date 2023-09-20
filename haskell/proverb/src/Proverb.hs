module Proverb(recite) where

recite :: [String] -> String
recite [] = ""
recite wordList = say wordList <> "And all for the want of a " <> head wordList <> "."

say :: [String] -> String
say (thing:otherThing:rest) = "For want of a " <> thing <> " the " <> otherThing <> " was lost.\n" <> say (otherThing:rest)
say _ = ""
