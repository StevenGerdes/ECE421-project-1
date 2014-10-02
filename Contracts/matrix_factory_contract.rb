gem 'test-unit'
require 'test/unit'
require '../matrix'
require '../matrix_factory'
require '../sparse_matrix'
require '../sparse_matrix_factory'
require '../tridiagonal_matrix'
require '../tridiagonal_matrix_factory'

class MatrixFactoryContract < Test::Unit::TestCase

  def test_valid_data_sparse
    input_matrix = Matrix.I(5)

    #Invarient
    old_matrix = input_matrix.clone

    #Pre-conditions
    assert_kind_of(Matrix, input_matrix)

    result = SparseMatrixFactory.valid_data(input_matrix)

    #Post-condition
    assert_true(result.is_a?(TrueClass) || result.is_a?(FalseClass))

    #Invarient
    assert_equal(old_matrix, input_matrix)
  end

  def test_valid_data_tridiagonal
    input_matrix = Matrix.I(5)

    #Invarient
    old_matrix = input_matrix.clone

    #Pre-conditions
    assert_kind_of(Matrix, input_matrix)

    result = TridiagonalMatrixFactory.valid_data(input_matrix)

    #Post-condition
    assert_true(result.is_a?(TrueClass) || result.is_a?(FalseClass))

    #Invarient
    assert_equal(old_matrix, input_matrix)
  end

  def test_build_sparse
    input_matrix = Matrix.I(5)

    #Invarient
    old_matrix = input_matrix.clone

    #Pre-conditions
    assert_kind_of(Matrix, input_matrix)

    result = SparseMatrixFactory.build(input_matrix)

    #Post-condition
    assert_kind_of(SparseMatrix, result)

    #Invarient
    assert_equal(old_matrix, input_matrix)
  end

  def test_build_tridiagonal
    input_matrix = Matrix.I(5)

    #Invarient
    old_matrix = input_matrix.clone

    #Pre-conditions
    assert_kind_of(Matrix, input_matrix)

    result = TridiagonalMatrixFactory.build(input_matrix)

    #Post-condition
    assert_kind_of(TridiagonalMatrix, result)

    #Invarient
    assert_equal(old_matrix, input_matrix)
  end
end