## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix create a special "vector", which is really a list containing a function to
## - set the value of the matrix
## - get the value of the matrix
## - set the value of the inverse of the matrix
## - get the value of the inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
  ##Initialize the inverse (I)
I<-NULL

  ##This is a method to set the matrix
set<-function(matrix){
  x<<-matrix
  I<<-NULL
}

  ##This is a method to get the matrix
get<-function(){
  x
}

  ##This is a method to set the inverse of the matrix
setInverse<-function(inverse){
  I<<-inverse
}

  ##This is a method to get the inverse of the matrix
getInverse<-function(){
  I
}

  ##This is a method to create the list we want
list(set=set, get=get,
     setInverse=setInverse,
     getInverse=getInverse)
}


## The following function calculates the inverse of the special matrix
## created with the makeCacheMatrix function.
## It first checks to see if the inverse matrix has already been calculated.
## If so, it gets the inverse matrix from the cache
## and skips the computation.
## Otherwise, it calculates the inverse matrix
## and sets its value via the setInverse function.

cacheSolve <- function(x, ...) {
  
        ## Return the inverse matrix of x
  I<-x$getInverse
  
        ## If the inverse matrix has already calculated return the matrix from the cache
  if(!is.null(I)){
    message("getting cached data")
    return (I)
  }
  
      ## Get the matrix from the object
  data<-x$get()
  
      ## Calculate the inverse matrix
  I<-solve(data)
  
      ## Set the inverse matrix to the object
  x$setInverse(I)
  
      ## Return the inverse matrix
  I
}
