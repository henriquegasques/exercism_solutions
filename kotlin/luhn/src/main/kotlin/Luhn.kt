object Luhn {

    fun isValid(candidate: String): Boolean {
        val withoutSpaces = candidate.replace(" ", "")

        if (withoutSpaces.length <= 1) return false
        if (withoutSpaces.toBigIntegerOrNull() == null) return false

        val chars = withoutSpaces.reversed().toCharArray()

        val sum =
                chars.foldIndexed(0) { index, acc, char ->
                    var digit = char.digitToInt()

                    if ((index + 1) % 2 == 0) {
                        digit = digit * 2
                        if (digit > 9) digit -= 9
                    }

                    acc + digit
                }

        return sum % 10 == 0
    }
}
