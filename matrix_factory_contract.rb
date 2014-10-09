gem 'test-unit'
require 'test/unit'
require './matrix'
require './sparse_matrix'
require './sparse_matrix_factory'

class MatrixFactoryContract < Test::Unit::TestCase

  def test_is_valid_sparse
    input_matrix = Matrix.I(5)

    #Invarient
    old_matrix = input_matrix.clone

    #Pre-conditions
    assert_kind_of(Matrix, input_matrix)

    sparse_matrix_factory = SparseMatrixFactory.new(0.5)
    result = sparse_matrix_factory.is_valid?(input_matrix)

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

    sparse_matrix_factory = SparseMatrixFactory.new(0.5)
    result = sparse_matrix_factory.build(input_matrix)

    #Post-condition
    assert_kind_of(SparseMatrix, result)

    #Invarient
    assert_equal(old_matrix, input_matrix)
  end
end