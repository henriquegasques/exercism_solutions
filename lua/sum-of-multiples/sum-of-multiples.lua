return function(numbers)
  return {
    to = function(limit)
      local sum = 0
      local multiples = {}

      for i = 0, limit-1 do
        if multiples[i] then goto continue end

        for _, number in ipairs(numbers) do
          if i % number == 0 then multiples[i] = true end
        end

        ::continue::
      end

      for multiple, _ in pairs(multiples) do sum = sum + multiple end

      return sum
    end
  }
end
