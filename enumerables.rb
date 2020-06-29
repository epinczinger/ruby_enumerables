# Custom Enumerable Methods
module ::Enumerable
  # Esteban: 3, 5, 7, 9, 11
  # Daniel: 4, 6, 8, 10

  # Loops, Calling The Block With Item And Index
  def my_each_with_index(&block)
    for index in 0...count
      block.call(self[index], index)
    end
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns false or nil.
  def my_all?(&block)
    my_each_with_index do |item, _index|
      false if block.call(item) != true
    end

    true
  end

  # def my_none?end

  # def my_mapend
end

[9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index { |item, index| p([index, item]) }

raise("#my_all 0-1 Failed") unless %w[ant bear cat].my_all? { |word| word.length >= 3 } == true
raise("#my_all 0-1 Failed") unless %w[ant bear cat].all? { |word| word.length >= 4 } == false
