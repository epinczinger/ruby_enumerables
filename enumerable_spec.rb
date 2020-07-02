require("./enumerable")

# [9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index { |item, index| p([index, item]) }

raise("#my_all 0-1 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 3 } == true
raise("#my_all 0-2 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 4 } == false

raise("#my_none? 0-1 Failed") unless %w[ant bear cat].my_none? { |word| word.length == 5 } == true
raise("#my_none? 0-2 Failed") unless %w[ant bear cat].my_none? { |word| word.length >= 4 } == false
