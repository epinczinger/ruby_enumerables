require("./enumerable")

# [9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index { |item, index| p([index, item]) }

# Testing `#my_all?`
raise("#my_all? 0-1 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 3 } == true
raise("#my_all? 0-2 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 4 } == false

# Testing `#my_none?`
raise("#my_none? 0-1 Failed") unless %w[ant bear cat].my_none? { |word| word.length == 5 } == true
raise("#my_none? 0-2 Failed") unless %w[ant bear cat].my_none? { |word| word.length >= 4 } == false

# Testing `#my_map`
raise("#my_map 0-1 Failed") unless (1..4).map { |i| i * i } == [1, 4, 9, 16]

# Testing `#my_any?`
raise("#my_any? 0-1 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 4 } == true
raise("#my_any? 0-2 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 5 } == false
