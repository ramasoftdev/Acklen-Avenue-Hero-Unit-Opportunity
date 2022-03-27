# frozen_string_literal: true

# test/main.rb
require_relative '../main'

describe 'Main' do
  # Given the user input is empty when calculating the sum then it should return zero.
  it do
    expect(add).to eql(0)
  end

  # Given the user input is one number when calculating the sum then it should return the same number.
  # (example "3" should equal 3)
  it do
    expect(add('3')).to eql(3)
  end

  # Given the user input is two numbers when calculating the sum then it should return the sum of those numbers.
  # (example "1,2" should equal 3)
  it do
    expect(add('1,2')).to eql(3)
  end

  # Given the user input is an unknown amount of numbers when calculating the sum then
  # it should return the sum of all the numbers.
  # (example "1,2,3" should equal 6)
  it do
    expect(add('1,2,3')).to eql(6)
  end

  # Given the user input is multiple numbers with new line and comma delimiters when calculating the sum
  # then it should return the sum of all the numbers. (example "1\n2,3" should equal 6)
  it('when user input is multiple numbers with new line comma delimiters, it should return the sum of those numbers') do
    expect(add("1\n2,\n2,2,3")).to eql(10)
  end

  # Given the user input is multiple numbers with a custom single-character delimiter when calculating the sum then.
  # it should return the sum of all the numbers (example “//;\n1;2” should return 3)
  it do
    expect(add("//;\n1;2,1")).to eql(4)
  end

  # Given the user input contains one negative number when calculating the sum then
  # it should throw an exception "negatives not allowed: x" (where x is the negative number).
  it do
    expect(add("//;\n1;2,1,-4")).to eq('negatives not allowed: -4')
  end

  # Given the user input contains multiple negative numbers mixed with positive numbers when calculating the sum
  # then it should throw an exception "negatives not allowed: x, y, z" (where x, y, z are only the negative numbers).
  it do
    expect(add("-10//;\n1;2,1,-4")).to eq('negatives not allowed: -10, -4')
  end

  # Given the user input contains numbers larger than 1000 when calculating the sum it should only sum the numbers less than 1001. (example 2 + 1001 = 2)
  it do
    expect(add("-10//;\n1;2,1,-4")).to eq('negatives not allowed: -10, -4')
  end

  # Given the user input is multiple numbers with a custom multi-character delimiter when calculating the sum then it should return the sum of all the numbers. (example: “//[]\n12***3” should return 15)
  it do
    expect(add("//[]\n12***3")).to eq(15)
  end

  # Given the user input is multiple numbers with multiple custom delimiters when calculating the sum then it should return the sum of all the numbers. (example “//[][%]\n12%3” should return 15)
  it do
    expect(add("//[][%]\n12%3")).to eq(15)
  end
end
