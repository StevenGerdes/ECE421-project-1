require './abstract_matrix_factory'
require './sparse_matrix_factory'
require './sparse_matrix'
require './matrix'

#this code is run using one of the build methods in the abstract matrix factory
#when a matrix is built, it will either return a normal matrix or a sparse matrix
#depending on the input. if there are less then 50% of the values filled in then
#it will be a sparse matrix. the user will not know which matrix they have gotten
#back. all functions described in the matrix_contract file function on both kinds
#of matrixes.

#create a matrix using the AbstractMatrixFactory
sparse_matrix = AbstractMatrixFactory.I(5)
normal_matrix = AbstractMatrixFactory.[]([1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [5, 4, 3, 2, 1])

#perform actions on them, actions work on both matrixes
sparse_matrix.scalar_multiply!(5)
normal_matrix.scalar_multiply!(5)

new_matrix = sparse_matrix + normal_matrix

inverse_matrix = new_matrix.inverse()

eigen_value = new_matrix.eigen