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
      return false if block.call(item) != true
    end

    true
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns true for all elements.
  def my_none?(&block)
    my_each_with_index do |item, _index|
      return false if block.call(item) == true
    end

    true
  end

  # Returns a new array with the results of running block once for every element in enum.
  def my_map(&block)
    transformed =
      my_each_with_index do |item, _index|
        return block.call(item)
      end

    transformed
  end

  # my_inject
end
