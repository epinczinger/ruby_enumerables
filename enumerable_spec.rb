require("./enumerable")

# Testing `#my_each`
my_each_array = []
%w[a b c].my_each { |item| my_each_array << item }
raise("#my_each 0-1 Failed") unless my_each_array == %w[a b c]

my_each_range = []
(1..4).my_each { |item| my_each_range << item - 1 }
raise("#my_each 0-2 Failed") unless my_each_range == [0, 1, 2, 3]

my_each_hash = []
{ "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |item| my_each_hash << item[0] }
raise("#my_each 0-3 Failed") unless my_each_hash == ["Jane Doe", "Jim Doe"]

# !

# Testing `#my_each_with_index`
my_each_with_index_hash = {}
[9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index do |item, index|
  my_each_with_index_hash[index] = item
end
unless my_each_with_index_hash == { 0 => 9, 1 => 8, 2 => 7, 3 => 6, 4 => 5, 5 => 4, 6 => 3, 7 => 2, 8 => 1 }
  raise("#my_each_with_index 0-1 Failed")
end

# !

# Testing `my_select`
raise("#my_select 0-1 Failed") unless [1, 2, 3, 4, 5].my_select(&:even?) == [2, 4]
raise("#my_select 0-2 Failed") unless (0..10).my_select(&:even?) == [0, 2, 4, 6, 8, 10]

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
add_proc = proc { |item| item + item }
raise("#my_map 0-1 Failed") unless (1..4).my_map { |i| i * i } == [1, 4, 9, 16]
raise("#my_map 0-2 Failed") unless [2, 4, 6].my_map(&add_proc) == [4, 8, 12]

# !

# Testing `#my_inject`
raise("#my_inject 0-1 Failed") unless (5..10).my_inject { |sum, n| sum + n } == 45
unless %w[cat sheep bear].my_inject { |memo, word| memo.length > word.length ? memo : word } == "sheep"
  raise("#my_inject 0-2 Failed")
end

# !

# Testing `#multiple_els`
def multiply_els(array)
  #  Multiplies all the elements of the array together
  array.my_inject { |accumulator, current_item| accumulator * current_item }
end

raise("#multiply_els 0-1 Failed") unless multiply_els([2, 4, 5]) == 40
