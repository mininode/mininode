# MiniNode - Node.js for Embedded Systems

This is [libuv](1), [http-parser](2), [mbedtls](3), and [miniz](4) held 
together with [duktape](5). The goal here is to produce an implementation of
the [Node.js 6.2.2 API](6) with a full-fledged ES5.1 interpreter in a single 
binary suitable for embedded systems. This is just a conceptual mockup.

[1]: (https://github.com/libuv/libuv.git)
[2]: (https://github.com/nodejs/http-parser.git)
[3]: (https://github.com/ARMmbed/mbedtls/tree/mbedtls-2.3)
[4]: (https://www.progville.com/c/miniz-fast-small-zip/)
[5]: (http://duktape.org)
[6]: (https://nodejs.org/api/documentation.html)