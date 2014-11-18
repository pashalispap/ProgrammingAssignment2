## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
I<-NULL

set<-function(matrix){
  A<<-matrix
  I<<-NULL
}

get<-function(){
  A
}

setInverse<-function(inverse){
  I<<-inverse
}

getInverse<-function(){
  I
}

list(set=set, get=get,
     setInverse=setInvere,
     getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
        ## Return a matrix that is the inverse of 'x'
  i<-x$getInverse
  
  if(!is.null(i)){
    message("getting cached data")
    return (i)
  }
  
  data<-x$get()
  
  i<-solve(data) %*% data
  
  x$setInverse(i)
  
  i
}
