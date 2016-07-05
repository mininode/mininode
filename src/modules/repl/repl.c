/* A repl library that you can include in your own code to get a runtime
 * interface to your program.
 *
 *   var repl = require("repl");
 *   // start repl on stdin
 *   repl.start("prompt> ");
 *
 *   // listen for unix socket connections and start repl on them
 *   net.createServer(function(socket) {
 *     repl.start("node via Unix socket> ", socket);
 *   }).listen("/tmp/node-repl-sock");
 *
 *   // listen for TCP socket connections and start repl on them
 *   net.createServer(function(socket) {
 *     repl.start("node via TCP socket> ", socket);
 *   }).listen(5001);
 *
 *   // expose foo to repl context
 *   repl.start("node > ").context.foo = "stdin is fun";
 */

#include <stdio.h>
#include <stdlib.h>

