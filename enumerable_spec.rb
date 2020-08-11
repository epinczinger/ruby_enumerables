
# Testing `#my_count`
raise("#my_count 1 Failed") unless [1, 2, 4, 2].my_count == 4
raise("#my_count 2 Failed") unless [1, 2, 4, 2].my_count(2) == 2
raise("#my_count 3 Failed") unless [1, 2, 4, 2].my_count(&:even?) == 3

# !

# Testing `#my_map`
add_proc = proc { |item| item + item }
raise("#my_map 1 Failed") unless (1..4).my_map { |i| i * i } == [1, 4, 9, 16]
raise("#my_map 2 Failed") unless [2, 4, 6].my_map(&add_proc) == [4, 8, 12]

# !

# Testing `#my_inject`
raise("#my_inject 1 Failed") unless (5..10).my_inject(:+) == 45
raise("#my_inject 2 Failed") unless (5..10).my_inject { |sum, n| sum + n } == 45
unless %w[cat sheep bear].my_inject { |memo, word| memo.length > word.length ? memo : word } == "sheep"
  raise("#my_inject 3 Failed")
end
raise("#my_inject 4 Failed") unless (5..10).my_inject(1, :*) == 151_200
raise("#my_inject 5 Failed") unless (5..10).my_inject(1) { |product, n| product * n } == 151_200

# !

# Testing `#multiple_els`
def multiply_els(array)
  #  Multiplies all the elements of the array together
  array.my_inject { |accumulator, current_item| accumulator * current_item }
end

raise("#multiply_els 1 Failed") unless multiply_els([2, 4, 5]) == 40
