# Operation with matrixes

# Return a matrix with Poisson distributed random elements with mean
# value parameter given by the first argument, L.
A = randp(1, 3, 3)
# Opration with each of matrix elements
B = A .+ 2
# Do not need the point . if apply a constant
C = A + 2

A = rand(3)
B = rand(3)

C1 = A + B
C2 = A .+ B

# Con el producto sí que importa el .
# Producto de matrices
# El número de columnas de A = num. filas de B
P1 = A * B
# Producto elemento a elemento
P2 = A .* B

# Con la división tmabién importa el .
# Producto de matrices
P1 = A / B
# Producto elemento a elemento
P2 = A ./ B