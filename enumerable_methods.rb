module Enumerable
  def my_each
    if block_given?
      for element in self
        yield(element)
      end
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      for element in self
        yield(element, i)
        i += 1
      end
    end
  end

  def my_select
    if block_given?
      arr = []
      self.my_each do |element|
        result = yield(element)
        if result
          arr << element
        end
      end
    end
    puts arr
  end

  def my_all?
    if block_given?
      truthy = true
      self.my_each do |element|
        result = yield(element)
        if result == false
          truthy = false
        end
      end
      puts truthy
    end
  end

  def my_any?
    if block_given?
      fallacy = false
      self.my_each do |element|
        result = yield(element)
        if result == true
          fallacy = true
        end
      end
      #puts fallacy
      fallacy
    end
  end

  def my_none?
    result = self.my_any? {|element| yield(element)}
    #checks if my_any? is false, if it is false,
    #that means that there are none and this method should return true
    puts !result
  end

  def my_count(num=nil)
    count = 0
    if block_given?
      self.my_each {|element| count += 1 if yield(element)}
    else
      if num == nil
        count = self.length
      else
        self.my_each {|element| count += 1 if element == num}
      end
    end
    count
  end

  def my_map
    arr = []
    if block_given?
      self.my_each {|element| arr << yield(element)}
    end
    puts arr
  end

  def my_inject
    var = self.first
    if block_given?
      self.my_each do |element|
        if element == var
          next
        end
        var = yield(var, element)
      end
    end
    puts var
  end
end

def multiply_els(arr)
  arr.my_inject {|calc, n| calc * n}
end

=begin

["a", 4, "C"].my_each do |x|
  print "#{x}, "
end

#%w is another way to type an array
%w("a" 4 "c").my_each_with_index do |x, index|
  print "item: #{x} index: #{index}, "
end

[1, 2, 3, 4, 5].my_select {|num| num.even?}

["ant", "bear", "cat"].my_all? {|word| word.length >= 3}
["ant", "bear", "cat"].my_all? {|word| word.length >= 4}

["ant", "bear", "cat"].my_any? {|word| word.length >= 3}
["ant", "bear", "cat"].my_any? {|word| word.length >= 5}

["ant", "bear", "cat"].my_none? {|word| word.length >= 3}
["ant", "bear", "cat"].my_none? {|word| word.length >= 5}

arr = [1, 2, 4, 2]
arr.my_count
arr.my_count(2)
arr.my_count{|x| x%2 == 0}

(1..4).my_map {|i| i**2}

multiply_els([2,4,5])

(5..10).my_inject {|sum, n| sum + n}
(5..10).my_inject {|product, n| product * n}
%w{cat sheep bear}.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
=end
