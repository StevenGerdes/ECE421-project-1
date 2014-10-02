gem 'test-unit'
require 'test/unit'
require './sparse_matrix'

class MatrixContract < Test::Unit::TestCase
  def test_properties
    matrix = SparseMatrix.new
    matrix_old = matrix.clone

    #preconditions
    #none

    matrix.diagonal?
    matrix.hermitian?
    matrix.lower_triangular?
    matrix.normal?
    matrix.orthogonal?
    matrix.permutation?
    matrix.real?
    matrix.regular?
    matrix.singular?
    matrix.square?
    matrix.symmetric?
    matrix.unitary?
    matrix.upper_triangular?
    matrix.zero?

    #postconditions
    assert_true(result.is_a? TrueClass or result.is_a? FalseClass)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_multiply_matrix
    matrix = SparseMatrixFactory.build
    to_multiply = SparseMatrixFactory.build

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.column_count, to_multiply.rows)

    result = matrix * to_multiply

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_multiply.columns)

    #invarient
    assert_equal(matrix, matrix_old)
  end


  def test_multiply_scalar
    matrix = SparseMatrix.new
    to_multiply = 9

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.columns, to_multiply.rows)

    result = matrix * to_multiply

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_multiply.columns)
    assert_equal(result, to_multiply * matrix) #assocativitey

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_add
    matrix = SparseMatrix.new
    matrix_arg = SparseMatrix.new

    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.columns, matrix_arg.columns)
    assert_equal(matrix.rows, matrix_arg.rows)

    result = matrix + matrix_arg

    #post-condition
    assert_equal(result, matrix_arg + matrix)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_subtract
    matrix = SparseMatrix.new
    matrix_arg = SparseMatrix.new

    matrix_old = matrix.clone

    #Invarient
    assert_equal(matrix, matrix_old)

    #pre-conditions
    assert_equal(matrix.rows, matrix_arg.rows)
    assert_equal(matrix.columns, matrix_arg.columns)

    result = matrix - matrix_arg

    #post-condition
    assert_equal(-1 * (matrix_arg - matrix), result)

    #invarient
    assert_equal(matrix, matrix_old)

  end

  def test_divide
    matrix = SparseMatrix.new
    matrix_arg = SparseMatrix.new

    matrix_old = matrix.clone

    #Invarient
    assert_equal(matrix, matrix_old)

    #pre-conditions
    assert_not_equal(matrix_arg.determinant, 0)
    assert_equal(matrix.rows, matrix_arg.rows)
    assert_equal(matrix.columns, matrix_arg.columns)

    result = matrix / matrix_arg

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, matrix_arg.columns)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_inverse
    matrix = SparseMatrix.new

    matrix_old = matrix.clone

    #Invarient
    assert_equal(matrix, matrix_old)

    #pre-conditions
    assert_not_equal(0, matrix.determinant)

    result = matrix.inverse

    #post-condition
    assert_equal(SparseMatrix.I, matrix * result)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_determinant
    matrix = SparseMatrix.new

    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.square?)

    result = matrix.determinant

    #post-condition
    assert_equal(result, 1/matrix.inverse.determinant)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_rank

  end

  def test_round

  end

  def test_trace

  end

  def test_transpose
    matrix = SparseMatrix.new

    matrix_old = matrix.clone

    #Invarient
    assert_equal(matrix, matrix_old)

    #pre-conditions
    #none

    result = matrix.transpose

    #post-condition
    assert_equal(matrix.rows, result.columns)
    assert_equal(matrix.columns, result.rows)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_transpose!
    matrix = SparseMatrix.new

    matrix_old = matrix.clone

    #Invarient
    assert_equal(matrix, matrix_old)

    #pre-conditions
    #none

    matrix.transpose!

    #post-condition
    assert_equal(matrix.rows, matrix_old.columns)
    assert_equal(matrix.columns, matrix_old.rows)

    #invarient

  end

  def test_eigen

  end

  def test_1up_decomposition

  end

  def test_conjugate

  end

  def test_imaginary

  end

  def test_real

  end

  def test_rectangular

  end

  def test_coerce(other)

  end

  def test_row_vectors

  end

  def test_column_vectors

  end

  def test_to_a

  end

  def test_to_s

  end

  def test_inspect

  end
end