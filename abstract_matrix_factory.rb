require './sparse_matrix'
class AbstractMatrixFactory
  def build
    SparseMatrix.new
  end
end