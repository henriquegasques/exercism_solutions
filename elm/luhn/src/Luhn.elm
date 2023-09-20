module Luhn exposing (valid)


valid : String -> Bool
valid input =
    let
        inputWithoutSpaces = String.replace " " "" input
        numList = List.filterMap String.toInt <| String.split "" inputWithoutSpaces
        origLen = String.length inputWithoutSpaces
        digitsLen = List.length numList
        sum = List.sum <| List.indexedMap doubleEverySecond <| List.reverse numList
    in
        if digitsLen <= 1 || digitsLen /= origLen then False
        else remainderBy 10 sum == 0

doubleEverySecond : Int -> Int -> Int
doubleEverySecond index elem =
    let
        isEven = remainderBy 2 (index + 1) == 0
    in
    if isEven then
        let doubled = elem * 2 in
        if doubled > 9 then doubled - 9 else doubled
    else elem
