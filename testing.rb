require './abstract_matrix_factory'
require './sparse_matrix_factory'
require './sparse_matrix'
require './sparse_element'

class Testing
  def self.tester
    matrix_valid = Matrix.[]([0, 0, 0], [1, 5, 0], [0, 2, 1])
    matrix_invalid = Matrix.[]([0, 0, 3], [4, 5, 0], [0, 8, 9])

    mult_matrix = Matrix.[]([1, 1], [1, 1])
    new_sparse = SparseMatrix.new(mult_matrix)
    (new_sparse * new_sparse).to_s

    sparse = SparseMatrix.new(matrix_valid)
    sparse.to_s
    new_matrix = sparse.scalar_multiply(5)
    sparse.to_s
    new_matrix.to_s
  end

  def self.mult
    mult_matrix = Matrix.[]([1, 1], [1, 1])
    new_sparse = SparseMatrix.new(mult_matrix)
    (new_sparse * new_sparse).to_s
  end
end

Testing.tester
'Testing.mult'