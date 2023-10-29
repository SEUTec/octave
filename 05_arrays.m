# Arrays

# 1 row, 4 columns
a = [1, 2, 3, 4]
a1 = [1 2 3 4]

# 4 rows, 1 column
b = [1; 2; 3; 4]

# How to get the array values
a(3)
b(2)

# Add more data in the array
a(6) = 6

# Add at the end of the array
a(end + 1) = 7

# Get first data in the array
a(1)
# Get last data in the array
a(end)
# Frist half
a(1:end/2)
# Delete last element
a(end) = []
# Reversal
a(end:-1:1)



# Array creation
# from 1 to 20 with steps of 1
a1=1:20
# from 0 to 5 with steps of 0.1
a2=0:0.1:5
# Array of specific number
a5 = ones(1, 3) * 5

# Array of zeros
z1 = zeros(1,3)
# Array of zeros on column
z2 = zeros(4,1)

# Array of Randoms
r1 = rand(1,3)
# Array of Randoms on column
r2 = rand(3,1)

# Return a matrix with normally distributed random elements having
# zero mean and variance one.
rn1 = randn(1,3)
