gem 'test-unit'
require 'test/unit'
require '../abstract_matrix_factory'

class MatrixContract < Test::Unit::TestCase
  def test_properties
    matrix = Matrix.I(2)

    boolean_methods = [:diagonal?,
    :hermitian?,
    :normal?,
    :orthogonal?,
    :permutation?,
    :symmetric?,
    :unitary?,
    :lower_triangular?,
    :real?,
    :regular?,
    :singular?,
    :square?,
    :upper_triangular?,
    :zero?]

    boolean_methods.each do |method|
      simple_boolean_contract(matrix, method)
    end

  end

  def simple_boolean_contract(object, method)

    object_old = object.clone

    #preconditions
    #none

    result = object.send(method)

    #postconditions
    assert_true(result.is_a?( TrueClass) || result.is_a?( FalseClass))

    #invarient
    assert_equal(object, object_old)

  end

  def test_multiply_matrix
    matrix = AbstractMatrixFactory.I(3)
    to_multiply = AbstractMatrixFactory.I(3)

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
    matrix = AbstractMatrixFactory.I(3)
    to_multiply = AbstractMatrixFactory.I(3)
    old_row_count = matrix.row_count

    #pre-conditions
    assert_equal(matrix.column_count, to_multiply.rows)

    matrix.multiply! to_multiply

    #post-condition
    assert_equal(matrix.column_count, to_multiply.column_count)

    #invarient
    assert_equal(matrix.row_count, old_row_count)

  end

  def test_multiply_scalar
    matrix = AbstractMatrixFactory.I(3)
    to_multiply = Numeric.new

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_multiply.is_a? Numeric)

    result = matrix.scalar_multiply to_multiply

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_multiply.columns)
    assert_equal(result, to_multiply * matrix)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_multiply_scalar
    matrix = AbstractMatrixFactory.I(3)
    to_multiply = Numeric.new
    matrix_old = matrix.clone

    #Invarient
    num_rows = matrix.row_count
    num_columns = matrix.column_count

    #pre-conditions
    assert_true(to_multiply.is_a? Numeric)

    matrix.scalar_multiply! to_multiply

    #post-condition
    assert_equal(matrix, to_multiply * matrix_old)

    #invarient
    assert_equal(matrix.row_count, num_rows)
    assert_equal(matrix.column_count, num_columns)
  end

  def test_add_matrix
    matrix = AbstractMatrixFactory.I(3)
    matrix_arg = AbstractMatrixFactory.I(3)

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
    matrix = AbstractMatrixFactory.I(3)
    matrix_arg = AbstractMatrixFactory.I(3)
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
    matrix = AbstractMatrixFactory.I(3)
    scalar_arg = Numeric.new

    #invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(scalar_arg.is_a? Numeric)
    result = matrix.add_scalar scalar_arg

    #post-condition
    assert_equal(result, scalar_arg + matrix)
    assert_equal(result.column_count, matrix.column_count)
    assert_equal(result.row_count, matrix.row_count)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_add_scalar
    matrix = AbstractMatrixFactory.I(3)
    scalar_arg = AbstractMatrixFactory.I(3)
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
    matrix = AbstractMatrixFactory.I(3)
    matrix_arg = AbstractMatrixFactory.I(3)

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
    matrix = AbstractMatrixFactory.I(3)
    matrix_arg = AbstractMatrixFactory.I(3)
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
    matrix = AbstractMatrixFactory.I(3)
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
    matrix = AbstractMatrixFactory.I(3)
    scalar_arg = AbstractMatrixFactory.I(3)
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
    matrix = AbstractMatrixFactory.I(3)
    to_divide = AbstractMatrixFactory.I(3)

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.singular?)
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
    matrix = AbstractMatrixFactory.I(3)
    to_divide = AbstractMatrixFactory.I(3)
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.singular?)
    assert_equal(matrix.column_count, to_divide.rows)

    matrix.divide! to_divide

    #post-condition
    assert_equal(matrix.row_count, matrix_old.row_count)
    assert_equal(matrix.column_count, to_divide.column_count)
    assert_equal(matrix, matrix_old * to_divide.inverse)
  end

  def test_divide_scalar
    matrix = AbstractMatrixFactory.I(3)
    to_divide = Numeric.new

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(to_divide.is_a? Numeric)

    result = matrix.scalar_divide to_divide

    #post-condition
    assert_equal(result.rows, matrix.rows)
    assert_equal(result.columns, to_divide.columns)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_mutable_divide_scalar
    matrix = AbstractMatrixFactory.I(3)
    to_divide = Numeric.new
    matrix_old = matrix.clone

    #Invarient
    num_rows = matrix.row_count
    num_columns = matrix.column_count

    #pre-conditions
    assert_true(to_divide.is_a? Numeric)
    assert_not_equal(to_divide, 0)

    matrix.scalar_divide! to_divide

    #post-condition
    assert_equal(matrix, to_divide * matrix_old)

    #invarient
    assert_equal(matrix.row_count, num_rows)
    assert_equal(matrix.column_count, num_columns)
  end

  def test_inverse
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.singular?)

    result = matrix.inverse

    #post-condition
    assert_equal(Matrix.I(matrix.row_count), matrix * result)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_inverse!
    matrix = AbstractMatrixFactory.I(3)

    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.singular?)

    matrix.inverse

    #post-condition
    assert_equal(Matrix.I(matrix.row_count), matrix * matrix_old)

    #invarient

  end

  def test_determinant
    matrix = AbstractMatrixFactory.I(3)

    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.square?)

    result = matrix.determinant

    #post-condition
    assert_kind_of(Numeric, result)
    assert_equal(result, 1/matrix.inverse.determinant)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_transpose
    matrix = AbstractMatrixFactory.I(3)


    #Invarient
    matrix_old = matrix.clone

    #pre-conditions
    #none

    result = matrix.transpose

    #post-condition
    assert_equal(matrix.rows, result.columns)
    assert_equal(matrix.columns, result.rows)
    assert_equal(matrix.determinant, result.determinant)

    #invarient
    assert_equal(matrix, matrix_old)
  end

  def test_transpose!
    matrix = AbstractMatrixFactory.I(3)

    matrix_old = matrix.clone

    #invarient
    old_determinant = matrix.determinant

    #pre-conditions
    #none

    matrix.transpose!

    #post-condition
    assert_equal(matrix.row_vectors, matrix_old.column_vectors)
    assert_equal(matrix.column_vectors, matrix_old.row_vectors)

    #invarient
    assert_equal(old_determinant, matrix.determinant)

  end

  def test_access
    matrix = AbstractMatrixFactory.I(3)

    i = Integer.new
    j = Integer.new

    #Invarient
    matrix_old = matrix.clone

    #Preconditions
    assert_respond_to(i, :to_i)
    assert_respond_to(j, :to_i)
    assert_true(0 <= i && i < matrix.row_count)
    assert_true(0 <= j && j < matrix.column_count)

    result = matrix[i, j]

    #Postcondition
    assert_kind_of(Numeric, result)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_row
    matrix = AbstractMatrixFactory.I(3)

    i = Integer.new

    #Invarient
    matrix_old = matrix.clone

    #Preconditions
    assert_respond_to(i, :to_i)
    assert_true(0 <= i && i < matrix.column_count)

    result = matrix.row(i)

    #Postcondition
    assert_equal(matrix.column_count, result.size)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_column
    matrix = AbstractMatrixFactory.I(3)

    j = Integer.new

    #Invarient
    matrix_old = matrix.clone

    #Preconditions
    assert_respond_to(j, :to_i)
    assert_true(0 <= j && j < matrix.column_count)

    result = matrix.column(j)

    #Postcondition
    assert_equal(matrix.row_count, result.size)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_row_vectors
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    matrix_old = matrix.clone

    #Preconditions

    result = matrix.row_vectors

    #Postcondition
    assert_equal(matrix.row_count, result.size)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_column_vectors
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    matrix_old = matrix.clone

    #Preconditions

    result = matrix.column_vectors

    #Postcondition
    assert_equal(matrix.column_count, result.size)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_row_count
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.row_count

    #postconditions
    assert_kind_of(Integer, result)
    assert_true(result >= 0)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_column_count
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.column_count

    #postconditions
    assert_kind_of(Integer, result)
    assert_true(result >= 0)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_round
    matrix = AbstractMatrixFactory.I(3)

    num_digits = Integer.new

    #Invarient
    matrix_old = matrix.clone

    #preconditions
    assert_respond_to(num_digits, :to_i)
    assert_true(num_digits >= 0)

    result = matrix.round num_digits

    #postconditions
    assert_equal(matrix.row_count, result.row_count)
    assert_equal(matrix.column_count, result.column_count)

    #Invarient
    assert_equal(matrix, matrix_old)
  end

  def test_round!
    matrix = AbstractMatrixFactory.I(3)

    num_digits = Integer.new

    #Invarient
    old_row_count = matrix.row_count
    old_column_count = matrix.column_count

    #preconditions
    assert_respond_to(num_digits, :to_i)
    assert_true(num_digits >= 0)

    matrix.round num_digits

    #postconditions

    #Invarient
    assert_equal(old_row_count, matrix.row_count)
    assert_equal(old_column_count, matrix.column_count)

  end

  def test_to_s
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.to_s

    #postconditions
    assert_kind_of(String, result)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_resize!
    matrix = AbstractMatrixFactory.I(3)

    i = Integer.new
    j = Integer.new

    #preconditions
    assert_respond_to(i, :to_i)
    assert_respond_to(j, :to_i)

    matrix.resize(i, j)

    #postconditions
    assert_equal(matrix.row_count, i)
    assert_equal(matrix.column_count, j)

  end

  def test_set
    matrix = AbstractMatrixFactory.I(3)
    i = Integer.new
    j = Integer.new
    value = Numeric.new

    #invarient
    old_matrix = matrix.clone

    #preconditions
    assert_true(0 <= i && i < matrix.row_count)
    assert_true(0 <= j && j < matrix.column_count)
    assert_kind_of(Numeric, value)

    matrix[i, j] = value

    #postconditions
    assert_equal(matix[i, j], value)

    #Invarient
    assert_equal(old_matrix.row_count, matrix.row_count)
    assert_equal(old_matrix.column_count, matrix.column_count)
  end

  def test_imaginary
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.imaginary

    #postconditions
    assert_false(result.real?)
    assert_equal(result.row_count, matrix.row_count)
    assert_equal(result.column_count, matrix.column_count)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_real
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.real

    #postconditions
    assert_true(result.real?)
    assert_equal(result.row_count, matrix.row_count)
    assert_equal(result.column_count, matrix.column_count)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_conjugate
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate

    #postconditions
    assert_equal(result.imaginary, -1 * matrix.imaginary)

    #Invarient
    assert_equal(old_matrix.real, matrix.real)
  end

  def test_conjugate!
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    matrix.conjugate!

    #postconditions
    assert_equal(old_matrix.imaginary, -1 * matrix.imaginary)

    #Invarient
    assert_equal(old_matrix.real, matrix.real)
  end

  def test_rectangular
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.rectangular

    #postconditions
    assert_equal(result.size, 2)
    assert_true(result[0].real?)
    assert_false(result[1].real?)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_rank
    #returns number of linearly independant rows
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.rank

    #postconditions
    assert_kind_of(Integer, result)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_trace
    #Returns the trace (sum of diagonal elements) of the matrix
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.trace

    #postconditions
    assert_kind_of(Numeric, result)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_eigen
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    v, d, v_inv = matrix.eigensystem

    #postconditions
    assert_true(d.diagonal?)
    assert_equal(v.inv, v_inv)
    assert_equal((v * d * v_inv).round(5), matrix)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_lup_decomposition
    matrix = AbstractMatrixFactory.I(3)

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    l, u, p = matrix.lup_decomposition

    #postconditions
    assert_true(l.lower_triangular?)
    assert_true(u.upper_triangular?)
    assert_true(p.permutation?)
    assert_equal(l * u, matrix * p)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_coerce
    matrix = AbstractMatrixFactory.I(3)
    #Invarient
    old_matrix = matrix.clone
    arg = Numeric.new

    #preconditions
    assert_kind_of(Numeric, arg)

    #our coerce will simply flip the arguments around
    first, second = matrix.coerce arg

    #postconditions
    assert_equal(matrix,first)
    assert_equal(arg,second)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_to_a
    #returns an arrays of arrays
    matrix = AbstractMatrixFactory.I(3)
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.to_a

    #postconditions
    assert_true(result.size, matrix.row_count)
    assert_true(result[0].size, matrix.column_count)

    #Invarient
    assert_equal(old_matrix, matrix)
  end
end