local BankAccount = {}

function BankAccount:new()
    local instance = { open = true, bal = 0 }
    setmetatable(instance, self)
    self.__index = self

    return instance
end

function BankAccount:balance() return self.bal end
function BankAccount:close() self.open = false end

function BankAccount:deposit(amount)
    assert(self.open, "Cannot operate on a closed account")
    assert(amount > 0, "Operation amount must be positive")

    self.bal = self.bal + amount
end

function BankAccount:withdraw(amount)
    assert(self.open, "Cannot operate on a closed account")
    assert(amount > 0, "Operation amount must be positive")
    assert(amount <= self.bal, "Not enough funds")

    self.bal = self.bal - amount
end

return BankAccount
