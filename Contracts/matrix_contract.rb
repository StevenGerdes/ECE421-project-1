gem 'test-unit'
require 'test/unit'
require '../abstract_matrix_factory'

class MatrixContract < Test::Unit::TestCase
  def test_properties
    matrix = AbstractMatrixFactory.build
    matrix_old = matrix.clone

    #preconditions
    #none

    matrix.diagonal? #square
    matrix.hermitian? #square
    matrix.normal? #square
    matrix.orthogonal? #square
    matrix.permutation? #square
    matrix.symmetric? #square
    matrix.unitary? #square
    matrix.lower_triangular?
    matrix.real?
    matrix.regular?
    matrix.singular?
    matrix.square?
    matrix.upper_triangular?
    matrix.zero?

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
    matrix = AbstractMatrixFactory.build
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
    matrix = AbstractMatrixFactory.build
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
    matrix = AbstractMatrixFactory.build
    to_divide = AbstractMatrixFactory.build
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
    matrix = AbstractMatrixFactory.build
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
    matrix = AbstractMatrixFactory.build
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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

    matrix_old = matrix.clone

    #pre-conditions
    assert_true(matrix.singular?)

    matrix.inverse

    #post-condition
    assert_equal(Matrix.I(matrix.row_count), matrix * matrix_old)

    #invarient

  end

  def test_determinant
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build


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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

    i = Integer.new
    j = Integer.new

    #preconditions
    assert_respond_to(i, :to_i)
    assert_respond_to(j, :to_i)

    matrix.resize(i,j)

    #postconditions
    assert_equal(matrix.row_count, i)
    assert_equal(matrix.column_count, j)

  end

  def test_set
    matrix = AbstractMatrixFactory.build
    i = Integer.new
    j = Integer.new
    value = Numeric.new

    #invarient
    old_matrix = matrix.clone

    #preconditions
    assert_true(0 <= i && i < matrix.row_count)
    assert_true(0 <= j && j < matrix.column_count)
    assert_kind_of(Numeric, value)

    matrix[i,j] = value

    #postconditions
    assert_equal(matix[i,j], value)

    #Invarient
    assert_equal(old_matrix.row_count, matrix.row_count)
    assert_equal(old_matrix.column_count, matrix.column_count)
  end

  def test_imaginary
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

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
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate

    #postconditions
    assert_equal(result.imaginary, -1 * matrix.imaginary )

    #Invarient
    assert_equal(old_matrix.real, matrix.real)
  end

  def test_conjugate!
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    matrix.conjugate!

    #postconditions
    assert_equal(old_matrix.imaginary, -1 * matrix.imaginary )

    #Invarient
    assert_equal(old_matrix.real, matrix.real)
  end

  def test_rectangular
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.imaginary

    #postconditions
    assert_equal(result.size, 2)
    assert_true(result[0].real?)
    assert_false(result[1].real?)

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_rank
#number of linearly indeoendant phones
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_trace
    Returns the trace (sum of diagonal elements) of the matrix
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_eigen
    m = Matrix[[1, 2], [3, 4]]
    v, d, v_inv = m.eigensystem
    d.diagonal? # => true
    v.inv == v_inv # => true
    (v * d * v_inv).round(5) == m # => true

    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_lup_decomposition
    a = Matrix[[1, 2], [3, 4]]
    l, u, p = a.lup
    l.lower_triangular? # => true
    u.upper_triangular? # => true
    p.permutation?      # => true
    l * u == a * p      # => true
    a.lup.solve([2, 5]) # => Vector[(1/1), (1/2)]

    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_coerce(other)
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end

  def test_to_a
#arrays of arrays
    matrix = AbstractMatrixFactory.build

    #Invarient
    old_matrix = matrix.clone

    #preconditions
    #none

    result = matrix.conjugate!

    #postconditions

    #Invarient
    assert_equal(old_matrix, matrix)
  end
end