require("./enumerable")

# Testing `#my_each`
my_each_array = []
%w[a b c].my_each { |item| my_each_array << item }
raise("#my_each 1 Failed") unless my_each_array == %w[a b c]

my_each_range = []
(1..4).my_each { |item| my_each_range << item - 1 }
raise("#my_each 2 Failed") unless my_each_range == [0, 1, 2, 3]

my_each_hash = []
{ "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |item| my_each_hash << item[0] }
raise("#my_each 3 Failed") unless my_each_hash == ["Jane Doe", "Jim Doe"]

# !

# Testing `#my_each_with_index`
my_each_with_index_hash = {}
[9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index do |item, index|
  my_each_with_index_hash[index] = item
end
unless my_each_with_index_hash == { 0 => 9, 1 => 8, 2 => 7, 3 => 6, 4 => 5, 5 => 4, 6 => 3, 7 => 2, 8 => 1 }
  raise("#my_each_with_index 1 Failed")
end

# !

# Testing `my_select`
raise("#my_select 1 Failed") unless [1, 2, 3, 4, 5].my_select(&:even?) == [2, 4]
raise("#my_select 2 Failed") unless (0..10).my_select(&:even?) == [0, 2, 4, 6, 8, 10]

# !

# Testing `#my_all?`
raise("#my_all? 1 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 3 } == true
raise("#my_all? 2 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 4 } == false
raise("#my_all? 3 Failed") unless (0..10).my_all? { |number| number < 100 } == true
raise("#my_all? 4 Failed") unless %w[ant bear cat].my_all?(/t/) == false
raise("#my_all? 5 Failed") unless [1, 2i, 3.14].my_all?(::Numeric) == true
raise("#my_all? 6 Failed") unless [nil, true, 99].my_all? == false
raise("#my_all? 7 Failed") unless [].my_all? == true

# !

# Testing `#my_any?`
raise("#my_any? 1 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 4 } == true
raise("#my_any? 2 Failed") unless %w[ant bear cat].my_any? { |word| word.length >= 5 } == false
raise("#my_any? 3 Failed") unless %w[ant bear cat].my_any?(/d/) == false
raise("#my_any? 4 Failed") unless [nil, true, 99].my_any?(::Integer) == true
raise("#my_any? 5 Failed") unless [nil, true, 99].my_any? == true
raise("#my_any? 6 Failed") unless [].my_any? == false

# !

# Testing `#my_none?`
raise("#my_none? 1 Failed") unless %w[ant bear cat].my_none? { |word| word.length == 5 } == true
raise("#my_none? 2 Failed") unless %w[ant bear cat].my_none? { |word| word.length >= 4 } == false
raise("#my_none? 3 Failed") unless %w[ant bear cat].none?(/d/) == true
raise("#my_none? 4 Failed") unless [1, 3.14, 42].none?(::Float) == false
raise("#my_none? 5 Failed") unless [].none? == true
raise("#my_none? 6 Failed") unless [nil].none? == true
raise("#my_none? 7 Failed") unless [nil, false].none? == true
raise("#my_none? 8 Failed") unless [nil, false, true].none? == false

# !

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
