defmodule RomanNumeralsTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert RomanNumerals.numeral(1) == "I"
  end

  test "2" do
    assert RomanNumerals.numeral(2) == "II"
  end

  test "3" do
    assert RomanNumerals.numeral(3) == "III"
  end

  test "4" do
    assert RomanNumerals.numeral(4) == "IV"
  end

  test "5" do
    assert RomanNumerals.numeral(5) == "V"
  end

  test "6" do
    assert RomanNumerals.numeral(6) == "VI"
  end

  test "9" do
    assert RomanNumerals.numeral(9) == "IX"
  end

  test "10" do
    assert RomanNumerals.numeral(10) == "X"
  end

  test "13" do
    assert RomanNumerals.numeral(13) == "XIII"
  end

  test "14" do
    assert RomanNumerals.numeral(14) == "XIV"
  end

  test "15" do
    assert RomanNumerals.numeral(15) == "XV"
  end

  test "16" do
    assert RomanNumerals.numeral(16) == "XVI"
  end

  test "19" do
    assert RomanNumerals.numeral(19) == "XIX"
  end

  test "20" do
    assert RomanNumerals.numeral(20) == "XX"
  end

  test "27" do
    assert RomanNumerals.numeral(27) == "XXVII"
  end

  test "29" do
    assert RomanNumerals.numeral(29) == "XXIX"
  end

  test "30" do
    assert RomanNumerals.numeral(30) == "XXX"
  end

  test "39" do
    assert RomanNumerals.numeral(39) == "XXXIX"
  end

  test "40" do
    assert RomanNumerals.numeral(40) == "XL"
  end

  test "44" do
    assert RomanNumerals.numeral(44) == "XLIV"
  end

  test "45" do
    assert RomanNumerals.numeral(45) == "XLV"
  end

  test "48" do
    assert RomanNumerals.numeral(48) == "XLVIII"
  end

  test "49" do
    assert RomanNumerals.numeral(49) == "XLIX"
  end

  test "50" do
    assert RomanNumerals.numeral(50) == "L"
  end

  test "51" do
    assert RomanNumerals.numeral(51) == "LI"
  end

  test "54" do
    assert RomanNumerals.numeral(54) == "LIV"
  end

  test "55" do
    assert RomanNumerals.numeral(55) == "LV"
  end

  test "57" do
    assert RomanNumerals.numeral(57) == "LVII"
  end

  test "59" do
    assert RomanNumerals.numeral(59) == "LIX"
  end

  test "64" do
    assert RomanNumerals.numeral(64) == "LXIV"
  end

  test "66" do
    assert RomanNumerals.numeral(66) == "LXVI"
  end

  test "78" do
    assert RomanNumerals.numeral(78) == "LXXVIII"
  end

  test "90" do
    assert RomanNumerals.numeral(90) == "XC"
  end

  test "93" do
    assert RomanNumerals.numeral(93) == "XCIII"
  end

  test "100" do
    assert RomanNumerals.numeral(100) == "C"
  end

  test "132" do
    assert RomanNumerals.numeral(132) == "CXXXII"
  end

  test "141" do
    assert RomanNumerals.numeral(141) == "CXLI"
  end

  test "163" do
    assert RomanNumerals.numeral(163) == "CLXIII"
  end

  test "166" do
    assert RomanNumerals.numeral(166) == "CLXVI"
  end

  test "174" do
    assert RomanNumerals.numeral(174) == "CLXXIV"
  end

  test "189" do
    assert RomanNumerals.numeral(189) == "CLXXXIX"
  end

  test "197" do
    assert RomanNumerals.numeral(197) == "CXCVII"
  end

  test "199" do
    assert RomanNumerals.numeral(199) == "CXCIX"
  end

  test "359" do
    assert RomanNumerals.numeral(359) == "CCCLIX"
  end

  test "400" do
    assert RomanNumerals.numeral(400) == "CD"
  end

  test "402" do
    assert RomanNumerals.numeral(402) == "CDII"
  end

  test "575" do
    assert RomanNumerals.numeral(575) == "DLXXV"
  end

  test "666" do
    assert RomanNumerals.numeral(666) == "DCLXVI"
  end

  test "782" do
    assert RomanNumerals.numeral(782) == "DCCLXXXII"
  end

  test "911" do
    assert RomanNumerals.numeral(911) == "CMXI"
  end

  test "1024" do
    assert RomanNumerals.numeral(1024) == "MXXIV"
  end

  test "1666" do
    assert RomanNumerals.numeral(1666) == "MDCLXVI"
  end

  test "3000" do
    assert RomanNumerals.numeral(3000) == "MMM"
  end

  test "3001" do
    assert RomanNumerals.numeral(3001) == "MMMI"
  end

  test "3999" do
    assert RomanNumerals.numeral(3999) == "MMMCMXCIX"
  end
end
