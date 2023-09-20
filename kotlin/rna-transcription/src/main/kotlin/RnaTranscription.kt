fun transcribeToRna(dna: String): String {
    val rnaComplements = mapOf('C' to 'G', 'G' to 'C', 'T' to 'A', 'A' to 'U')
    val result = dna.map { rnaComplements[it] }.joinToString("")

    return result
}
