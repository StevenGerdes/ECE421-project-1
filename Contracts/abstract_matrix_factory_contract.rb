gem 'test-unit'
require 'test/unit'
require '../matrix'
require '../abstract_matrix_factory'
require '../matrix_factory'
require '../sparse_matrix_factory'
require '../tridiagonal_matrix_factory'

class AbstractMatrixFactoryContract < Test::Unit::TestCase
  def test_build_block
    abstract_matrix_factory = AbstractMatrixFactory.new
    matrix_row = Numeric.new
    matrix_col = Numeric.new

    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    assert_respond_to(matrix_row, :to_i)
    assert_respond_to(matrix_col, :to_i)

    new_abstract_matrix = abstract_matrix_factory.build(matrix_row, matrix_col) {|row, col| col - row }

    #Post-condition
    assert_true(post_condition_test(new_abstract_matrix))

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def test_build_matrix
    abstract_matrix_factory = AbstractMatrixFactory.new
    input_array = Array.new

    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    assert_kind_of(Array, input_array)
    input_array.each do |entry|
      assert_kind_of(Numeric, entry)
    end

    new_abstract_matrix = abstract_matrix_factory.build(input_array)

    #Post-condition
    assert_true(post_condition_test(new_abstract_matrix))

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def test_zero
    abstract_matrix_factory = AbstractMatrixFactory.new
    matrix_arg = Numeric.new

    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    assert_respond_to(matrix_arg, :to_i)

    new_abstract_matrix = abstract_matrix_factory.zero(matrix_arg)

    #Post-condition
    assert_true(post_condition_test(new_abstract_matrix))

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def test_identity
    abstract_matrix_factory = AbstractMatrixFactory.new
    matrix_arg = Numeric.new

    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    assert_respond_to(matrix_arg, :to_i)

    new_abstract_matrix = abstract_matrix_factory.identity(matrix_arg)

    #Post-condition
    assert_true(post_condition_test(new_abstract_matrix))

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def post_condition_test(new_abstract_matrix)
    new_methods = [:multiply!,
                   :scalar_multiply,
                   :scalar_multiply!,
                   :add!,
                   :scalar_add!,
                   :scalar_add,
                   :subtract!,
                   :scalar_subtract,
                   :scalar_subtract!,
                   :divide!,
                   :scalar_divide,
                   :scalar_divide!,
                   :inverse!,
                   :transpose!,
                   :round!,
                   :set,
                   :resize!]
    Matrix.instance_methods.each do |method|
      unless new_abstract_matrix.respond_to?(method)
        return false
      end
    end

    new_methods.each do |method|
      unless new_abstract_matrix.respond_to?(method)
        return false
      end
    end
  end
end