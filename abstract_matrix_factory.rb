require './matrix'
require './sparse_matrix_factory'
require './tridiagonal_matrix_factory'

class AbstractMatrixFactory
  def self.identity(dimension)
    return SparseMatrixFactory.build(Matrix.identity(dimension))
  end

  def self.zero(row, col)
    return SparseMatrixFactory.build(Matrix.zero(row, col))
  end

  def self.build(row, col, &matrix_block)
    return_matrix = Matrix.build(row, col, &matrix_block)

    if SparseMatrixFactory.is_valid?(return_matrix)
      SparseMatrixFactory.build(return_matrix)
    elsif TridiagonalMatrixFactory.is_valid?(return_matrix)
      TridiagonalMatrixFactory.build(return_matrix)
    end
  end

  def self.[](*matrix_array)
    return_matrix = Matrix.[](*matrix_array)

    if SparseMatrixFactory.is_valid?(return_matrix)
      SparseMatrixFactory.build(return_matrix)
    elsif TridiagonalMatrixFactory.is_valid?(return_matrix)
      TridiagonalMatrixFactory.build(return_matrix)
    end
  end
end