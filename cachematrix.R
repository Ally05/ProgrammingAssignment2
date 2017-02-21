## Put comments here that give an overall description of what your
## functions do

## Solves for the inverse of a matrix to be cached. Sets and gets value of matrix and solves.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y) {
    x<<-y
    m<<-NULL
    
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve
  getinverse<-function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Caches result for inverse of matrix from makeCacheMatrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data)
  x$setinverse(m)
  m
}