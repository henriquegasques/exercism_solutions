module Luhn
  def self.valid?(input : String) : Bool
    digits = input.delete(" ").chars

    return false if digits.size <= 1

    doubled_digits = double_every_second_digit_from_right(digits)

    doubled_digits.sum.divisible_by? 10
  rescue ArgumentError
    false
  end

  def self.double_every_second_digit_from_right(digits)
    digits.reverse.map_with_index(1) do |digit, index|
      next digit.to_i if index.odd?

      doubled = digit.to_i * 2
      doubled > 9 ? doubled - 9 : doubled
    end
  end
end
