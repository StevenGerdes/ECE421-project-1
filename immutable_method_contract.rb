gem 'test-unit'
require 'test/unit'
require './immutable_method'

class ImmutableMethodContract < Test::Unit::TestCase

  class TempClass
    include ImmutableMethod

    def initialize(number)
      @value = number
    end
    def increase
      puts "non"
      TempClass.new(@value + 1)
    end
    def increase!
      puts "mutate"
      @value = @value + 1
    end
    def value
      @value
    end
    def ==(other)
      other.value == @value
    end

  end

  def test_call_method_immutably

    obj = TempClass.new(0)
    obj_clone = obj.clone
    method = :increase

    #preconditions
    assert_respond_to(method, :to_s)
    assert_respond_to(obj, method.to_s.concat('!').to_sym)

    result1 = obj.call_method_immutably(method)
    result = obj_clone.send(method)

    #postconditions
    assert_equal(result1, result)

    #invarient
    #none

  end
end