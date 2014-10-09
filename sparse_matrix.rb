require './immutable_method'

class SparseMatrix

  include ImmutableMethod

  #initializes new sparse matrix
  def initialize(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Hash.new

    matrix.each_with_index { |element, i, j|
      @elements[index(i, j)] = element unless element == 0
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
    @elements[index(i, j)] = value
  end

  #returns the element i, j
  def [](i, j)
    @elements[index(i, j)]
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
    call_method_immutably(__method__, i)
  end

  #reutnrs result of multiplying a matrix by its inverse
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

  #return matrix after each method has been divided by a a scalar
  def scalar_divide(i)
    call_method_immutably(__method__, i)
  end

  #Add matrix to the sparse matrix
  def +(matrix)
    to_matrix + matrix
  end

  #add matrix to current sparse matrix, and set current sparse matrix to be result
  def add!(matrix)
    to_sparse!(to_matrix + matrix)
  end

  #add a scalar to itself
  def scalar_add!(i)
    to_sparse!(to_matrix.scalar_add(i))
  end

  #add a scalar to itself but only return result
  def scalar_add(i)
    call_method_immutably(__method__, i)
  end

  #subtract matrix from sparse matrix
  def -(matrix)
    to_matrix - matrix
  end

  #subtract matrix from sparse matrix and set sparse matrix to result
  def subtract!(matrix)
    to_sparse!(to_matrix - matrix)
  end

  #subtract scalar from sparse matrix and change sparse matrix to result
  def scalar_subtract!(i)
    to_sparse!(to_matrix.scalar_subtract(i))
  end

  #subtract scalar from sparse matrix and return result
  def scalar_subtract(i)
    call_method_immutably(__method__, i)
  end

  #set matrix to conjugate matrix
  def conjugate!
    to_sparse!(to_matrix.conjugate)
  end

  #return conjugate matrix
  def conjugate
    call_method_immutably(__method__, i)
  end

  #returns determinant
  def determinant
    to_matrix.determinant
  end

  #returns the eigen values
  def eigen
    to_matrix.eigensystem
  end

  #calculates imaginary
  def imaginary
    to_matrix.imaginary
  end

  #calculates sets matrix to its inverse
  def inverse!()
    to_sparse!(to_matrix.inverse)
  end

  #returns matrix inverse
  def inverse()
    call_method_immutably(__method__, i)
  end

  #performs lup decomposision on the matrix
  def lup_decomposition
    to_matrix.lup_decomposition
  end

  #returns rank
  def rank
    to_matrix.rank
  end

  #returns real
  def real
    to_matrix.real
  end

  #returns rectangular
  def rectangular
    to_matrix.rectangular
  end

  #resizes matrix to i, j
  def resize!(i, j)
    @row = i
    @col = j
  end

  #sets matrix to rounded number
  def round!(i)
    @elements.each_value { |value|
      value.round(i) }
  end

  #returns rounded matrix
  def round(i)
    call_method_immutably(__method__, i)
  end

  #returns trace
  def trace
    to_matrix.trace
  end

  #sets matrix to its transpose
  def transpose!
    to_sparse!(to_matrix.transpose)
  end

  #returns matrixes transpose
  def transpose
    call_method_immutably(__method__, i)
  end

  #returns matrix as an array
  def to_a
    to_matrix.to_a
  end

  #returns matrix as string
  def to_s
    to_matrix.to_s
  end

  #returns if diagonal
  def diagonal?
    to_matrix.diagonal?
  end

  #returns if hermitatian
  def hermitian?
    to_matrix.hermitian?
  end

  #returns if normal
  def normal?
    to_matrix.normal?
  end

  #returns if orthogonal
  def orthogonal?
    to_matrix.orthogonal?
  end

  #returns if permutation
  def permutation?
    to_matrix.permutation?
  end

  #returns ifsymmetric
  def symmetric?
    to_matrix.symmetric?
  end

  #returns if unitary
  def unitary?
    to_matrix.unitary?
  end

  #returns if lower triangular
  def lower_triangular?
    to_matrix.lower_triangular?
  end

  #returns if real
  def real?
    to_matrix.real?
  end

  #returns if regular
  def regular?
    to_matrix.regular?
  end

  #returns if singular
  def singular?
    to_matrix.singular?
  end

  #returns if square
  def square?
    to_matrix.square?
  end

  #returns if upper triangular
  def upper_triangular?
    to_matrix.upper_triangular?
  end

  #returns if zero
  def zero?
    to_matrix.zero?
  end

  private
  #returns posistion as element index
  def index(i, j)
    (i)*@row + (j)
  end

  #returns element index as posistion
  def position(i)
    return i % @col, (i / @row) + 1
  end

  #returns matrix representation
  def to_matrix
    return_matrix = Matrix.zero(@row, @col)
    @elements.each_pair do |key, value|
      i, j = position(key)
      return_matrix = return_matrix.set(i, j, value)
    end

    return_matrix
  end

  #turns matrix into a sparse matrix representations and sets results
  def to_sparse!(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Hash.new

    matrix.each_with_index { |element, i, j|
      @elements[index(i, j)] = element unless element == 0
    }
  end
end
