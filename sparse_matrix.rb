require './sparse_element'

class SparseMatrix

  def initialize(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Array[]

    count = Integer(0)
    matrix.each do |element|
      count++
      @elements << Sparse_Element.new(element, count)
    end
  end

  def compute
    100
  end

  def transpose!
    # code here
  end

  def to_matrix
    @elements.each do |element|
      puts element.instance_variable_get #value
      puts element.instance_variable_get #locaion
    end
  end
end