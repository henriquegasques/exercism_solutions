module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumber
    |> clearPhoneNumber
    |> validateNumber


clearPhoneNumber : String -> String
clearPhoneNumber phoneNumber =
    let
        clearedNumber = String.filter Char.isDigit phoneNumber
        hasContryCode = String.length clearedNumber == 11 && (clearedNumber |> String.startsWith "1")
    in
        if hasContryCode then clearedNumber |> String.replace "1" "" else clearedNumber


validateNumber : String -> Maybe String
validateNumber clearedNumber =
    if String.length clearedNumber == 10 && validateCodes clearedNumber then
        Just clearedNumber
    else
        Nothing


validateCodes : String -> Bool
validateCodes clearedPhoneNumber =
    let
        areaCode = String.slice 0 2 clearedPhoneNumber
        exchangeCode = String.slice 3 5 clearedPhoneNumber
    in
        validateCode exchangeCode && validateCode areaCode


validateCode : String -> Bool
validateCode code =
    not (code |> String.startsWith "0") && not (code |> String.startsWith "1")

