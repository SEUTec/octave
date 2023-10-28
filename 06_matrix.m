# 2D array or Matrix
xy = [11,12,13,14;
      21,22,23,24 ];
# Select specific element
xy(2, 3)
# Get a row
xy(1,:)
# Get a column
xy(:,2)


# Matrix of Ones
a3 = ones(2,3)
# Matrix of another number
a4 = ones(5) * 4

# Matrix of zeros
z1 = zeros(3)
# Matrix of zeros
z2 = zeros(2,3)

# Matrix of randoms
r1=rand(2,3)

# Return a matrix with normally distributed random elements having
# zero mean and variance one.
r1=randn(2,3)