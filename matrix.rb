require 'Matrix'
require './immutable_method'

class Matrix
  include ImmutableMethod

  def inverse!
    self.inverse_from(self)
  end

  def transpose!
    @rows = @rows.transpose
  end

  def multiply!( to_multiy )
    result_matrix = self * to_multiy
    self.set_by_matrix(result_matrix)
  end

  def divide!( to_divide_by )
    self.multiply! to_divide_by.inverse!
  end


  def divide(arg)
    call_method_immutably(__method__, arg)
  end

  def add!( to_add )
    element_math(to_add, :+)
  end

  def subtract!( to_subtract )
    element_math(to_subtract, :-)
  end

  def scalar_multiply(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_multiply!(to_multiply)
    collect!{|e| e + to_multiply}
  end

  def scalar_add(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_add!(to_add)
    collect!{|e| e + to_add}
  end

  def scalar_subtract(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_subtract!(to_subtract)
    collect!{|e| e - to_subtract}
  end

  def scalar_divide(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_divide!(to_divide_by)
    collect!{|e| e/to_divide_by}
  end

  def set(i, j, value)
    @rows[i][j] = value
  end

  def round!(ndigits=0)
    collect!{|e| e.round(ndigits)}
  end
private
  def collect!(&block)
    @rows = @rows.collect{|row| row.collect(&block)}
  end
  def element_math(matrix, operator)
    self.each_with_index{ |e,i,j|
      self.set(i,j, e.send(operator, matrix[i,j] ) )
    }
  end
  def set_by_matrix( matrix )
    self.each_with_index{ |e,i,j|
      self.set(i,j, matrix[i,j]  )
    }
  end
end