require './sparse_element'

class SparseMatrix

  def initialize(matrix)
    @row = matrix.row_size
    @col = matrix.column_size
    @elements = Hash.new

    matrix.each_with_index { |i, j, element|
      @elements[index(i,j)] = element unless element == 0
    }

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

  def [](i,j)
    elements[index(i,j)]
  end

private
  def index(i,j)
    (i-1)*@row +  (j - 1)
  end
end