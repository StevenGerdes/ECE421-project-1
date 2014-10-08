require './abstract_matrix_factory'
require './sparse_matrix_factory'
require './sparse_matrix'
require './sparse_element'

class Testing
  def self.tester
    matrix_valid = Matrix.[]([0, 0, 0], [1, 5, 0], [0, 2, 1])
    matrix_invalid = Matrix.[]([0, 0, 3], [4, 5, 0], [0, 8, 9])

    SparseMatrix.new(matrix_valid).to_matrix
  end
end

Testing.tester