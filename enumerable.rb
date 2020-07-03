# Custom Enumerable Methods
module ::Enumerable
  # Esteban: 3, 5, 7, 9, 11
  # Daniel: 4, 6, 8, 10

  
  def my_each
    return to_enum unless block_given?

    length.times { |n| yield self[n] }
    self
  end


  # Loops, Calling The Block With Item And Index
  def my_each_with_index(&block)
    for index in 0...count
      block.call(self[index], index)
    end
  end


  def my_select
    return to_enum unless block_given?

    array = []
    my_each do |n|
      array << n if yield n
    end
    array
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns false or nil.
  def my_all?(&block)
    my_each_with_index do |item, _index|
      return false if block.call(item) != true
    end

    true
  end

  def my_any?(&block)
    my_each_with_index do |item, _index|
      return true if block.call(item) == true
    end

    false
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
