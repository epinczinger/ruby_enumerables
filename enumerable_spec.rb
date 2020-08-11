# Testing `#multiple_els`
def multiply_els(array)
  #  Multiplies all the elements of the array together
  array.my_inject { |accumulator, current_item| accumulator * current_item }
end

raise("#multiply_els 1 Failed") unless multiply_els([2, 4, 5]) == 40
