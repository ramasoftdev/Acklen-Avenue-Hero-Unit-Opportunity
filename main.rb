# frozen_string_literal: true

# UserInput class handle each input type class
class UserInput
  attr_reader :input_class

  def initialize(input_class)
    @input_class = input_class
  end

  def perfom_add
    input_class.add
  rescue StandardError => e
    e.to_s
  end
end

# Given the user input is empty when calculating the sum then it should return zero.
class Input1
  attr_reader :input

  def initialize(input = nil)
    @input = input
  end

  def add
    return 0 if input.nil?
  end
end

# Given the user input is one number when calculating the sum then it should return the same number.
# (example "3" should equal 3)

# Given the user input is two numbers when calculating the sum then it should return the sum of those numbers.
# (example "1,2" should equal 3)
class Input2
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def add
    raise StandardError, "negatives not allowed: #{input.first}" if input.first.negative?
    input.first.to_i
  end
end

# # Given the user input is an unknown amount of numbers when calculating the sum then it should return the sum of all the numbers.
# (example "1,2,3" should equal 6)
# # Given the user input contains multiple negative numbers mixed with positive numbers when calculating the sum then
# it should throw an exception "negatives not allowed: x, y, z" (where x, y, z are only the negative numbers)
class Input3
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def add
    negatives = input.select(&:negative?)
    raise StandardError, "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    input.sum
  end
end

def add(input = nil)
  return UserInput.new(Input1.new(input)).perfom_add if input.nil?

  input = input.gsub(/[^Z0-9,-]/, ',').split(',').map(&:to_i).sort.reject { |a| a > 1000 }
  return UserInput.new(Input2.new(input)).perfom_add if input.size.eql?(1) || input.select(&:negative?).size.eql?(1)

  return UserInput.new(Input3.new(input)).perfom_add if input.size > 1 || input.select(&:negative?).size > 1
end

# p add(nil)
# p add('3')
# p add('1,2')
# p add('1,2,3')
# p add("1\n2,\n2,2,3")
# p add("//;\n1;2,1")
# p add("//;\n1;2,1,-1")
# p add("//;\n1;2,1,-1")
# p add("-10//;\n1;2,1,-1, -2, -3")
# p add("//;\n1;2,1,1002")
# p add("//[]\n12***3")
# p add("//[][%]\n12%3")