require 'sparse_matrix'
require 'matrix'

class SparseMatrixFactory
  @SPARSE_PERCENTAGE = .5

  def is_valid?(matrix)
    return (get_zero_count(matrix) / matrix.count) < @SPARSE_PERCENTAGE
  end

  def build(matrix)
    SparseMatrix.new(matrix)
  end

  def get_zero_count(matrix)
    return matrix.each.count {|val| val != 0}
  end
end