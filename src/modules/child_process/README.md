# Node.js 'child_process' module functionality.
##  Official Node documentation is [here][1].

## Implementation notes

Rather than using fork(), this uses posix_spawn() and generally makes an 
effort to be efficient. 

[1]:https://nodejs.org/dist/v6.2.2/docs/api/child_process.html
