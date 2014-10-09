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
amf = AbstractMatrixFactory.new
sparse_matrix = amf.identity(5)
normal_matrix = amf.[]([1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [5, 4, 3, 2, 1], [0, 0, 0, 0,1], [2, 4, 6, 8, 10])


#perform actions on them, actions work on both types of matrixes
#each element is multiplied by 5
sparse_matrix.scalar_multiply!(5)
normal_matrix.scalar_multiply!(5)

#new_matrix is now sparse matrix and normal matrix added together
new_matrix = sparse_matrix + normal_matrix

#invser_matrix is the inverse of new_matrix, if it exists
inverse_matrix = new_matrix.inverse()

#results are the eigen values of new_matrix
eigen_value = new_matrix.eigen

#changes an element in normal matrix
normal_matrix.set(1, 1, 5)

#rounds the sparse matrix
sparse_matrix.round!(5)

#adds 5 to every element in normal matrix
normal_matrix.scalar_add!(5)

#subtracts and returns the sparse matrix with every element 2 smaller
subtract_matrix = sparse_matrix.scalar_subtract(2)

#multiplies normal matrix and sparse matrix
sparse_matrix.multiply!(normal_matrix)