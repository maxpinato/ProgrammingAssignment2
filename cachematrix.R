## Put comments here that give an overall description of what your
## functions do

## ---------------------------------------------------------------
##       makeCacheMatrix
## ---------------------------------------------------------------
## This function allow you to cache a pair of input data and result,
## in order to retrieve immediatly the result when you have to repeat
## a very high-cost computation on a same matrix already calculated.
## The pattern to youse makeCacheMatrix is the following:
## 1. Create a makeCacheMatrix.
## 2. Set the input data with method 'set'
## 3. Do your computation and store the result with 'setCacheResult'
## 4. In the following computation, when the input data is the same, 
##    you can use 'getCacheResult' to have the cached result.
## ADDON - You can use this function in pair with 'cacheSolve' in 
##    order to semplify the step 4.
## ***  DEFINITION *****************************
## - Local Private Variable
##     cachedResult - Cached value
##     x - Matrix to be calculated
## - Public Method
##     get - Return the matrix stored as input data.
##     set - Store the matrix used as input data
##     getCachedResult - return the cached result
##     setCachedResult - store the result of the external computation
## ---------------------------------------------------------------
makeCacheMatrix <- function(x = matrix()) {
  
  cachedResult <- NULL
  set <- function(y){
    x <<- y
    cachedResult <<- NULL
  } 
  get <- function() x
  setCachedResult <- function(cachedResult) cachedResult <<- cachedResult
  getCachedResult <- function() cachedResult
  list(
    set = set,
    get = get,
    setCachedResult = setCachedResult,
    getCachedResult = getCachedResult
  )
  
}

## ---------------------------------------------------------------
##       cacheSolve
## ---------------------------------------------------------------
## This function has to be used in conjunction with makeCacheMatrix
## in order to simplify a cached calcolation of the inverse of a
## Matrix.
## The pattern to use this function is the following:
## 1. m1 <- ... create matrix
## 2. cachedMatrix <- makeCacheMatrix()
## 3. cachedMatrix$set(m1)
## 4. cacheSolve(cacheMatrix) ## First time, real calculation
## 5. cacheSolve(cacheMatrix) ## Second time, return the cache result.
## ***  DEFINITION *****************************
## - Parameters
##   x - Must be a list created with the makeCacheMatrix function
##       and contains the cached value of the specific matrix
##       stored on x$get
## ---------------------------------------------------------------

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  inverse <- x$getCachedResult()
  if( !is.null(inverse) ){
    ##message("getting chache data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setCachedResult(inverse)
  return(inverse)
  
}
