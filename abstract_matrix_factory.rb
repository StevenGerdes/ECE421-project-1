require './matrix'
require './sparse_matrix_factory'

class AbstractMatrixFactory
  def self.identity(dimension)
    create_from_matrix(Matrix.identity(dimension.to_i))
  end

  def self.zero(row, col)
    create_from_matrix(Matrix.zero(row.to_i, col.to_i))
  end

  def self.build(row, col, &matrix_block)
    create_from_matrix(Matrix.build(row.to_i, col.to_i, &matrix_block))
  end

  def self.[](*matrix_array)
    create_from_matrix(Matrix.[](*matrix_array))
  end

  private
  def self.create_from_matrix(matrix)

    sparse_matrix_factory = SparseMatrixFactory.new(0.5)

    if sparse_matrix_factory.is_valid?(matrix)
      sparse_matrix_factory.build(matrix)
    end

    matrix
  end

end