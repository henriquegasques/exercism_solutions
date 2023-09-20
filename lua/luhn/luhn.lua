return {
  valid = function(s)
      if #s <= 1 then return false end

      local without_spaces = s:gsub("%s+", "")
      local shouldDouble = false
      local sum = 0

      for digit in without_spaces:gmatch("%d") do
          digit = tonumber(digit)
          if digit == nil then return false end

          if shouldDouble then digit = digit * 2 end
          if digit > 9 then digit = digit - 9 end

          sum = sum + digit
          shouldDouble = not shouldDouble
      end

      if sum % 10 == 0 then return true else return false end
  end
}
