def multiply(num1, num2)
    return num1 if num1 == 0
    return num2 if num2 == 0
    return num1 if num2 == 1

    (num1 = num1.abs) && (num2 = num2.abs) if num1 < 0 && num2 < 0
    if num1 > 0 && num2 < 0
        num2 = num2.abs
        num1 -= (num1 + num1)
    end
    
    num2 < 0 ? num2 += 1 : num2 -= 1

    num1 + multiply(num1, num2)
end

# Write a method multiply(a, b) that takes in two numbers and returns their product. Solve this recursively (no loops!). Do not use the multiplication operator.
# Examples
# p multiply(3, 5)        == 15
# p multiply(5, 3)        == 15
# p multiply(2, 4)        == 8
# p multiply(0, 10)       == 0
# p multiply(-3, -6)      == 18
# p multiply(3, -6)       == -18
# p multiply(-3, 6)       == -18


def lucas_sequence(num)
    lucas_numbers = [2, 1]

    return [] if num == 0
    return [lucas_numbers[0]] if num == 1
    return lucas_numbers if num == lucas_numbers.length

    lucas_numbers = lucas_sequence(num - 1)
    lucas_numbers << (lucas_numbers[-1] + lucas_numbers[-2])
end

# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...
# Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.
# Examples
# p lucas_sequence(0)     == []
# p lucas_sequence(1)     == [2]    
# p lucas_sequence(2)     == [2, 1]
# p lucas_sequence(3)     == [2, 1, 3]
# p lucas_sequence(6)     == [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)     == [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    return [num] if is_prime?(num)

    prime_factors = []
    prime_factors << first_factor(num)
    next_num = num / first_factor(num)
    prime_factors << prime_factorization(next_num)
    prime_factors.flatten
end

def first_factor(num)
    (2..num).each { |factor| return factor if num % factor == 0 }
end

def is_prime?(num)
    return false if num < 2

    (2...num).none? { |factor| num % factor == 0 }
end

# The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.
# Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. This means that the array should contain only prime numbers that multiply together to the given num. The array returned should contain numbers in ascending order. Do this recursively.
# Examples
# p prime_factorization(12)       == [2, 2, 3]
# p prime_factorization(24)       == [2, 2, 2, 3]
# p prime_factorization(25)       == [5, 5]
# p prime_factorization(60)       == [2, 2, 3, 5]
# p prime_factorization(7)        == [7]
# p prime_factorization(11)       == [11]
# p prime_factorization(2017)     == [2017]

# p is_prime?(2)
# p is_prime?(1)
# p is_prime?(4)
# p is_prime?(5)

# p first_factor(6)
# p first_factor(7)