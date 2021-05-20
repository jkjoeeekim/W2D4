def no_dupes?(arr)
    singles = []
    until arr.empty?
        ele = arr.shift
        if arr.include?(ele)
            arr.delete(ele)
        else
            singles << ele
        end
    end
    singles
end

# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.
# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         == [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     == ['y']
# p no_dupes?([true, true, true])            == []


def no_consecutive_repeats?(arr)
    (0...(arr.length - 1)).none? do |idx|
        arr[idx] == arr[idx + 1]
    end
end

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.
# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     == true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     == false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              == true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              == false
# p no_consecutive_repeats?(['x'])                              == true


def char_indices(str)
    char_idx_hash = Hash.new { |hash, key| hash[key] = [] }
    str.chars.each_with_index { |char, idx| char_idx_hash[char] << idx }
    char_idx_hash
end

# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.
# # Examples
# p char_indices('mississippi')   == {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     == {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    counter_hash = Hash.new { |hash, key| hash[key] = 0 }
    str.chars { |char| counter_hash[char] += 1 }
    longest = counter_hash.sort { |a, b| a[1] <=> b[1] }.last
    longest[0] * longest[1]
end

# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.
# # Examples
# p longest_streak('a')           == 'a'
# p longest_streak('accccbbb')    == 'cccc'
# p longest_streak('aaaxyyyyyzz') == 'yyyyy'
# p longest_streak('aaabbb')      == 'bbb'
# p longest_streak('abc')         == 'c'


def bi_prime?(num)
    (2...num).any? do |int1|
        (2...num).any? do |int2|
            both_prime?(int1, int2) && (int1 * int2 == num)
        end
    end
end

def both_prime?(num1, num2)
    return false if num1 < 2 || num2 < 2
    (2...num1).none? { |factor| num1 % factor == 0 } && (2...num2).none? { |factor| num2 % factor == 0 }
end

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or p not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.
# # Examples
# p bi_prime?(14)   == true
# p bi_prime?(22)   == true
# p bi_prime?(25)   == true
# p bi_prime?(94)   == true
# p bi_prime?(24)   == false
# p bi_prime?(64)   == false
# p both_prime?(2, 2)     == true
# p both_prime?(3, 4)     == false
# p both_prime?(9, 7)     == false
# p both_prime?(31, 47)   == true

def vigenere_cipher(str, arr)
    alpha = ("a".."z").to_a
    str.chars.each_with_index do |char, idx|
        key = arr[idx % arr.length]
        alpha_idx = alpha.index(char)
        new_char = alpha[(alpha_idx + key) % 26]
        str[idx] = new_char
    end
    str
end

# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.
# Examples
# p vigenere_cipher("toerrishuman", [1])        == "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     == "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  == "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            == "ceerd"
# p vigenere_cipher("yawn", [5, 1])             == "dbbo"


def vowel_rotate(str)
    last_vowel = str[str.rindex(/[aeiou]/)]
    str.chars.each_with_index do |char, idx|
        if 'aeiou'.include?(char)
            str[idx] = last_vowel
            last_vowel = char
        end
    end
    str
end

# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.
# # Examples
p vowel_rotate('computer')      == "cempotur"
p vowel_rotate('oranges')       == "erongas"
p vowel_rotate('headphones')    == "heedphanos"
p vowel_rotate('bootcamp')      == "baotcomp"
p vowel_rotate('awesome')       == "ewasemo"