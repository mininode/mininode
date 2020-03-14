#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const process = require('process');
const readline = require('readline');

function printRules(srcs, incs, objs, srcdir, objdir) {
  for(let i = 0; i < srcs.length; i++) {
    let src = path.join(srcdir, srcs[i]);
    let obj = path.join(objdir, path.join(path.dirname(srcs[i]), path.basename(src, path.extname(src)) + '.o'));
    let dep = path.join(objdir, path.join(path.dirname(srcs[i]), path.basename(src, path.extname(src)) + '.d'));
    let includes = "";
    objs.push(obj);
    for(let i = 0; i < incs.length; i++) {
       if(incs[i].length > 0) {
        includes += "-I" + incs[i] + " ";
      }
    }
    console.log("%s: %s | objdir", obj, src);
    console.log("\t$(CC) $(CORE_CFLAGS) %s -c $< -o $@ -MMD -MP -MT'$@' -MF %s", includes, dep);
    //console.log("MODULE_OBJS += %s", obj);
    console.log("CORE_DEPS += %s", dep);
  }
}

function printTarget(objdir, target, objs) {
  var objstr = "";
  for(let i = 0; i < objs.length; i++) {
    objstr += objs[i] + " ";
  }
  console.log("%s/build/%s: %s", objdir, target, objstr);
	console.log("\tar rcs $@ $^");
  return objstr;
}

var configReader = readline.createInterface({
  input: fs.createReadStream('.config')
});

var config = {
  srcdir: process.argv[2],
  objdir: process.argv[3],
  contrib: [],
  modules: []
}

configReader.on('line', function(line) {
  if(line.charAt(0) != "#" && line.length > 0) {
    lineParts = line.split("=");
    if(lineParts[0].search("CONFIG_MN_CONTRIB_") !== -1 && lineParts[1] === "y") {
      let contrib = lineParts[0].substr(18).toLowerCase();
      config.contrib.push(contrib);
    }
    if(lineParts[0].search("CONFIG_MN_MODULE_") !== -1 && lineParts[1] === "y") {
      let module = lineParts[0].substr(17).toLowerCase();
      config.modules.push(module);
    }
  }
});

configReader.on('close', function(){
  //console.log(config)
  var requiredTargets = [];
  var requireString = "";
  var libString = "";
  var requiredObjs = "";
  Object.keys(config.contrib).map(function(key, idx) {
    let dep = config.contrib[idx];
    let target = srcs.contrib[dep].target;
    let src = srcs.contrib[dep].srcs;
    //let obj = path.join(config.objdir, path.join(path.dirname(srcs[i]), path.basename(src, path.extname(src)) + '.o'));
    libString += "-l" + srcs.contrib[dep].name + " ";
    requiredTargets.push(srcs.contrib[dep].target);
    printRules(srcs.contrib[dep].srcs, srcs.contrib[dep].incs, srcs.contrib[dep].objs, config.srcdir, config.objdir);
    if(dep !== 'bearssl') {
      printTarget(config.objdir, srcs.contrib[dep].target, srcs.contrib[dep].objs);
    }
  });
  Object.keys(config.modules).map(function(key, idx) {
    let dep = config.modules[idx];
    printRules(srcs.modules[dep].srcs, srcs.modules[dep].incs, srcs.modules[dep].objs, config.srcdir, config.objdir);
    srcs.modules[dep].objs.map(function(object) {
      requiredObjs += object + " ";
    });
  });
  requiredTargets.map(function(t) {
    requireString += "$(OBJDIR)/build/" + t + " "; 
  });
  console.log("$(OBJDIR)/build/mininode: " + requireString + requiredObjs + "| objdir");
	console.log("\t$(CC) $(CORE_CFLAGS) $(CORE_LINKFLAGS)" + libString + "$^ -o $@");
})

var srcs = {
  contrib: {
    'duktape': {
      srcs: ['src/contrib/duktape/duktape.c'],
      incs: ['src/contrib/duktape'],
      objs: [],
      target: 'libduktape.a',
      name: 'duktape'
    },
    'libuv': {
      srcs: [
        'src/contrib/libuv/src/threadpool.c',
        'src/contrib/libuv/src/unix/async.c',
        'src/contrib/libuv/src/unix/dl.c',
        'src/contrib/libuv/src/unix/fs.c',
        'src/contrib/libuv/src/unix/getaddrinfo.c',
        'src/contrib/libuv/src/unix/getnameinfo.c',
        'src/contrib/libuv/src/unix/loop-watcher.c',
        'src/contrib/libuv/src/unix/loop.c',
        'src/contrib/libuv/src/unix/pipe.c',
        'src/contrib/libuv/src/unix/process.c',
        'src/contrib/libuv/src/unix/signal.c',
        'src/contrib/libuv/src/unix/stream.c',
        'src/contrib/libuv/src/unix/tcp.c',
        'src/contrib/libuv/src/unix/thread.c',
        'src/contrib/libuv/src/unix/timer.c',
        'src/contrib/libuv/src/unix/tty.c',
        'src/contrib/libuv/src/unix/udp.c',
        'src/contrib/libuv/src/version.c',
        'src/contrib/libuv/src/inet.c',
        'src/contrib/libuv/src/fs-poll.c',
        'src/contrib/libuv/src/unix/proctitle.c',
        'src/contrib/libuv/src/uv-common.c',
        'src/contrib/libuv/src/unix/linux-core.c',
        'src/contrib/libuv/src/unix/linux-inotify.c',
        'src/contrib/libuv/src/unix/linux-syscalls.c',
        'src/contrib/libuv/src/unix/core.c',
        'src/contrib/libuv/src/unix/poll.c'
      ],
      incs: [
        'src/contrib/libuv/include',
        'src/contrib/libuv/src'
      ],
      objs: [],
      name: 'uv',
      target: 'libuv.a'
    },
    'libcares': {
      srcs: [
        'src/contrib/cares/ares__close_sockets.c',
        'src/contrib/cares/ares__get_hostent.c',
        'src/contrib/cares/ares__read_line.c',
        'src/contrib/cares/ares__timeval.c',
        'src/contrib/cares/ares_cancel.c',
        'src/contrib/cares/ares_data.c',
        'src/contrib/cares/ares_destroy.c',
        'src/contrib/cares/ares_expand_name.c',
        'src/contrib/cares/ares_expand_string.c',
        'src/contrib/cares/ares_fds.c',
        'src/contrib/cares/ares_free_hostent.c',
        'src/contrib/cares/ares_free_string.c',
        'src/contrib/cares/ares_getenv.c',
        'src/contrib/cares/ares_gethostbyaddr.c',
        'src/contrib/cares/ares_gethostbyname.c',
        'src/contrib/cares/ares_getnameinfo.c',
        'src/contrib/cares/ares_getsock.c',
        'src/contrib/cares/ares_init.c',
        'src/contrib/cares/ares_library_init.c',
        'src/contrib/cares/ares_llist.c',
        'src/contrib/cares/ares_mkquery.c',
        'src/contrib/cares/ares_create_query.c',
        'src/contrib/cares/ares_nowarn.c',
        'src/contrib/cares/ares_options.c',
        'src/contrib/cares/ares_parse_a_reply.c',
        'src/contrib/cares/ares_parse_aaaa_reply.c',
        'src/contrib/cares/ares_parse_mx_reply.c',
        'src/contrib/cares/ares_parse_naptr_reply.c',
        'src/contrib/cares/ares_parse_ns_reply.c',
        'src/contrib/cares/ares_parse_ptr_reply.c',
        'src/contrib/cares/ares_parse_soa_reply.c',
        'src/contrib/cares/ares_parse_srv_reply.c',
        'src/contrib/cares/ares_parse_txt_reply.c',
        'src/contrib/cares/ares_platform.c',
        'src/contrib/cares/ares_process.c',
        'src/contrib/cares/ares_query.c',
        'src/contrib/cares/ares_search.c',
        'src/contrib/cares/ares_send.c',
        'src/contrib/cares/ares_strcasecmp.c',
        'src/contrib/cares/ares_strdup.c',
        'src/contrib/cares/ares_strerror.c',
        'src/contrib/cares/ares_timeout.c',
        'src/contrib/cares/ares_version.c',
        'src/contrib/cares/ares_writev.c',
        'src/contrib/cares/bitncmp.c',
        'src/contrib/cares/inet_net_pton.c',
        'src/contrib/cares/inet_ntop.c'
      ],
      incs: ['src/contrib/cares'],
      objs: [],
      target: 'libcares.a',
      name: 'cares'
    },
    'bearssl': {
      srcs: [],
      incs: [],
      objs: [],
      target: 'libbearssl.a',
      name: 'bearssl'
    },
    'http_parser': {
      srcs: ['src/contrib/http-parser/http_parser.c'],
      incs: ['src/contrib/http-parser'],
      objs: [],
      target: 'libhttparser.a',
      name: 'httparser'
    },
    'libslz': {
      srcs: ['src/contrib/libslz/src/slz.c'],
      incs: ['src/contrib/libslz/src'],
      objs: [],
      target: 'libslz.a',
      name: 'slz'
    },
    'lowzip': {
      srcs: ['src/contrib/lowzip/lowzip.c'],
      incs: ['src/contrib/lowzip'],
      objs: [],
      target: 'liblowzip.a',
      name: 'lowzip'
    }
  },
  // for each module, first we assemble a list of deps.
  // for each dep, we assemble the list of include paths.
  // for each source file, we emit a compilation rule and add the object to the objs prop
  // finally, we emit our target rule which depends on each object
  modules: {
    'assert': {
      srcs: [
        'src/modules/assert/assert.c',
        'src/modules/assert/methods/deep_equal.c',
        'src/modules/assert/methods/deep_strict_equal.c',
        'src/modules/assert/methods/does_not_throw.c',
        'src/modules/assert/methods/equal.c',
        'src/modules/assert/methods/fail.c',
        'src/modules/assert/methods/if_error.c',
        'src/modules/assert/methods/not_deep_equal.c',
        'src/modules/assert/methods/not_equal.c',
        'src/modules/assert/methods/not_strict_deep_equal.c',
        'src/modules/assert/methods/not_strict_equal.c',
        'src/modules/assert/methods/ok.c',
        'src/modules/assert/methods/strict_equal.c',
        'src/modules/assert/methods/throws.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_assert.a'
    },
    'buffer': {
      srcs: ['src/modules/buffer/buffer.c'],
      incs: ['src/modules/buffer'],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_buffer.a'
    },
    'child_process': {
      srcs: [
        'src/modules/child_process/child_process.c',
        'src/modules/child_process/methods/disconnect.c',
        'src/modules/child_process/methods/exec.c',
        'src/modules/child_process/methods/exec_file.c',
        'src/modules/child_process/methods/exec_file_sync.c',
        'src/modules/child_process/methods/exec_sync.c',
        'src/modules/child_process/methods/fork.c',
        'src/modules/child_process/methods/kill.c',
        'src/modules/child_process/methods/send.c',
        'src/modules/child_process/methods/spawn.c',
        'src/modules/child_process/methods/spawn_sync.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_child_process.a'
    },
    'console': {
      srcs: [
        'src/modules/console/console.c',
        'src/modules/console/methods/assert.c',
        'src/modules/console/methods/dir.c',
        'src/modules/console/methods/error.c',
        'src/modules/console/methods/info.c',
        'src/modules/console/methods/log.c',
        'src/modules/console/methods/time.c',
        'src/modules/console/methods/time_end.c',
        'src/modules/console/methods/trace.c',
        'src/modules/console/methods/warn.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_console.a'
    },
    'cluster': {
      srcs: [
        'src/modules/cluster/cluster.c',
        'src/modules/cluster/classes/worker/worker.c',
        'src/modules/cluster/classes/worker/methods/disconnect.c',
        'src/modules/cluster/classes/worker/methods/is_connected.c',
        'src/modules/cluster/classes/worker/methods/is_dead.c',
        'src/modules/cluster/classes/worker/methods/kill.c',
        'src/modules/cluster/classes/worker/methods/send.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_cluster.a'
    },
    'crypto': {
      srcs: [
        'src/modules/crypto/crypto.c',
        'src/modules/crypto/methods/create_cipher.c',
        'src/modules/crypto/methods/create_cipheriv.c',
        'src/modules/crypto/methods/create_credentials.c',
        'src/modules/crypto/methods/create_decipher.c',
        'src/modules/crypto/methods/create_decipheriv.c',
        'src/modules/crypto/methods/create_diffie_hellman.c',
        'src/modules/crypto/methods/create_ecdh.c',
        'src/modules/crypto/methods/create_hash.c',
        'src/modules/crypto/methods/create_hmac.c',
        'src/modules/crypto/methods/create_sign.c',
        'src/modules/crypto/methods/create_verify.c',
        'src/modules/crypto/methods/get_ciphers.c',
        'src/modules/crypto/methods/get_curves.c',
        'src/modules/crypto/methods/get_diffie_hellman.c',
        'src/modules/crypto/methods/get_hashes.c',
        'src/modules/crypto/methods/pbkdf2.c',
        'src/modules/crypto/methods/pbkdf2_sync.c',
        'src/modules/crypto/methods/private_decrypt.c',
        'src/modules/crypto/methods/private_encrypt.c',
        'src/modules/crypto/methods/public_encrypt.c',
        'src/modules/crypto/methods/public_decrypt.c'
      ],
      incs: [],
      objs: [],
      contrib_deps: ['duktape', 'libuv'],
      deps: ['core'],
      target: 'libmn_crypto.a'
    },
    'debugger': {
      srcs: ['src/modules/debugger/debugger.c'],
      incs: [],
      objs: [],
      contrib_deps: ['duktape', 'libuv'],
      deps: ['core'],
      target: 'libmn_debugger.a'
    },
    'dgram': {
      srcs: [
        'src/modules/dgram/dgram.c',
        'src/modules/dgram/classes/socket/socket.c',
        'src/modules/dgram/classes/socket/methods/add_membership.c',
        'src/modules/dgram/classes/socket/methods/address.c',
        'src/modules/dgram/classes/socket/methods/bind.c',
        'src/modules/dgram/classes/socket/methods/close.c',
        'src/modules/dgram/classes/socket/methods/ref.c',
        'src/modules/dgram/classes/socket/methods/send.c',
        'src/modules/dgram/classes/socket/methods/set_broadcast.c',
        'src/modules/dgram/classes/socket/methods/set_multicast_loopback.c',
        'src/modules/dgram/classes/socket/methods/set_multicast_ttl.c',
        'src/modules/dgram/classes/socket/methods/set_ttl.c',
        'src/modules/dgram/classes/socket/methods/unref.c'
      ],
      incs: [],
      objs: [],
      contrib_deps: ['duktape', 'libuv'],
      deps: ['core'],
      target: 'libmn_dgram.a'
    },
    'dns': {
      srcs: ['src/modules/dns/dns.c'],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv', 'libcares'],
      target: 'libmn_dns.a'
    },
    'errors': {
      srcs: ['src/modules/errors/errors.c'],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_errors.a'
    },
    'events': {
      srcs: ['src/modules/events/events.c'],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_events.a'
   },
    'fs': {
      srcs: [
        'src/modules/fs/fs.c',
        'src/modules/fs/methods/access.c',
        'src/modules/fs/methods/access_sync.c',
        'src/modules/fs/methods/append_file.c',
        'src/modules/fs/methods/append_file_sync.c',
        'src/modules/fs/methods/chmod.c',
        'src/modules/fs/methods/chmod_sync.c',
        'src/modules/fs/methods/chown.c',
        'src/modules/fs/methods/chown_sync.c',
        'src/modules/fs/methods/close.c',
        'src/modules/fs/methods/close_sync.c',
        'src/modules/fs/methods/create_read_stream.c',
        'src/modules/fs/methods/create_write_stream.c',
        'src/modules/fs/methods/fchmod.c',
        'src/modules/fs/methods/fchmod_sync.c',
        'src/modules/fs/methods/fdatasync.c',
        'src/modules/fs/methods/fdatasync_sync.c',
        'src/modules/fs/methods/fstat.c',
        'src/modules/fs/methods/fstat_sync.c',
        'src/modules/fs/methods/fsync.c',
        'src/modules/fs/methods/fsync_sync.c',
        'src/modules/fs/methods/ftruncate.c',
        'src/modules/fs/methods/ftruncate_sync.c',
        'src/modules/fs/methods/lchmod.c',
        'src/modules/fs/methods/lchmod_sync.c',
        'src/modules/fs/methods/lchown.c',
        'src/modules/fs/methods/lchown_sync.c',
        'src/modules/fs/methods/link.c',
        'src/modules/fs/methods/link_sync.c',
        'src/modules/fs/methods/lstat.c',
        'src/modules/fs/methods/lstat_sync.c',
        'src/modules/fs/methods/mkdir.c',
        'src/modules/fs/methods/mkdir_sync.c',
        'src/modules/fs/methods/mkdtemp.c',
        'src/modules/fs/methods/mkdtemp_sync.c',
        'src/modules/fs/methods/open.c',
        'src/modules/fs/methods/open_sync.c',
        'src/modules/fs/methods/read.c',
        'src/modules/fs/methods/readdir.c',
        'src/modules/fs/methods/readdir_sync.c',
        'src/modules/fs/methods/read_file.c',
        'src/modules/fs/methods/read_file_sync.c',
        'src/modules/fs/methods/readlink.c',
        'src/modules/fs/methods/readlink_sync.c',
        'src/modules/fs/methods/read_sync.c',
        'src/modules/fs/methods/realpath.c',
        'src/modules/fs/methods/realpath_sync.c',
        'src/modules/fs/methods/rename.c',
        'src/modules/fs/methods/rename_sync.c',
        'src/modules/fs/methods/rmdir.c',
        'src/modules/fs/methods/rmdir_sync.c',
        'src/modules/fs/methods/stat.c',
        'src/modules/fs/methods/stat_sync.c',
        'src/modules/fs/methods/symlink.c',
        'src/modules/fs/methods/symlink_sync.c',
        'src/modules/fs/methods/truncate.c',
        'src/modules/fs/methods/truncate_sync.c',
        'src/modules/fs/methods/unlink.c',
        'src/modules/fs/methods/unlink_sync.c',
        'src/modules/fs/methods/unwatch_file.c',
        'src/modules/fs/methods/utimes.c',
        'src/modules/fs/methods/utimes_sync.c',
        'src/modules/fs/methods/watch.c',
        'src/modules/fs/methods/watch_file.c',
        'src/modules/fs/methods/write.c',
        'src/modules/fs/methods/write_file.c',
        'src/modules/fs/methods/write_file_sync.c',
        'src/modules/fs/methods/write_sync.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_fs.a'
    },
    'http': {
      srcs: [
        'src/modules/http/http.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv', 'http-parser'],
      target: 'libmn_http.a'
    },
    'http2': {
      srcs: [
        'src/modules/http2/http2.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv', 'http-parser'],
      target: 'libmn_http2.a'
    },
    'https': {
      srcs: [
        'src/modules/https/https.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv', 'http-parser'],
      target: 'libmn_https.a'
    },
    'net': {
      srcs: [
        'src/modules/net/net.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_net.a'
    },
    'os': {
      srcs: [
        'src/modules/os/os.c',
        'src/modules/os/methods/arch.c',
        'src/modules/os/methods/cpus.c',
        'src/modules/os/methods/endianness.c',
        'src/modules/os/methods/freemem.c',
        'src/modules/os/methods/homedir.c',
        'src/modules/os/methods/hostname.c',
        'src/modules/os/methods/loadavg.c',
        'src/modules/os/methods/network_interfaces.c',
        'src/modules/os/methods/platform.c',
        'src/modules/os/methods/release.c',
        'src/modules/os/methods/tmpdir.c',
        'src/modules/os/methods/totalmem.c',
        'src/modules/os/methods/type.c',
        'src/modules/os/methods/uptime.c',
        'src/modules/os/methods/user_info.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_os.a'
    },
    'path': {
      srcs: [
        'src/modules/path/path.c',
        'src/modules/path/methods/basename.c',
        'src/modules/path/methods/dirname.c',
        'src/modules/path/methods/extname.c',
        'src/modules/path/methods/format.c',
        'src/modules/path/methods/is_absolute.c',
        'src/modules/path/methods/join.c',
        'src/modules/path/methods/normalize.c',
        'src/modules/path/methods/parse.c',
        'src/modules/path/methods/relative.c',
        'src/modules/path/methods/resolve.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_path.a'
    },
    'process': {
      srcs: [
        'src/modules/process/process.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_process.a'
    },
    'punycode': {
      srcs: [
        'src/modules/punycode/punycode.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_punycode.a'
    },
    'querystring': {
      srcs: [
        'src/modules/querystring/querystring.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_querystring.a'
    },
    'readline': {
      srcs: [
        'src/modules/readline/readline.c',
        'src/modules/readline/methods/clear_line.c',
        'src/modules/readline/methods/clear_screen_down.c',
        'src/modules/readline/methods/create_interface.c',
        'src/modules/readline/methods/cursor_to.c',
        'src/modules/readline/methods/emit_keypress_events.c',
        'src/modules/readline/methods/move_cursor.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_readline.a'
    },
    'repl': {
      srcs: ['src/modules/repl/repl.c'],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_repl.a'
    },
    'stream': {
      srcs: [],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_stream.a'
    },
    'string_decoder': {
      srcs: [
        'src/modules/string_decoder/string_decoder.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_string_decoder.a'
    },
    'tls': {
      srcs: [
        'src/modules/tls/tls.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_tls.a'
    },
    'timers': {
      srcs: [
        'src/modules/timers/timers.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_timers.a'
    },
    'tty': {
      srcs: [
        'src/modules/tty/tty.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_tty.a'
    },
    'url': {
      srcs: [
        'src/modules/url/url.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_url.a'
    },
    'util': {
      srcs: [
        'src/modules/util/util.c'
      ],
      incs: [],
      objs: [],
      deps: ['duktape', 'libuv'],
      target: 'libmn_util.a'
    },
    'v8': {
      srcs: [
        'src/modules/v8/v8.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_v8.a'
    },
    'vm': {
      srcs: [
        'src/modules/vm/vm.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv'],
      target: 'libmn_vm.a'
    },
    'zlib': {
      srcs: [
        'src/modules/zlib/zlib.c'
      ],
      incs: [],
      objs: [],
      deps: ['core'],
      contrib_deps: ['duktape', 'libuv', 'libslz', 'lowzip'],
      target: 'libmn_zlib.a'
    },
    'core': {
      srcs: [
        'src/core/ref.c',
        'src/core/core.c',
        'src/core/loader.c',
        'src/core/mininode.c'
      ],
      incs: [
        'src/include'
      ],
      objs: [],
      target: ['libmn_core.a'],
      contrib_deps: ['duktape', 'libuv']
    }
  }
}

