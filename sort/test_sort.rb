# File:  test_sort.rb

require_relative 'sort'
require 'test/unit'

# Sort Testing Class
class TestSort < Test::Unit::TestCase
  def test_quicksort
    s = Sort.new
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
    c = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    tester = s.quicksort a

    assert_equal c, tester
  end

  def test_mergesort
    s = Sort.new
    b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
    c = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    tester = s.mergesort b

    assert_equal c, tester
  end

  def test_binary_search
    s = Sort.new
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
    tester = s.binary_search a, 3

    assert_equal 3, tester
  end
end
