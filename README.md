# MiniNode - Node.js for Embedded Systems

This is [libuv][1], [http-parser][2], [mbedtls][3], and [miniz][4] held 
together with [duktape][5]. The goal here is to produce an implementation of
the [Node.js 6.2.2 API][6] with a full-fledged Javascript ES5.1 interpreter in 
a single binary with no runtime dependencies other than a standard C library.

This aims to implement the Node.js standard library entirely in C.

This is very early in development. Any feedback is very welcome!

## NOTE: PRE-ALPHA QUALITY!

I've posted this for early feedback and to receive input during the development 
process, but this is not close to being usable. I intend to borrow a lot of 
code from [Dukluv][8] and track the upstream Duktape development process, but 
any thoughts (in, say, the form of issues) would be appreciated!

## Notes on Compatibility

While this aspires to be compatible with the Node 6.2.2 API, it does not aspire 
to be tit-for-tat compatible with every nuance of the V8 Node.js runtime. Since 
the standard library is written in C (as opposed to Javascript), it may not be 
possible to (for example) access the prototypes of built-in modules unless this 
has been explicitly implemented. I'd like to do a websockets implementation in 
C, as well as an implementation of the [proposed iot.js GPIO API][8] and 
eventually an NPM registry specifically for mininode.

So, while I'd like for the overall development experience to be very similar, 
code which is heavily dependent on the features and internal behavior of the 
mainline Node.js runtime will likely need to be ported.

## Build Instructions

This uses GNU make and it is currently being developed on MacOS X, and 
other systems are not yet supported but this should also work on Linux, 
Illumos/Solaris, and FreeBSD (possibly with minimal porting effort).

From a MacOS X system:

    git clone https://github.com/hypoalex/mininode.git
    cd mininode
    git submodule init
    git submodule update
    make -j4

For use on embedded systems, musl libc and Linux are recommended (in general).

## Developing with Vagrant

The included `Vagrantfile` runs Alpine Linux 3.4 and is meant for Virtualbox 5 
on MacOS hosts. It mounts the mininode sources at /src via NFS.

    vagrant up
    vagrant ssh
    cd /src
    make

## What's the point?

This is intended aid in rapid development of small embedded clients, with 
realistic requirements of ~75mhz and 2MB RAM although less might be workable. 
Since this will likely never approach the performance of V8 as a javascript 
interpreter, you will almost certainly want to continue using mainstream 
Node.js for servers unless you are prepared to write the bulk of your hot path 
in C using duktape.

[1]: https://github.com/libuv/libuv.git
[2]: https://github.com/nodejs/http-parser.git
[3]: https://github.com/ARMmbed/mbedtls/tree/mbedtls-2.3
[4]: https://www.progville.com/c/miniz-fast-small-zip/
[5]: http://duktape.org
[6]: https://nodejs.org/dist/v6.2.2/docs/api/
[7]: https://github.com/creationix/dukluv/tree/master/src
[8]: https://github.com/Samsung/iotjs/wiki/GPIO-API-candidate
