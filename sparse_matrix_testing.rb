gem 'test-unit'
require 'test/unit'
require './matrix'
require './sparse_matrix'

class SparseMatrixTesting < Test::Unit::TestCase
  def test_multiply
    original = SparseMatrix.new(Matrix.[]([1,1], [1,1]))
    expected_result = SparseMatrix.new(Matrix.[]([2,2], [2,2]))

    result = original * original
    assert_equal(expected_result, result)

    original.multiply!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_multiply
    original = SparseMatrix.new(Matrix.[]([1,1], [1,1]))
    expected_result = SparseMatrix.new(Matrix.[]([5,5], [5,5]))

    result = original.scalar_multiply(5)
    assert_equal(expected_result, result)

    original.scalar_multiply!(5)
    assert_equal(expected_result, original)
  end

  def test_divide
    original = SparseMatrix.new(Matrix.[]([2,1], [1,2]))
    expected_result = SparseMatrix.new(Matrix.I(2))

    result = original / original
    assert_equal(expected_result, result)

    original.divide!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_divide
    original = SparseMatrix.new(Matrix.[]([2,2], [2,2]))
    expected_result = SparseMatrix.new(Matrix.[]([1,1], [1,1]))

    result = original.scalar_divide(2)
    assert_equal(expected_result, result)

    original.scalar_divide!(2)
    assert_equal(expected_result, original)
  end

  def test_add
    original = SparseMatrix.new(Matrix.[]([1,1], [1,1]))
    expected_result = SparseMatrix.new(Matrix.[]([2,2], [2,2]))

    result = original + original
    assert_equal(expected_result, result)

    original.add!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_add
    original = SparseMatrix.new(Matrix.[]([1,1], [1,1]))
    expected_result = SparseMatrix.new(Matrix.[]([2,2], [2,2]))

    result = original.scalar_add(1)
    assert_equal(expected_result, result)

    original.scalar_add!(1)
    assert_equal(expected_result, original)
  end

  def test_subtract
    original = SparseMatrix.new(Matrix.[]([2,2], [2,2]))
    expected_result = SparseMatrix.new(Matrix.zero(2))

    result = original - original
    assert_equal(expected_result, result)

    original.subtract!(original)
    assert_equal(expected_result, original)
  end

  def test_scalar_subtract
    original = SparseMatrix.new(Matrix.[]([1,1], [1,1]))
    expected_result = SparseMatrix.new(Matrix.zero(2))

    result = original.scalar_subtract(1)
    assert_equal(expected_result, result)

    original.scalar_subtract!(1)
    assert_equal(expected_result, original)
  end

  def test_set
    original = SparseMatrix.new(Matrix.zero(2))
    expected_result = SparseMatrix.new(Matrix.[]([0, 1], [0, 0]))

    original.set(0, 0, 1)

    assert_equal(expected_result, original)
  end

  def test_get
    original = SparseMatrix.new(Matrix.[]([0, 1], [0, 0]))
    expected_result = 1

    result = original.[](0, 1)

    assert_equal(expected_result, result)
  end
end