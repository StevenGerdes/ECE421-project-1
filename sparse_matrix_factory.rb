require './sparse_matrix'

class SparseMatrixFactory
  @SPARSE_PERCENTAGE = 0.5

  def self.is_valid?(matrix)
    return (get_nonzero_count(matrix).to_f / matrix.count) < @SPARSE_PERCENTAGE
  end

  def self.build(matrix)
    SparseMatrix.new(matrix)
  end

  def self.get_nonzero_count(matrix)
    return matrix.each.count {|val| val != 0}
  end
end