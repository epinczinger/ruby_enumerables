# Custom Enumerable Methods
module ::Enumerable
  # Calls block with the item for each item in enum.
  def my_each
    return to_enum unless block_given?

    size.times { |n| yield(to_a[n]) }
    self
  end

  # Loops, Calling The Block With Item And Index
  def my_each_with_index
    return to_enum unless block_given?

    # Starting At `-1` So First Time Incremented Will Be 0
    index = -1
    size.times { |n| yield(to_a[n], index += 1) }
    self
  end

  # Returns an array containing all elements of enum for which the given block returns a true value.
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
  def my_all?(argument = nil)
    if argument.class == ::Regexp
      # Regular Expression
      my_each { |item| return false if item.match(argument).nil? == false }
    elsif argument.is_a?(::Class)
      # Class
      my_each { |item| return false unless item.is_a?(argument) == true }
    else
      # Default
      my_each { |item| return false unless item.nil? == false && yield(item) == true }
    end

    true
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block ever returns a value other than false or nil.
  def my_any?(argument = nil)
    if argument.class == ::Regexp
      # Regular Expression
      my_each { |item| return true if item.match(argument).nil? == false }
    elsif argument.is_a?(::Class)
      # Class
      my_each { |item| return true if item.is_a?(argument) == true }
    elsif block_given? == false && argument.nil?
      # No Argument && No Block
      my_each { |item| return true unless item.nil? == true }
    else
      # Default
      my_each { |item| return true if item.nil? == false && yield(item) == true }
    end

    false
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns true for all elements.
  def my_none?(argument = nil, &block)
    # If `my_any?` True Then False Else True
    my_any?(argument, &block) != true
  end

  # Returns the number of items in enum through enumeration.
  # If an argument is given, the number of items in enum that are equal to item are counted.
  # If a block is given, it counts the number of elements yielding a true value.
  def my_count(*args)
    @var = to_a
    arr = []

    if block_given?
      my_each { |n| arr << n if yield n }
      arr.length
    else
      !args.empty? ? @var.length - (to_a - args.to_a).length : to_a.length
    end
  end

  # Returns a new array with the results of running block once for every element in enum.
  def my_map()
    return to_enum unless block_given?

    transformed = []
    to_a.my_each { |item| transformed << (!proc.nil? ? proc.call(item) : yield(item)) }

    transformed
  end

  # Combines all elements of enum by applying a binary operation,
  # specified by a block or a symbol that names a method or operator.
  def my_inject(*arguments)
    array = to_a.clone

    # Gather Symbol If No Block is Provided
    symbol = arguments.pop unless block_given?

    # Our Result Begins With The Suplied Argument Or First Item Of The Array
    accumulator = arguments.empty? == false ? arguments.shift : array.shift

    if symbol.class == ::Symbol
      # Handle Symbol
      array.my_each do |item|
        # We Accumulate The Result Returned From Applying The Symbol To Accumulator And Current Item
        accumulator = accumulator.__send__(symbol, item)
      end
    else
      # Default
      array.my_each do |item|
        # We Accumulate The Result Returned From The Block
        accumulator = yield(accumulator, item)
      end
    end

    accumulator
  end
end
