## Test Cached Matrix Inverse functions 

B <- matrix( c(4, 2, 2,
               2, 3, 1,
               2, 1, 3), nrow=3, byrow=TRUE)

## Make a cached matrix

B_cached <- makeCacheMatrix(B)

## Compute Inverse of cached matrix

Inv_B <- cacheSolve(B_cached)

print(Inv_B)

## Expected Result
##       [,1]  [,2]  [,3]
## [1,]  0.50 -0.25 -0.25
## [2,] -0.25  0.50  0.00
## [3,] -0.25  0.00  0.50

## Compute Inverse Second time to get the cached results
Inv_B <- cacheSolve(B_cached)

print(Inv_B)
