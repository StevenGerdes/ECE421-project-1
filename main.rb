require 'matrix'

blah = Matrix.I(4)
puts blah
puts "okay?"
first, second = blah.coerce(1)
puts first
puts second