gem 'test-unit'
require 'test/unit'
require './matrix'

class MatrixTesting < Test::Unit::TestCase
  def test_multiply
    original =  Matrix.[]([1,1], [1,1])
    expected_result =  Matrix.[]([2,2], [2,2])

    result = original * original
    assert_equal(expected_result, result)

    original.multiply!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_multiply
    original =  Matrix.[]([1,1], [1,1])
    expected_result =  Matrix.[]([5,5], [5,5])

    result = original.scalar_multiply(5)
    assert_equal(expected_result, result)

    original.scalar_multiply!(5)
    assert_equal(expected_result, original)
  end

  def test_inverse
    original =  Matrix.[]([2,1], [1,2])
    expected_result =  Matrix.[]([2.0/3.0,-1.0/3.0], [-1.0/3.0,2.0/3.0])

    result = original.inverse
    assert_equal(expected_result, result)

    original.inverse!
    assert_equal(expected_result, original)
  end

  def test_divide
    original =  Matrix.[]([2,1], [1,2])
    expected_result =  Matrix.I(2)

    result = original / original
    assert_equal(expected_result, result)

    original.divide!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_divide
    original =  Matrix.[]([2,2], [2,2])
    expected_result =  Matrix.[]([1,1], [1,1])

    result = original.scalar_divide(2)
    assert_equal(expected_result, result)

    original.scalar_divide!(2)
    assert_equal(expected_result, original)
  end

  def test_add
    original =  Matrix.[]([1,1], [1,1])
    expected_result =  Matrix.[]([2,2], [2,2])

    result = original + original
    assert_equal(expected_result, result)

    original.add!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_add
    original =  Matrix.[]([1,1], [1,1])
    expected_result =  Matrix.[]([2,2], [2,2])

    result = original.scalar_add(1)
    assert_equal(expected_result, result)

    original.scalar_add!(1)
    assert_equal(expected_result, original)
  end

  def test_subtract
    original =  Matrix.[]([2,2], [2,2])
    expected_result =  Matrix.zero(2)

    result = original - original
    assert_equal(expected_result, result)

    original.subtract!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_subtract
    original = Matrix.[]([1,1], [1,1])
    expected_result =  Matrix.zero(2)

    result = original.scalar_subtract(1)
    assert_equal(expected_result, result)

    original.scalar_subtract!(1)
    assert_equal(expected_result, original)
  end

  def test_set
    original = Matrix.zero(2)
    expected_result = Matrix.[]([1, 0], [0, 0])

    original.set(0, 0, 1)

    assert_equal(expected_result, original)
  end
end