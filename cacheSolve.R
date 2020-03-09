# blablabla
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    setdata <- function(y) {
        x <<- y
        s <<- NULL
    }
    getdata <- function() x
    setSolve <- function(solve) s <<- solve
    getSolve <- function() s
    list(setdata = setdata, getdata = getdata,
         setSolve = setSolve,
         getSolve = getSolve)
}

cacheSolve <- function(x, ...) {
    s <- x$getSolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$getdata()
    s <- solve(data , ...)
    x$setSolve(s)
    s
}