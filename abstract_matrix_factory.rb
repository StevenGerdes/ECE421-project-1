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

  def self.build(row, col, &matrixBlock)
    returnMatrix = Matrix.build(row, col, &matrixBlock)

    if SparseMatrixFactory.is_valid?(returnMatrix)
      returnMatrix = SparseMatrixFactory.build(returnMatrix)
    elsif TridiagonalMatrixFactory.is_valid?(returnMatrix)
      TridiagonalMatrixFactory.build(returnMatrix)
    end

    return returnMatrix
  end

  def self.[](*matrixArray)
    returnMatrix = Matrix.[](*matrixArray)

    if SparseMatrixFactory.is_valid?(returnMatrix)
      returnMatrix = SparseMatrixFactory.build(returnMatrix)
    elsif TridiagonalMatrixFactory.is_valid?(returnMatrix)
      TridiagonalMatrixFactory.build(returnMatrix)
    end

    return returnMatrix
  end
end