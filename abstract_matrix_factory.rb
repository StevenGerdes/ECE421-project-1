require 'matrix'
require 'sparse_matrix_factory'
require 'tridiagonal_matrix_factory'

class AbstractMatrixFactory
  def identity(dimension)
    return SparseMatrixFactory.identity(dimension)
  end

  def zero(dimension)
    return SparseMatrixFactory.zero(dimension)
  end

  def build(row, col, &matrixBlock)
    returnMatrix = Matrix.build(row, col, &matrixBlock)

    if SparseMatrixFactory.is_valid(returnMatrix)
      returnMatrix = SparseMatrixFactory.build(returnMatrix)
    elsif TridiagonalMatrixFactory.is_valid(returnMatrix)
      TridiagonalMatrixFactory.build(returnMatrix)
    end

    return returnMatrix
  end

  def [](*matrixArray)
    returnMatrix = Matrix.[](*matrixArray)

    if SparseMatrixFactory.is_valid(returnMatrix)
      returnMatrix = SparseMatrixFactory.build(returnMatrix)
    elsif TridiagonalMatrixFactory.is_valid(returnMatrix)
      TridiagonalMatrixFactory.build(returnMatrix)
    end

    return returnMatrix
  end
end