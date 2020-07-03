require("./enumerable")

# Testing `#my_each`
a1 = %w[a b c]
b1 = []
a1.my_each { |item| b1 << item }
raise("#my_each 0-1 Failed") unless a1 == b1

# !

# Testing `#my_each_with_index`
a2 = [9, 8, 7, 6, 5, 4, 3, 2, 1]
b2 = {}
a2.my_each_with_index { |item, index| b2[index] = item }
unless b2 == { 0 => 9, 1 => 8, 2 => 7, 3 => 6, 4 => 5, 5 => 4, 6 => 3, 7 => 2, 8 => 1 }
  raise("#my_each_with_index 0-1 Failed")
end

# !

# Testing `my_select`
raise("#my_select 0-1 Failed") unless [1, 2, 3, 4, 5].my_select(&:even?) == [2, 4]

# !

# Testing `#my_all?`
raise("#my_all? 0-1 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 3 } == true
raise("#my_all? 0-2 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 4 } == false

# !

# Testing `#my_any?`
raise("#my_any? 0-1 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 4 } == true
raise("#my_any? 0-2 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 5 } == false

# !

# Testing `#my_none?`
raise("#my_none? 0-1 Failed") unless %w[ant bear cat].my_none? { |word| word.length == 5 } == true
raise("#my_none? 0-2 Failed") unless %w[ant bear cat].my_none? { |word| word.length >= 4 } == false

# !

# Testing `#my_count`
raise("#my_count 0-1 Failed") unless [1, 2, 4, 2].my_count == 4

# !

# Testing `#my_map`
raise("#my_map 0-1 Failed") unless (1..4).my_map { |i| i * i } == [1, 4, 9, 16]

# !

# Testing `#my_inject`
raise("#my_inject 0-1 Failed") unless (5..10).my_inject { |sum, n| sum + n } == 45
unless %w[cat sheep bear].my_inject { |memo, word| memo.length > word.length ? memo : word } == "sheep"
  raise("#my_inject 0-2 Failed")
end
