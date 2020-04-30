## These functions create a special matrix that can
## store and retrieve its inverse

## ## Create a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  

  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  get <- function() {

    m
  }
  

  setInverse <- function(inverse) {
    i <<- inverse
  }
  

  getInverse <- function() {
   
    i
  }
  

  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Calculate or retrieve a special matrix inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
 
  data <- x$get()
  
  
  m <- solve(data) %*% data
  
 
  x$setInverse(m)
  

  m
}
