module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    @index = 0
    self.my_each do |elem|
      yield(elem, @index)
      @index += 1
    end
  end

  def my_select
    return self.to_enum unless block_given?
    matched = []
    self.my_each do |elem|
      case yield(elem)
      in true
        matched.push(elem)
      in false
      end
    end
    return matched
  end

  def my_all?
    return self.to_enum unless block_given?
    match = []
    self.my_each do |elem|
      if yield(elem)
        match.push(elem)
      end
    end
    if self.length == match.length
      true
    else
      false
    end
  end

  def my_any?
    match = []
    self.my_each do |elem|
      if yield(elem)
        match.push(elem)
      end
    end
    if match.length > 0
      true
    else
      false
    end
  end 
  
  def my_none?
    match = []
    self.my_each do |elem|
      if yield(elem)
        match.push(elem)
      end
    end
    if match.length == 0
      true
    else
      false
    end
  end

  def my_count
    return self.length unless block_given?
    match = []
    self.my_each do |elem|
      if yield(elem)
        match.push(elem)
      end
    end
    match.length
  end

  def my_map
    return self.to_enum unless block_given?
    mapped_arr = []
    self.my_each do |elem|
      mapped_arr << yield(elem)
    end
    mapped_arr
  end

  def my_inject(initial_value)
    final_value = nil
    self.my_each do |elem|
      if final_value == nil
        final_value = yield(initial_value, elem)
      else
        final_value = yield(final_value, elem)
      end
    end
    final_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    self.each do |elem|
      yield(elem)
    end
  end
end