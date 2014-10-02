gem 'test-unit'
require 'test/unit'
require '../matrix'
require '../abstract_matrix_factory'
require '../matrix_factory'
require '../sparse_matrix_factory'
require '../tridiagonal_matrix_factory'

class AbstractMatrixFactoryContract < Test::Unit::TestCase
  def test_build
    abstract_matrix_factory = AbstractMatrixFactory.new
    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    #None

    new_abstract_matrix = abstract_matrix_factory.build(5, 5) {|row, col| col - row }
    new_matrix = Matrix(5, 5) {|row, col| col - row }

    #Post-condition
    new_matrix.instance_methods.each do |method|
      assert_true(new_abstract_matrix.respond_to?(method))
    end

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def test_zero
    abstract_matrix_factory = AbstractMatrixFactory.new
    #Invarient
    old_matrix_factory = abstract_matrix_factory.clone

    #Pre-conditions
    #None

    new_abstract_matrix = abstract_matrix_factory.zero(5)
    new_matrix = Matrix.zero(5)

    #Post-condition
    new_matrix.instance_methods.each do |method|
      assert_true(new_abstract_matrix.respond_to?(method))
    end

    #Invarient
    assert_equal(old_matrix_factory, abstract_matrix_factory)
  end

  def post_condition_test(new_abstract_matrix)
    new_matrix = Matrix(5, 5) {|row, col| col - row }
    new_matrix.instance_methods.each do |method|
      assert_true(new_abstract_matrix.respond_to?(method))
    end
  end
end