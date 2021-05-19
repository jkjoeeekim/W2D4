# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    num1_multiples = []
    num2_multiples = []
    (1..(num_1 * num_2)).to_a.each do |multiplier|
        num1_multiples << num_1 * multiplier
        num2_multiples << num_2 * multiplier
    end
    num1_multiples.each do |int|
        return int if num2_multiples.include?(int)
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_hash = Hash.new { |hash, key| hash[key] = 0 }
    (0...(str.length - 1)).to_a.each do |idx|
        bigram = str[idx] + str[idx + 1]
        bigram_hash[bigram] += 1
    end
    most_frequent = bigram_hash.values.max
    bigram_hash.select { |key, value| value == most_frequent }.keys.join
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inversed_hash = Hash.new
        self.each { |key, value| inversed_hash[value] = key }
        inversed_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = self.combination(2).to_a
        pairs.count { |pair| pair.sum == num }
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        not_sorted = true

        while not_sorted
            not_sorted = false
            (0...(self.length - 1)).each do |idx|
                a = self[idx]
                b = self[idx + 1]
                if prc.call(a, b) == 1
                    not_sorted = true
                    self[idx] = b
                    self[idx + 1] = a
                end
            end
        end
        self
    end
end