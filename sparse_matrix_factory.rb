require './sparse_matrix'

class SparseMatrixFactory
  @sparse_percentage = 0.5

  def initialize(sparse_percent)
    @sparse_percentage = sparse_percent.to_f
  end

  def is_valid?(matrix)
    (get_nonzero_count(matrix).to_f / matrix.count) < @sparse_percentage
  end

  def self.build(matrix)
    SparseMatrix.new(matrix)
  end

  private

  def self.get_nonzero_count(matrix)
    return matrix.each.count { |val| val != 0 }
  end

end