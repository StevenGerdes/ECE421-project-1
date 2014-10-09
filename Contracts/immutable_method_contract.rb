require('../immutable_method')
class ImmutableMethodContract < Test::Unit::TestCase

  class Array
    include ImmutableMethod
  end

  def test_call_method_immutably

    obj = [1, 2, 3, nil, 2, 3, 4]
    obj_clone = obj.clone
    method = :compact

    #preconditions
    assert_respond_to(method, :to_s)
    assert_respond_to(obj, method.to_s.concat('!').to_sym)

    obj.call_method_immutably(method)
    result = obj_clone.send(method)

    #postconditions
    assert_equal(obj, result)

    #invarient
    #none

  end
end