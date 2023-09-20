module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive integers are allowed"
    else runStep start 0

runStep num count =
    if num == 1 then Ok count
    else if (modBy 2 num == 0) then runStep (num // 2) (count + 1)
    else runStep (num * 3 + 1) (count + 1)

