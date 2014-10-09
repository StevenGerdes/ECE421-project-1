#require 'Matrix'

class Matrix
<<<<<<< HEAD
  def set(i, j, value)
    Matrix.I(2)
  end
=======
  attr_accessor :stuff
  def initialize
    self.stuff = 0
  end
  def test_method
    self.immutate(__method__)
  end

  def test_method_with_args!(x,y)
    self.stuff = x + y
  end

  def test_method_with_args(x,y)
    self.immutate(__method__,x,y)
  end

  def test_method!
    self.stuff = 10
  end

  def out
    puts self.stuff
  end

  def immutate( method, *args)
    copy = self.clone
    copy.send( method.to_s.concat('!').to_sym, *args  )
    copy
  end
  # def multiply!
  # def scalar_multiply
  #
  # end
  # def scalar_multiply!
  # def add!
  # def scalar_add
  #
  # end
  # def scalar_add!
  # def subtract!
  # def scalar_subtract
  #
  # end
  # def scalar_subtract!
  # def divide!
  # def scalar_divide
  #
  # end
  # def scalar_divide!
  # def inverse!
  # def transpose!
  # def set(i,j)
  #
  # end
  # def round!
>>>>>>> just did some tests
end