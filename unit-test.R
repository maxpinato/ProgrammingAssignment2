##unit-test
m100 <- matrix( sample( 1:10,100 ,replace=TRUE),10,10 )
message( "m100 (START) : " , Sys.time() )
m100Solve <- solve(m100)
message( "m100 (END) : " , Sys.time() )

m10k <- matrix( sample( 1:10,10000,replace=TRUE), 100,100 )
message( "m10k (START) : " , Sys.time() )
m10kSolve <- solve(m10k)
message( "m10k (END) : " , Sys.time() )

m1m <- matrix( sample( 1:10,1000000,replace=TRUE), 1000,1000 )
message( "m1m (START) : " , Sys.time() )
m1mSolve <- solve(m1m)
message( "m1m (END) : " , Sys.time() )

m4m <- matrix( sample( 1:10,4000000,replace=TRUE), 2000,2000 )
message( "m4m (START) : " , Sys.time() )
m4mSolve <- solve(m4m)
message( "m4m (END) : " , Sys.time() )

cache <- makeCacheMatrix()
cache$set(m4m)
cache$setCachedResult(m4mSolve)

message( "m4m (START WITH cacheSolve) : " , Sys.time() )
m4mCacheSolve <- cacheSolve(cache)
message( "m4m (END WITH cacheSolve) : " , Sys.time() )

message("identical(m4mSolve,m4mCacheSolve) : ",identical(m4mSolve,m4mCacheSolve))
