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

  def multiply!

  end

  def divide!

  end

  def add!

  end

  def subtract!

  end

  def scalar_multiply(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_multiply!(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_add(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_add!

  end

  def scalar_subtract(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_subtract!

  end

  def scalar_divide(arg)
    call_method_immutably(__method__, arg)
  end

  def scalar_divide!(to_divide_by)

  end

  def set(i, j, value)
    @rows[i][j] = value
  end

  def round!

  end
end