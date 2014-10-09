require 'Matrix'
require './immutable_method'

class Matrix
  include ImmutableMethod

  #Inverts matrix mutably
  def inverse!
    set_by_matrix(self.inverse)
  end

  #Transposes matrix mutably
  def transpose!
    @rows = @rows.transpose
  end

  #multiplies matrix and becomes the result
  def multiply!(to_multiy)
    result_matrix = self * to_multiy
    set_by_matrix(result_matrix)
  end

  #multiplies by the inverse and becomes the result
  def divide!(to_divide_by)
    self.multiply!( to_divide_by.inverse )
  end

  #divides matricies immutably
  def divide(arg)
    call_method_immutably(__method__, arg)
  end

  #adds another matrix element wise
  def add!(to_add)
    element_math(to_add, :+)
  end

  #subtracts another matrix elment wise
  def subtract!(to_subtract)
    element_math(to_subtract, :-)
  end

  #returns a new matrix with each element multiplied by a scalar
  def scalar_multiply(arg)
    call_method_immutably(__method__, arg)
  end

  #multiplies each element by a scalar
  def scalar_multiply!(to_multiply)
    collect! { |e| e * to_multiply }
  end

  #returns this matrix added to the argument matrix
  def scalar_add(arg)
    call_method_immutably(__method__, arg)
  end

  #adds a matrix to itself elementwise
  def scalar_add!(to_add)
    collect! { |e| e + to_add }
  end

  #returns this matrix with the arg matrix subtracted from it
  def scalar_subtract(arg)
    call_method_immutably(__method__, arg)
  end

  #subtracts the argument elementwise from itself
  def scalar_subtract!(to_subtract)
    collect! { |e| e - to_subtract }
  end

  #returns this matrix with each element divided by the argument
  def scalar_divide(arg)
    call_method_immutably(__method__, arg)
  end

  #divied each element by the argument
  def scalar_divide!(to_divide_by)
    collect! { |e| e/to_divide_by }
  end

  #sets the element in the i,j position to value
  def set(i, j, value)
    @rows[i][j] = value
  end

  #rounds each element to the nearest ndigits
  def round!(ndigits=0)
    collect! { |e| e.round(ndigits) }
  end

  private
  #a mutable collect method
  def collect!(&block)
    @rows = @rows.collect { |row| row.collect(&block) }
  end

  #does an operation elementwise to itself and another matrix
  def element_math(matrix, operator)
    self.each_with_index { |e, i, j|
      self.set(i, j, e.send(operator, matrix[i, j]))
    }
  end

  #sets each value in the matrix to the given matrix
  def set_by_matrix(matrix)
    self.each_with_index { |e, i, j|
      self.set(i, j, matrix[i, j])
    }
  end
end