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

  # def my_all?end

  # def my_none?end

  # def my_mapend
end

[9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index { |item, index| p([index, item]) }
