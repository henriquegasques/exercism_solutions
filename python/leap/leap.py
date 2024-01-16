def leap_year(year):
    if divisible_by(400, year):
        return True
    elif divisible_by(100, year):
        return False
    else:
        return divisible_by(4, year)

def divisible_by(n, year):
    return (year % n == 0)
