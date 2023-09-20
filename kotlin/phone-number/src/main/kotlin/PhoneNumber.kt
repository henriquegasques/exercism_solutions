import kotlin.text.replace

class PhoneNumber {
    var number: String = ""

    constructor(inputNumber: String) {
        number = inputNumber.replace(" ", "").replace(Regex("[^0-9]"), "")

        if (number.length == 11) {
            if (!number.startsWith("1")) { throw IllegalArgumentException() }
            number = number.removePrefix("1")
        }

        if (number.length != 10) throw IllegalArgumentException()
        if (number.startsWith("1") || number.startsWith("0")) throw IllegalArgumentException()
        if (number.elementAt(3) == '1' || number.elementAt(3) == '0') throw IllegalArgumentException()
    }
}
