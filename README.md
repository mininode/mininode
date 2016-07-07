# MiniNode - Node.js for Embedded Systems

This is [libuv][1], [http-parser][2], [mbedtls][3], and [miniz][4] held 
together with [duktape][5]. The goal here is to produce an implementation of
the [Node.js 6.2.2 API][6] with a full-fledged Javascript ES5.1 interpreter in 
a single binary with no runtime dependencies other than a standard C library.

This is very early in development. Any feedback is very welcome!

## Build Instructions

This uses GNU make and it should work on Linux, MacOS, Illumos/Solaris, and 
FreeBSD. Other systems are possible provided that they are supported by libuv.

I've only tested with `gcc` and `clang`. Others may work! Please let me know.

    git clone https://github.com/hypoalex/mininode.git
    cd mininode
    git submodule init
    make -j4

For use on embedded systems, musl libc and Linux are recommended.

## What's the point?

This is intended aid in rapid development of small embedded clients, with 
realistic requirements of 200mhz and 4MB RAM although less might be work able. 
Since this will likely never approach the performance of V8, you will almost 
certainly want to continue using mainstream Node.js for servers unless you are
prepared to write the bulk of your hot path in C using duktape.

[1]: https://github.com/libuv/libuv.git
[2]: https://github.com/nodejs/http-parser.git
[3]: https://github.com/ARMmbed/mbedtls/tree/mbedtls-2.3
[4]: https://www.progville.com/c/miniz-fast-small-zip/
[5]: http://duktape.org
[6]: https://nodejs.org/api/documentation.html