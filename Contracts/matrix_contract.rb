gem 'test-unit'
require 'test/unit'
require '../abstract_matrix_factory'

class MatrixContract < Test::Unit::TestCase
  def test_properties
    matrix = AbstractMatrixFactory.build
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
    matrix.invertable?

    #postconditions
    assert_true(result.is_a? TrueClass or result.is_a? FalseClass)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_multiply_matrix
    matrix = AbstractMatrixFactory.build
    to_multiply = AbstractMatrixFactory.build

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.column_count, to_multiply.row_count)

    result = matrix * to_multiply

    #post-condition
    assert_equal(result.row_count, matrix.row_count)
    assert_equal(result.column_count, to_multiply.column_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_multiply_matrix
    matrix = AbstractMatrixFactory.build
    to_multiply = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.column_count, to_multiply.rows)

    matrix.multiply! to_multiply

    #post-condition
    assert_equal(matrix.row_count, matrix_old.row_count)
    assert_equal(matrix.column_count, to_multiply.column_count)

  end

  def test_multiply_scalar
    matrix = AbstractMatrixFactory.build
    to_multiply = Numeric.new

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_multiply.is_a? Numeric )

    result = matrix.scalar_multiply to_multiply

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_multiply.columns)
    assert_equal(result, to_multiply * matrix)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_multiply_scalar
    matrix = AbstractMatrixFactory.build
    to_multiply = Numeric.new
    matrix_old = matrix.clone

    #Invarient
    num_rows = matrix.row_count
    num_columns = matrix.column_count

    #pre-conditions
    assert_true(to_multiply.is_a? Numeric )

    matrix.scalar_multiply! to_multiply

    #post-condition
    assert_equal(matrix, to_multiply * matrix_old)

    #invarient
    assert_equal(matrix.row_count, num_rows)
    assert_equal(matrix.column_count, num_columns)
  end

  def test_add_matrix
    matrix = AbstractMatrixFactory.build
    matrix_arg = AbstractMatrixFactory.build

    #invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.column_count, matrix_arg.column_count)
    assert_equal(matrix.row_count, matrix_arg.row_count)

    result = matrix + matrix_arg

    #post-condition
    assert_equal(result, matrix_arg + matrix)
    assert_equal(result.column_count, matrix.column_count)
    assert_equal(result.row_count, matrix.row_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_add_matrix
    matrix = AbstractMatrixFactory.build
    matrix_arg = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #invarient
    row_count = matrix.row_count
    column_count = matrix.column_count

    #pre-conditions
    assert_equal(matrix.column_count, matrix_arg.column_count)
    assert_equal(matrix.row_count, matrix_arg.row_count)

    matrix.add! matrix_arg

    #post-condition
    assert_equal(matrix, matrix_arg + matrix_old)

    #invarient
    assert_equal(column_count, matrix.column_count)
    assert_equal(row_count, matrix.row_count)
  end

  def test_add_scalar
    matrix = AbstractMatrixFactory.build
    scalar_arg = Numeric.new

    #invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(scalar_arg.is_a? Numeric )
    result = matrix.add_scalar scalar_arg

    #post-condition
    assert_equal(result, scalar_arg + matrix)
    assert_equal(result.column_count, matrix.column_count)
    assert_equal(result.row_count, matrix.row_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_add_scalar
    matrix = AbstractMatrixFactory.build
    scalar_arg = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #invarient
    row_count = matrix.row_count
    column_count = matrix.column_count

    #pre-conditions
    assert_true(scalar_arg.is_a? Numeric)

    matrix.add_scalar! scalar_arg

    #post-condition
    assert_equal(matrix, scalar_arg + matrix_old)

    #invarient
    assert_equal(column_count, matrix.column_count)
    assert_equal(row_count, matrix.row_count)
  end

  def test_subtract_matrix
    matrix = AbstractMatrixFactory.build
    matrix_arg = AbstractMatrixFactory.build

    #invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_equal(matrix.column_count, matrix_arg.column_count)
    assert_equal(matrix.row_count, matrix_arg.row_count)

    result = matrix - matrix_arg

    #post-condition
    assert_equal(result, -1 * (matrix_arg - matrix))
    assert_equal(result.column_count, matrix.column_count)
    assert_equal(result.row_count, matrix.row_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_subtract_matrix
    matrix = AbstractMatrixFactory.build
    matrix_arg = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #invarient
    row_count = matrix.row_count
    column_count = matrix.column_count

    #pre-conditions
    assert_equal(matrix.column_count, matrix_arg.column_count)
    assert_equal(matrix.row_count, matrix_arg.row_count)

    matrix.subtract! matrix_arg

    #post-condition
    assert_equal(matrix, -1 * (matrix_arg - matrix_old))

    #invarient
    assert_equal(column_count, matrix.column_count)
    assert_equal(row_count, matrix.row_count)
  end

  def test_subtract_scalar
    matrix = AbstractMatrixFactory.build
    scalar_arg = Numeric.new

    #invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(scalar_arg.is_a? Numeric)

    result = matrix.subtract_scalar scalar_arg

    #post-condition
    assert_equal(result, -1 * (scalar_arg - matrix))
    assert_equal(result.column_count, matrix.column_count)
    assert_equal(result.row_count, matrix.row_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_subtract_scalar
    matrix = AbstractMatrixFactory.build
    scalar_arg = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #invarient
    row_count = matrix.row_count
    column_count = matrix.column_count

    #pre-conditions
    assert_true(scalar_arg.is_a? Numeric)

    matrix.subtract_scalar! scalar_arg

    #post-condition
    assert_equal(matrix, -1 * (scalar_arg - matrix_old))

    #invarient
    assert_equal(column_count, matrix.column_count)
    assert_equal(row_count, matrix.row_count)
  end

  def test_divide_matrix
    matrix = AbstractMatrixFactory.build
    to_divide = AbstractMatrixFactory.build

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.invertable?)
    assert_equal(matrix.column_count, to_divide.row_count)

    result = matrix / to_divide

    #post-condition
    assert_equal(result.row_count, matrix.row_count)
    assert_equal(result.column_count, to_divide.column_count)
    assert_equal(result, matrix * to_divide.inverse)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_divide_matrix
    matrix = AbstractMatrixFactory.build
    to_divide = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.invertable?)
    assert_equal(matrix.column_count, to_divide.rows)

    matrix.divide! to_divide

    #post-condition
    assert_equal(matrix.row_count, matrix_old.row_count)
    assert_equal(matrix.column_count, to_divide.column_count)
    assert_equal(matrix, matrix_old * to_divide.inverse)
  end

  def test_divide_scalar
    matrix = AbstractMatrixFactory.build
    to_divide = Numeric.new

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.is_a? Numeric )

    result = matrix.scalar_divide to_divide

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_divide.columns)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_divide_scalar
    matrix = AbstractMatrixFactory.build
    to_divide = Numeric.new
    matrix_old = matrix.clone

    #Invarient
    num_rows = matrix.row_count
    num_columns = matrix.column_count

    #pre-conditions
    assert_true(to_divide.is_a? Numeric )
    assert_not_equal(to_divide, 0 )

    matrix.scalar_divide! to_divide

    #post-condition
    assert_equal(matrix, to_divide * matrix_old)

    #invarient
    assert_equal(matrix.row_count, num_rows)
    assert_equal(matrix.column_count, num_columns)
  end

  def test_inverse
    matrix = AbstractMatrixFactory.build

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true( matrix.invertable? )

    result = matrix.inverse

    #post-condition
    assert_equal(Matrix.I(matrix.row_count), matrix * result)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_determinant
    matrix = AbstractMatrixFactory.build

    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.square?)

    result = matrix.determinant

    #post-condition
    assert_kind_of( Numeric, result)
    assert_equal(result, 1/matrix.inverse.determinant)

    #invarient
    assert_equal(matrix, matrix_old)
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
    assert_equal(matrix.row_vectors, matrix_old.column_vectors)
    assert_equal(matrix.column_vectors, matrix_old.row_vectors)

    #invarient

  end

  def test_access(i, j)

  end
  def test_row_size

  end
  def test_column_size

  end
  def test_row

  end

  def test_column

  end

  def test_collect

  end

  def test_map

  end

  def test_each

  end

  def test_each_with_index

  end

  def test_find_index

  end


  def test_to_s

  end

  def test_round

  end

  def test_round!

  end


  def test_imaginary

  end

  def test_real

  end

  def test_conjugate

  end

  def test_rectangular

  end

  def test_rank

  end

  def test_trace

  end

  def test_eigen

  end

  def test_1up_decomposition

  end


  def test_coerce(other)

  end

  def test_row_vectors

  end

  def test_column_vectors

  end

  def test_to_a

  end

  def test_inspect

  end
end