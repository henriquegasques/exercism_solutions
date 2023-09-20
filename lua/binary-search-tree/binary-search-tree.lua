local BinarySearchTree = { val = nil, left = nil, right = nil  }

function BinarySearchTree:new(val)
    local instance = { value = val }
    setmetatable(instance, self)
    self.__index = self

    return instance
end

function BinarySearchTree:insert(value)
    if value <= self.value then
        if self.left == nil then
            self.left = BinarySearchTree:new(value)
        else
            self.left.insert(value)
        end
    else
        if self.right == nil then
            self.right = BinarySearchTree:new(value)
        else
            self.right.insert(value)
        end
    end
end

return BinarySearchTree
