require './sparse_element'

class SparseMatrix

  #initializes new sparse matrix
  def initialize(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Hash.new

    matrix.each_with_index { |element, i, j|
      @elements[index(i,j)] = element unless element == 0
    }
  end

  #returns the row count for this matrix
  def row_count
    @row
  end

  #returns the column count for this matrix
  def column_count
    @col
  end

  #sets element i, j to the value
  def set(i, j, value)
    @elements[index(i,j)] = value
  end

  #returns the element i, j
  def [](i,j)
    @elements[index(i,j)]
  end

  #returns the ith row
  def row(i)
    to_matrix.row(i)
  end

  #returns the jth column
  def column(j)
    to_matrix.column(j)
  end

  #returns a row vector
  def row_vectors
    to_matrix.row_vectors
  end

  #returns a column vector
  def column_vectors
    to_matrix.column_vectors
  end

  #returns the result of 2 matrixes multiplied
  def *(matrix)
    to_matrix * matrix
  end

  #changes the current matrix into the result of these 2 matrixes multipled together
  def multiply!(matrix)
    to_sparse!(to_matrix * matrix)
  end

  #multiplies matrix by a number
  def scalar_multiply!(i)
    @elements.each_key do |key|
      @elements[key] = @elements[key] * i
    end
  end

  #returns result of matrix multiplied by a number
  def scalar_multiply(i)
    immutate(__method__, i )
  end

  #reutnrs resulf of multiplying a matrix by its inverse
  def /(matrix)
    to_matrix / matrix
  end

  #changes current matrix to itself multiplied by the inverse of itself
  def divide!(matrix)
    to_sparse!(to_matrix / matrix)
  end

  #divide entire matrix by a scalar
  def scalar_divide!(i)
    @elements.each_key do |key|
      @elements[key] = @elements[key] / i
    end
  end


  def scalar_divide(i)
    immutate(__method__, i )
  end

  def +(matrix)
    to_matrix + matrix
  end

  def add!(matrix)
    to_sparse!(to_matrix + matrix)
  end

  def scalar_add!(i)
    to_sparse!(to_matrix.scalar_add(i))
  end

  def scalar_add(i)
    immutate(__method__, i )
  end

  def -(matrix)
    to_matrix - matrix
  end

  def subtract!(matrix)
    to_sparse!(to_matrix - matrix)
  end

  def scalar_subtract!(i)
    to_sparse!(to_matrix.scalar_subtract(i))
  end

  def scalar_subtract(i)
    immutate(__method__, i )
  end

  def conjugate
    to_matrix.conjugate
  end

  def conjugate!
    immutate(__method__, i)
  end

  def determinant()
    to_matrix.determinant
  end

  def eigen
    to_matrix.eigensystem
  end

  def imaginary
    to_matrix.imaginary
  end

  def inverse!()
    to_sparse!(to_matrix.inverse())
  end

  def inverse()
    immutate(__method__, i )
  end

  def lup_decomposition
    to_matrix.lup_decomposition
  end

  def rank
    to_matrix.rank
  end

  def real
    to_matrix.real
  end

  def rectangular
    to_matrix.rectangular
  end

  def resize!(i, j)
    @row = i
    @col = j
  end

  def round!(i)
    @elements.each_value { |value|
      value.round(i)}
  end

  def round(i)
    immutate(__method__, i )
  end

  def trace
    to_matrix.trace
  end

  def transpose!()
    to_sparse!(to_matrix.transpose())
  end

  def transpose()
    immutate(__method__, i )
  end

  def to_a
    to_matrix.to_a
  end

  def to_s
    to_matrix.to_s
  end

  def diagonal?
    to_matrix.diagonal?
    end

  def hermitian?
    to_matrix.hermitian?
  end

  def normal?
    to_matrix.normal?
  end

  def orthogonal?
    to_matrix.orthogonal?
  end

  def permutation?
    to_matrix.permutation?
  end

  def symmetric?
    to_matrix.symmetric?
  end

  def unitary?
    to_matrix.unitary?
  end

  def lower_triangular?
    to_matrix.lower_triangular?
  end

  def real?
    to_matrix.real?
  end

  def regular?
    to_matrix.regular?
  end

  def singular?
    to_matrix.singular?
  end

  def square?
    to_matrix.square?
  end

  def upper_triangular?
    to_matrix.upper_triangular?
  end

  def zero?
    to_matrix.zero?
  end

private
  def index(i,j)
    (i)*@row + (j)
  end

  def position(i)
    return i % @col, (i / @row) + 1
  end

  def to_matrix
    returnMatrix = Matrix.zero(@row, @col)
    @elements.each_pair do |key, value|
      i, j = position(key)
      returnMatrix = returnMatrix.set(i, j, value)
    end

    return returnMatrix
  end

  def to_sparse!(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Hash.new

    matrix.each_with_index { |element, i, j|
      @elements[index(i,j)] = element unless element == 0
    }
  end

  def immutate( method, *args)
    copy = self.clone
    copy.send( method.to_s.concat('!').to_sym, *args  )
    copy
  end
end
