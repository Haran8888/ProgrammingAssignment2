## The objective the functions in this file are to able to cache potentially time-consuming computation 
## of Matrix inversion so that subsequest attempts to compute Matrix Inversion on the same unmodified matrix
## will return the cached vaule to speed up the operation

## makeCacheMatrix: This function creates a special "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setinverse <- function(iv) inv <<- iv
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## `cacheSolve`: This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then this
## `cacheSolve` will retrieve the inverse from the cache and return.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    
    x$setinverse(inv)
    inv
}
