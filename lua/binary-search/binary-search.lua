return function(array, target)
    local from = 1
    local to = #array

    while from <= to do
        local middle = math.floor((from + to + 1) / 2)
        local current = array[middle]

        if current == target then return middle end
        if current < target then from = middle + 1 else to = middle - 1 end
    end

    return -1
end
