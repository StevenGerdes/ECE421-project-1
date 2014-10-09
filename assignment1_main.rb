require './matrix'

m = Matrix.new
result = m.test_method
m.out
result.out
puts "break"
result = m.test_method_with_args(1,2)
m.out
result.out
puts "break"

m = Matrix.new
m.test_method!
m.out
m.test_method_with_args!(2,3)
m.out
