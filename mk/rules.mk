/home/alex/code/mininode/obj/src/contrib/duktape/duktape.o: /home/alex/code/mininode/src/contrib/duktape/duktape.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/contrib/duktape  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/contrib/duktape/duktape.d
CORE_DEPS += /home/alex/code/mininode/obj/src/contrib/duktape/duktape.d
/home/alex/code/mininode/obj/build/libduktape.a: /home/alex/code/mininode/obj/src/contrib/duktape/duktape.o 
	ar rcs $@ $^
/home/alex/code/mininode/obj/src/contrib/http-parser/http_parser.o: /home/alex/code/mininode/src/contrib/http-parser/http_parser.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/contrib/http-parser  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/contrib/http-parser/http_parser.d
CORE_DEPS += /home/alex/code/mininode/obj/src/contrib/http-parser/http_parser.d
/home/alex/code/mininode/obj/build/libhttparser.a: /home/alex/code/mininode/obj/src/contrib/http-parser/http_parser.o 
	ar rcs $@ $^
/home/alex/code/mininode/obj/src/contrib/libslz/src/slz.o: /home/alex/code/mininode/src/contrib/libslz/src/slz.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/contrib/libslz/src  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/contrib/libslz/src/slz.d
CORE_DEPS += /home/alex/code/mininode/obj/src/contrib/libslz/src/slz.d
/home/alex/code/mininode/obj/build/libslz.a: /home/alex/code/mininode/obj/src/contrib/libslz/src/slz.o 
	ar rcs $@ $^
/home/alex/code/mininode/obj/src/contrib/lowzip/lowzip.o: /home/alex/code/mininode/src/contrib/lowzip/lowzip.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/contrib/lowzip  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/contrib/lowzip/lowzip.d
CORE_DEPS += /home/alex/code/mininode/obj/src/contrib/lowzip/lowzip.d
/home/alex/code/mininode/obj/build/liblowzip.a: /home/alex/code/mininode/obj/src/contrib/lowzip/lowzip.o 
	ar rcs $@ $^
/home/alex/code/mininode/obj/src/core/ref.o: /home/alex/code/mininode/src/core/ref.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/include  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/core/ref.d
CORE_DEPS += /home/alex/code/mininode/obj/src/core/ref.d
/home/alex/code/mininode/obj/src/core/core.o: /home/alex/code/mininode/src/core/core.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/include  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/core/core.d
CORE_DEPS += /home/alex/code/mininode/obj/src/core/core.d
/home/alex/code/mininode/obj/src/core/loader.o: /home/alex/code/mininode/src/core/loader.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/include  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/core/loader.d
CORE_DEPS += /home/alex/code/mininode/obj/src/core/loader.d
/home/alex/code/mininode/obj/src/core/mininode.o: /home/alex/code/mininode/src/core/mininode.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/include  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/core/mininode.d
CORE_DEPS += /home/alex/code/mininode/obj/src/core/mininode.d
/home/alex/code/mininode/obj/src/modules/assert/assert.o: /home/alex/code/mininode/src/modules/assert/assert.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/assert.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/assert.d
/home/alex/code/mininode/obj/src/modules/assert/methods/deep_equal.o: /home/alex/code/mininode/src/modules/assert/methods/deep_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/deep_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/deep_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/deep_strict_equal.o: /home/alex/code/mininode/src/modules/assert/methods/deep_strict_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/deep_strict_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/deep_strict_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/does_not_throw.o: /home/alex/code/mininode/src/modules/assert/methods/does_not_throw.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/does_not_throw.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/does_not_throw.d
/home/alex/code/mininode/obj/src/modules/assert/methods/equal.o: /home/alex/code/mininode/src/modules/assert/methods/equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/fail.o: /home/alex/code/mininode/src/modules/assert/methods/fail.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/fail.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/fail.d
/home/alex/code/mininode/obj/src/modules/assert/methods/if_error.o: /home/alex/code/mininode/src/modules/assert/methods/if_error.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/if_error.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/if_error.d
/home/alex/code/mininode/obj/src/modules/assert/methods/not_deep_equal.o: /home/alex/code/mininode/src/modules/assert/methods/not_deep_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/not_deep_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/not_deep_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/not_equal.o: /home/alex/code/mininode/src/modules/assert/methods/not_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/not_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/not_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_deep_equal.o: /home/alex/code/mininode/src/modules/assert/methods/not_strict_deep_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_deep_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_deep_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_equal.o: /home/alex/code/mininode/src/modules/assert/methods/not_strict_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/ok.o: /home/alex/code/mininode/src/modules/assert/methods/ok.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/ok.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/ok.d
/home/alex/code/mininode/obj/src/modules/assert/methods/strict_equal.o: /home/alex/code/mininode/src/modules/assert/methods/strict_equal.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/strict_equal.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/strict_equal.d
/home/alex/code/mininode/obj/src/modules/assert/methods/throws.o: /home/alex/code/mininode/src/modules/assert/methods/throws.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/assert/methods/throws.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/assert/methods/throws.d
/home/alex/code/mininode/obj/src/modules/buffer/buffer.o: /home/alex/code/mininode/src/modules/buffer/buffer.c | objdir
	$(CC) $(CORE_CFLAGS) -Isrc/modules/buffer  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/buffer/buffer.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/buffer/buffer.d
/home/alex/code/mininode/obj/src/modules/child_process/child_process.o: /home/alex/code/mininode/src/modules/child_process/child_process.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/child_process.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/child_process.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/disconnect.o: /home/alex/code/mininode/src/modules/child_process/methods/disconnect.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/disconnect.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/disconnect.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/exec.o: /home/alex/code/mininode/src/modules/child_process/methods/exec.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/exec.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/exec.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file.o: /home/alex/code/mininode/src/modules/child_process/methods/exec_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file_sync.o: /home/alex/code/mininode/src/modules/child_process/methods/exec_file_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file_sync.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/exec_sync.o: /home/alex/code/mininode/src/modules/child_process/methods/exec_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_sync.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/fork.o: /home/alex/code/mininode/src/modules/child_process/methods/fork.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/fork.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/fork.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/kill.o: /home/alex/code/mininode/src/modules/child_process/methods/kill.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/kill.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/kill.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/send.o: /home/alex/code/mininode/src/modules/child_process/methods/send.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/send.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/send.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/spawn.o: /home/alex/code/mininode/src/modules/child_process/methods/spawn.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn.d
/home/alex/code/mininode/obj/src/modules/child_process/methods/spawn_sync.o: /home/alex/code/mininode/src/modules/child_process/methods/spawn_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn_sync.d
/home/alex/code/mininode/obj/src/modules/cluster/cluster.o: /home/alex/code/mininode/src/modules/cluster/cluster.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/cluster.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/cluster.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/worker.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/worker.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/worker.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/worker.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/disconnect.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/methods/disconnect.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/disconnect.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/disconnect.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_connected.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/methods/is_connected.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_connected.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_connected.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_dead.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/methods/is_dead.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_dead.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_dead.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/kill.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/methods/kill.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/kill.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/kill.d
/home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/send.o: /home/alex/code/mininode/src/modules/cluster/classes/worker/methods/send.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/send.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/send.d
/home/alex/code/mininode/obj/src/modules/crypto/crypto.o: /home/alex/code/mininode/src/modules/crypto/crypto.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/crypto.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/crypto.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipher.o: /home/alex/code/mininode/src/modules/crypto/methods/create_cipher.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipher.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipher.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipheriv.o: /home/alex/code/mininode/src/modules/crypto/methods/create_cipheriv.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipheriv.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipheriv.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_credentials.o: /home/alex/code/mininode/src/modules/crypto/methods/create_credentials.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_credentials.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_credentials.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipher.o: /home/alex/code/mininode/src/modules/crypto/methods/create_decipher.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipher.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipher.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipheriv.o: /home/alex/code/mininode/src/modules/crypto/methods/create_decipheriv.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipheriv.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipheriv.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_diffie_hellman.o: /home/alex/code/mininode/src/modules/crypto/methods/create_diffie_hellman.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_diffie_hellman.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_diffie_hellman.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_ecdh.o: /home/alex/code/mininode/src/modules/crypto/methods/create_ecdh.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_ecdh.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_ecdh.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_hash.o: /home/alex/code/mininode/src/modules/crypto/methods/create_hash.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hash.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hash.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_hmac.o: /home/alex/code/mininode/src/modules/crypto/methods/create_hmac.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hmac.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hmac.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_sign.o: /home/alex/code/mininode/src/modules/crypto/methods/create_sign.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_sign.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_sign.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/create_verify.o: /home/alex/code/mininode/src/modules/crypto/methods/create_verify.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/create_verify.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/create_verify.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/get_ciphers.o: /home/alex/code/mininode/src/modules/crypto/methods/get_ciphers.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/get_ciphers.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/get_ciphers.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/get_curves.o: /home/alex/code/mininode/src/modules/crypto/methods/get_curves.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/get_curves.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/get_curves.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/get_diffie_hellman.o: /home/alex/code/mininode/src/modules/crypto/methods/get_diffie_hellman.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/get_diffie_hellman.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/get_diffie_hellman.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/get_hashes.o: /home/alex/code/mininode/src/modules/crypto/methods/get_hashes.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/get_hashes.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/get_hashes.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2.o: /home/alex/code/mininode/src/modules/crypto/methods/pbkdf2.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2_sync.o: /home/alex/code/mininode/src/modules/crypto/methods/pbkdf2_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2_sync.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/private_decrypt.o: /home/alex/code/mininode/src/modules/crypto/methods/private_decrypt.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/private_decrypt.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/private_decrypt.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/private_encrypt.o: /home/alex/code/mininode/src/modules/crypto/methods/private_encrypt.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/private_encrypt.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/private_encrypt.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/public_encrypt.o: /home/alex/code/mininode/src/modules/crypto/methods/public_encrypt.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/public_encrypt.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/public_encrypt.d
/home/alex/code/mininode/obj/src/modules/crypto/methods/public_decrypt.o: /home/alex/code/mininode/src/modules/crypto/methods/public_decrypt.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/crypto/methods/public_decrypt.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/crypto/methods/public_decrypt.d
/home/alex/code/mininode/obj/src/modules/debugger/debugger.o: /home/alex/code/mininode/src/modules/debugger/debugger.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/debugger/debugger.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/debugger/debugger.d
/home/alex/code/mininode/obj/src/modules/dgram/dgram.o: /home/alex/code/mininode/src/modules/dgram/dgram.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/dgram.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/dgram.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/socket.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/socket.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/socket.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/socket.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/add_membership.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/add_membership.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/add_membership.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/add_membership.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/address.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/address.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/address.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/address.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/bind.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/bind.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/bind.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/bind.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/close.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/close.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/close.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/close.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/ref.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/ref.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/ref.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/ref.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/send.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/send.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/send.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/send.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_broadcast.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/set_broadcast.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_broadcast.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_broadcast.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_loopback.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/set_multicast_loopback.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_loopback.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_loopback.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_ttl.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/set_multicast_ttl.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_ttl.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_ttl.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_ttl.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/set_ttl.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_ttl.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_ttl.d
/home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/unref.o: /home/alex/code/mininode/src/modules/dgram/classes/socket/methods/unref.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/unref.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/unref.d
/home/alex/code/mininode/obj/src/modules/dns/dns.o: /home/alex/code/mininode/src/modules/dns/dns.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/dns/dns.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/dns/dns.d
/home/alex/code/mininode/obj/src/modules/errors/errors.o: /home/alex/code/mininode/src/modules/errors/errors.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/errors/errors.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/errors/errors.d
/home/alex/code/mininode/obj/src/modules/events/events.o: /home/alex/code/mininode/src/modules/events/events.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/events/events.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/events/events.d
/home/alex/code/mininode/obj/src/modules/fs/fs.o: /home/alex/code/mininode/src/modules/fs/fs.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/fs.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/fs.d
/home/alex/code/mininode/obj/src/modules/fs/methods/access.o: /home/alex/code/mininode/src/modules/fs/methods/access.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/access.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/access.d
/home/alex/code/mininode/obj/src/modules/fs/methods/access_sync.o: /home/alex/code/mininode/src/modules/fs/methods/access_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/access_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/access_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/append_file.o: /home/alex/code/mininode/src/modules/fs/methods/append_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/append_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/append_file.d
/home/alex/code/mininode/obj/src/modules/fs/methods/append_file_sync.o: /home/alex/code/mininode/src/modules/fs/methods/append_file_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/append_file_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/append_file_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/chmod.o: /home/alex/code/mininode/src/modules/fs/methods/chmod.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/chmod.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/chmod.d
/home/alex/code/mininode/obj/src/modules/fs/methods/chmod_sync.o: /home/alex/code/mininode/src/modules/fs/methods/chmod_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/chmod_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/chmod_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/chown.o: /home/alex/code/mininode/src/modules/fs/methods/chown.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/chown.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/chown.d
/home/alex/code/mininode/obj/src/modules/fs/methods/chown_sync.o: /home/alex/code/mininode/src/modules/fs/methods/chown_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/chown_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/chown_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/close.o: /home/alex/code/mininode/src/modules/fs/methods/close.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/close.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/close.d
/home/alex/code/mininode/obj/src/modules/fs/methods/close_sync.o: /home/alex/code/mininode/src/modules/fs/methods/close_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/close_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/close_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/create_read_stream.o: /home/alex/code/mininode/src/modules/fs/methods/create_read_stream.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/create_read_stream.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/create_read_stream.d
/home/alex/code/mininode/obj/src/modules/fs/methods/create_write_stream.o: /home/alex/code/mininode/src/modules/fs/methods/create_write_stream.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/create_write_stream.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/create_write_stream.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fchmod.o: /home/alex/code/mininode/src/modules/fs/methods/fchmod.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fchmod_sync.o: /home/alex/code/mininode/src/modules/fs/methods/fchmod_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync.o: /home/alex/code/mininode/src/modules/fs/methods/fdatasync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync_sync.o: /home/alex/code/mininode/src/modules/fs/methods/fdatasync_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fstat.o: /home/alex/code/mininode/src/modules/fs/methods/fstat.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fstat.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fstat.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fstat_sync.o: /home/alex/code/mininode/src/modules/fs/methods/fstat_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fstat_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fstat_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fsync.o: /home/alex/code/mininode/src/modules/fs/methods/fsync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fsync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fsync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/fsync_sync.o: /home/alex/code/mininode/src/modules/fs/methods/fsync_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/fsync_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/fsync_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate.o: /home/alex/code/mininode/src/modules/fs/methods/ftruncate.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate.d
/home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate_sync.o: /home/alex/code/mininode/src/modules/fs/methods/ftruncate_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lchmod.o: /home/alex/code/mininode/src/modules/fs/methods/lchmod.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lchmod_sync.o: /home/alex/code/mininode/src/modules/fs/methods/lchmod_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lchown.o: /home/alex/code/mininode/src/modules/fs/methods/lchown.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lchown.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lchown.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lchown_sync.o: /home/alex/code/mininode/src/modules/fs/methods/lchown_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lchown_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lchown_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/link.o: /home/alex/code/mininode/src/modules/fs/methods/link.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/link.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/link.d
/home/alex/code/mininode/obj/src/modules/fs/methods/link_sync.o: /home/alex/code/mininode/src/modules/fs/methods/link_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/link_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/link_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lstat.o: /home/alex/code/mininode/src/modules/fs/methods/lstat.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lstat.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lstat.d
/home/alex/code/mininode/obj/src/modules/fs/methods/lstat_sync.o: /home/alex/code/mininode/src/modules/fs/methods/lstat_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/lstat_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/lstat_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/mkdir.o: /home/alex/code/mininode/src/modules/fs/methods/mkdir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir.d
/home/alex/code/mininode/obj/src/modules/fs/methods/mkdir_sync.o: /home/alex/code/mininode/src/modules/fs/methods/mkdir_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp.o: /home/alex/code/mininode/src/modules/fs/methods/mkdtemp.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp.d
/home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp_sync.o: /home/alex/code/mininode/src/modules/fs/methods/mkdtemp_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/open.o: /home/alex/code/mininode/src/modules/fs/methods/open.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/open.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/open.d
/home/alex/code/mininode/obj/src/modules/fs/methods/open_sync.o: /home/alex/code/mininode/src/modules/fs/methods/open_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/open_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/open_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/read.o: /home/alex/code/mininode/src/modules/fs/methods/read.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/read.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/read.d
/home/alex/code/mininode/obj/src/modules/fs/methods/readdir.o: /home/alex/code/mininode/src/modules/fs/methods/readdir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/readdir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/readdir.d
/home/alex/code/mininode/obj/src/modules/fs/methods/readdir_sync.o: /home/alex/code/mininode/src/modules/fs/methods/readdir_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/readdir_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/readdir_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/read_file.o: /home/alex/code/mininode/src/modules/fs/methods/read_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/read_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/read_file.d
/home/alex/code/mininode/obj/src/modules/fs/methods/read_file_sync.o: /home/alex/code/mininode/src/modules/fs/methods/read_file_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/read_file_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/read_file_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/readlink.o: /home/alex/code/mininode/src/modules/fs/methods/readlink.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/readlink.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/readlink.d
/home/alex/code/mininode/obj/src/modules/fs/methods/readlink_sync.o: /home/alex/code/mininode/src/modules/fs/methods/readlink_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/readlink_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/readlink_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/read_sync.o: /home/alex/code/mininode/src/modules/fs/methods/read_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/read_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/read_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/realpath.o: /home/alex/code/mininode/src/modules/fs/methods/realpath.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/realpath.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/realpath.d
/home/alex/code/mininode/obj/src/modules/fs/methods/realpath_sync.o: /home/alex/code/mininode/src/modules/fs/methods/realpath_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/realpath_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/realpath_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/rename.o: /home/alex/code/mininode/src/modules/fs/methods/rename.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/rename.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/rename.d
/home/alex/code/mininode/obj/src/modules/fs/methods/rename_sync.o: /home/alex/code/mininode/src/modules/fs/methods/rename_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/rename_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/rename_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/rmdir.o: /home/alex/code/mininode/src/modules/fs/methods/rmdir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir.d
/home/alex/code/mininode/obj/src/modules/fs/methods/rmdir_sync.o: /home/alex/code/mininode/src/modules/fs/methods/rmdir_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/stat.o: /home/alex/code/mininode/src/modules/fs/methods/stat.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/stat.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/stat.d
/home/alex/code/mininode/obj/src/modules/fs/methods/stat_sync.o: /home/alex/code/mininode/src/modules/fs/methods/stat_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/stat_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/stat_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/symlink.o: /home/alex/code/mininode/src/modules/fs/methods/symlink.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/symlink.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/symlink.d
/home/alex/code/mininode/obj/src/modules/fs/methods/symlink_sync.o: /home/alex/code/mininode/src/modules/fs/methods/symlink_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/symlink_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/symlink_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/truncate.o: /home/alex/code/mininode/src/modules/fs/methods/truncate.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/truncate.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/truncate.d
/home/alex/code/mininode/obj/src/modules/fs/methods/truncate_sync.o: /home/alex/code/mininode/src/modules/fs/methods/truncate_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/truncate_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/truncate_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/unlink.o: /home/alex/code/mininode/src/modules/fs/methods/unlink.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/unlink.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/unlink.d
/home/alex/code/mininode/obj/src/modules/fs/methods/unlink_sync.o: /home/alex/code/mininode/src/modules/fs/methods/unlink_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/unlink_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/unlink_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/unwatch_file.o: /home/alex/code/mininode/src/modules/fs/methods/unwatch_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/unwatch_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/unwatch_file.d
/home/alex/code/mininode/obj/src/modules/fs/methods/utimes.o: /home/alex/code/mininode/src/modules/fs/methods/utimes.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/utimes.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/utimes.d
/home/alex/code/mininode/obj/src/modules/fs/methods/utimes_sync.o: /home/alex/code/mininode/src/modules/fs/methods/utimes_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/utimes_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/utimes_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/watch.o: /home/alex/code/mininode/src/modules/fs/methods/watch.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/watch.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/watch.d
/home/alex/code/mininode/obj/src/modules/fs/methods/watch_file.o: /home/alex/code/mininode/src/modules/fs/methods/watch_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/watch_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/watch_file.d
/home/alex/code/mininode/obj/src/modules/fs/methods/write.o: /home/alex/code/mininode/src/modules/fs/methods/write.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/write.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/write.d
/home/alex/code/mininode/obj/src/modules/fs/methods/write_file.o: /home/alex/code/mininode/src/modules/fs/methods/write_file.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/write_file.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/write_file.d
/home/alex/code/mininode/obj/src/modules/fs/methods/write_file_sync.o: /home/alex/code/mininode/src/modules/fs/methods/write_file_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/write_file_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/write_file_sync.d
/home/alex/code/mininode/obj/src/modules/fs/methods/write_sync.o: /home/alex/code/mininode/src/modules/fs/methods/write_sync.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/fs/methods/write_sync.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/fs/methods/write_sync.d
/home/alex/code/mininode/obj/src/modules/http/http.o: /home/alex/code/mininode/src/modules/http/http.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/http/http.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/http/http.d
/home/alex/code/mininode/obj/src/modules/http2/http2.o: /home/alex/code/mininode/src/modules/http2/http2.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/http2/http2.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/http2/http2.d
/home/alex/code/mininode/obj/src/modules/https/https.o: /home/alex/code/mininode/src/modules/https/https.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/https/https.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/https/https.d
/home/alex/code/mininode/obj/src/modules/net/net.o: /home/alex/code/mininode/src/modules/net/net.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/net/net.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/net/net.d
/home/alex/code/mininode/obj/src/modules/os/os.o: /home/alex/code/mininode/src/modules/os/os.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/os.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/os.d
/home/alex/code/mininode/obj/src/modules/os/methods/arch.o: /home/alex/code/mininode/src/modules/os/methods/arch.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/arch.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/arch.d
/home/alex/code/mininode/obj/src/modules/os/methods/cpus.o: /home/alex/code/mininode/src/modules/os/methods/cpus.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/cpus.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/cpus.d
/home/alex/code/mininode/obj/src/modules/os/methods/endianness.o: /home/alex/code/mininode/src/modules/os/methods/endianness.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/endianness.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/endianness.d
/home/alex/code/mininode/obj/src/modules/os/methods/freemem.o: /home/alex/code/mininode/src/modules/os/methods/freemem.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/freemem.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/freemem.d
/home/alex/code/mininode/obj/src/modules/os/methods/homedir.o: /home/alex/code/mininode/src/modules/os/methods/homedir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/homedir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/homedir.d
/home/alex/code/mininode/obj/src/modules/os/methods/hostname.o: /home/alex/code/mininode/src/modules/os/methods/hostname.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/hostname.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/hostname.d
/home/alex/code/mininode/obj/src/modules/os/methods/loadavg.o: /home/alex/code/mininode/src/modules/os/methods/loadavg.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/loadavg.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/loadavg.d
/home/alex/code/mininode/obj/src/modules/os/methods/network_interfaces.o: /home/alex/code/mininode/src/modules/os/methods/network_interfaces.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/network_interfaces.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/network_interfaces.d
/home/alex/code/mininode/obj/src/modules/os/methods/platform.o: /home/alex/code/mininode/src/modules/os/methods/platform.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/platform.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/platform.d
/home/alex/code/mininode/obj/src/modules/os/methods/release.o: /home/alex/code/mininode/src/modules/os/methods/release.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/release.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/release.d
/home/alex/code/mininode/obj/src/modules/os/methods/tmpdir.o: /home/alex/code/mininode/src/modules/os/methods/tmpdir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/tmpdir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/tmpdir.d
/home/alex/code/mininode/obj/src/modules/os/methods/totalmem.o: /home/alex/code/mininode/src/modules/os/methods/totalmem.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/totalmem.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/totalmem.d
/home/alex/code/mininode/obj/src/modules/os/methods/type.o: /home/alex/code/mininode/src/modules/os/methods/type.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/type.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/type.d
/home/alex/code/mininode/obj/src/modules/os/methods/uptime.o: /home/alex/code/mininode/src/modules/os/methods/uptime.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/uptime.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/uptime.d
/home/alex/code/mininode/obj/src/modules/os/methods/user_info.o: /home/alex/code/mininode/src/modules/os/methods/user_info.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/os/methods/user_info.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/os/methods/user_info.d
/home/alex/code/mininode/obj/src/modules/path/path.o: /home/alex/code/mininode/src/modules/path/path.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/path.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/path.d
/home/alex/code/mininode/obj/src/modules/path/methods/basename.o: /home/alex/code/mininode/src/modules/path/methods/basename.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/basename.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/basename.d
/home/alex/code/mininode/obj/src/modules/path/methods/dirname.o: /home/alex/code/mininode/src/modules/path/methods/dirname.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/dirname.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/dirname.d
/home/alex/code/mininode/obj/src/modules/path/methods/extname.o: /home/alex/code/mininode/src/modules/path/methods/extname.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/extname.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/extname.d
/home/alex/code/mininode/obj/src/modules/path/methods/format.o: /home/alex/code/mininode/src/modules/path/methods/format.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/format.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/format.d
/home/alex/code/mininode/obj/src/modules/path/methods/is_absolute.o: /home/alex/code/mininode/src/modules/path/methods/is_absolute.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/is_absolute.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/is_absolute.d
/home/alex/code/mininode/obj/src/modules/path/methods/join.o: /home/alex/code/mininode/src/modules/path/methods/join.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/join.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/join.d
/home/alex/code/mininode/obj/src/modules/path/methods/normalize.o: /home/alex/code/mininode/src/modules/path/methods/normalize.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/normalize.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/normalize.d
/home/alex/code/mininode/obj/src/modules/path/methods/parse.o: /home/alex/code/mininode/src/modules/path/methods/parse.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/parse.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/parse.d
/home/alex/code/mininode/obj/src/modules/path/methods/relative.o: /home/alex/code/mininode/src/modules/path/methods/relative.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/relative.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/relative.d
/home/alex/code/mininode/obj/src/modules/path/methods/resolve.o: /home/alex/code/mininode/src/modules/path/methods/resolve.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/path/methods/resolve.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/path/methods/resolve.d
/home/alex/code/mininode/obj/src/modules/process/process.o: /home/alex/code/mininode/src/modules/process/process.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/process.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/process.d
/home/alex/code/mininode/obj/src/modules/process/methods/abort.o: /home/alex/code/mininode/src/modules/process/methods/abort.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/abort.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/abort.d
/home/alex/code/mininode/obj/src/modules/process/methods/arch.o: /home/alex/code/mininode/src/modules/process/methods/arch.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/arch.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/arch.d
/home/alex/code/mininode/obj/src/modules/process/methods/argv.o: /home/alex/code/mininode/src/modules/process/methods/argv.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/argv.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/argv.d
/home/alex/code/mininode/obj/src/modules/process/methods/chdir.o: /home/alex/code/mininode/src/modules/process/methods/chdir.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/chdir.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/chdir.d
/home/alex/code/mininode/obj/src/modules/process/methods/config.o: /home/alex/code/mininode/src/modules/process/methods/config.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/config.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/config.d
/home/alex/code/mininode/obj/src/modules/process/methods/connected.o: /home/alex/code/mininode/src/modules/process/methods/connected.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/connected.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/connected.d
/home/alex/code/mininode/obj/src/modules/process/methods/cpu_usage.o: /home/alex/code/mininode/src/modules/process/methods/cpu_usage.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/cpu_usage.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/cpu_usage.d
/home/alex/code/mininode/obj/src/modules/process/methods/cwd.o: /home/alex/code/mininode/src/modules/process/methods/cwd.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/cwd.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/cwd.d
/home/alex/code/mininode/obj/src/modules/process/methods/disconnect.o: /home/alex/code/mininode/src/modules/process/methods/disconnect.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/disconnect.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/disconnect.d
/home/alex/code/mininode/obj/src/modules/process/methods/emit_warning.o: /home/alex/code/mininode/src/modules/process/methods/emit_warning.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/emit_warning.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/emit_warning.d
/home/alex/code/mininode/obj/src/modules/process/methods/env.o: /home/alex/code/mininode/src/modules/process/methods/env.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/env.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/env.d
/home/alex/code/mininode/obj/src/modules/process/methods/exec_argv.o: /home/alex/code/mininode/src/modules/process/methods/exec_argv.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/exec_argv.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/exec_argv.d
/home/alex/code/mininode/obj/src/modules/process/methods/exec_path.o: /home/alex/code/mininode/src/modules/process/methods/exec_path.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/exec_path.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/exec_path.d
/home/alex/code/mininode/obj/src/modules/process/methods/exit.o: /home/alex/code/mininode/src/modules/process/methods/exit.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/exit.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/exit.d
/home/alex/code/mininode/obj/src/modules/process/methods/getegid.o: /home/alex/code/mininode/src/modules/process/methods/getegid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/getegid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/getegid.d
/home/alex/code/mininode/obj/src/modules/process/methods/geteuid.o: /home/alex/code/mininode/src/modules/process/methods/geteuid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/geteuid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/geteuid.d
/home/alex/code/mininode/obj/src/modules/process/methods/getgid.o: /home/alex/code/mininode/src/modules/process/methods/getgid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/getgid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/getgid.d
/home/alex/code/mininode/obj/src/modules/process/methods/getgroups.o: /home/alex/code/mininode/src/modules/process/methods/getgroups.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/getgroups.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/getgroups.d
/home/alex/code/mininode/obj/src/modules/process/methods/getuid.o: /home/alex/code/mininode/src/modules/process/methods/getuid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/getuid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/getuid.d
/home/alex/code/mininode/obj/src/modules/process/methods/hrtime.o: /home/alex/code/mininode/src/modules/process/methods/hrtime.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/hrtime.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/hrtime.d
/home/alex/code/mininode/obj/src/modules/process/methods/initgroups.o: /home/alex/code/mininode/src/modules/process/methods/initgroups.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/initgroups.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/initgroups.d
/home/alex/code/mininode/obj/src/modules/process/methods/kill.o: /home/alex/code/mininode/src/modules/process/methods/kill.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/kill.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/kill.d
/home/alex/code/mininode/obj/src/modules/process/methods/main_module.o: /home/alex/code/mininode/src/modules/process/methods/main_module.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/main_module.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/main_module.d
/home/alex/code/mininode/obj/src/modules/process/methods/memory_usage.o: /home/alex/code/mininode/src/modules/process/methods/memory_usage.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/memory_usage.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/memory_usage.d
/home/alex/code/mininode/obj/src/modules/process/methods/next_tick.o: /home/alex/code/mininode/src/modules/process/methods/next_tick.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/next_tick.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/next_tick.d
/home/alex/code/mininode/obj/src/modules/process/methods/pid.o: /home/alex/code/mininode/src/modules/process/methods/pid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/pid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/pid.d
/home/alex/code/mininode/obj/src/modules/process/methods/platform.o: /home/alex/code/mininode/src/modules/process/methods/platform.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/platform.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/platform.d
/home/alex/code/mininode/obj/src/modules/process/methods/release.o: /home/alex/code/mininode/src/modules/process/methods/release.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/release.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/release.d
/home/alex/code/mininode/obj/src/modules/process/methods/send.o: /home/alex/code/mininode/src/modules/process/methods/send.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/send.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/send.d
/home/alex/code/mininode/obj/src/modules/process/methods/setegid.o: /home/alex/code/mininode/src/modules/process/methods/setegid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/setegid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/setegid.d
/home/alex/code/mininode/obj/src/modules/process/methods/seteuid.o: /home/alex/code/mininode/src/modules/process/methods/seteuid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/seteuid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/seteuid.d
/home/alex/code/mininode/obj/src/modules/process/methods/setgid.o: /home/alex/code/mininode/src/modules/process/methods/setgid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/setgid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/setgid.d
/home/alex/code/mininode/obj/src/modules/process/methods/setgroups.o: /home/alex/code/mininode/src/modules/process/methods/setgroups.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/setgroups.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/setgroups.d
/home/alex/code/mininode/obj/src/modules/process/methods/setuid.o: /home/alex/code/mininode/src/modules/process/methods/setuid.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/setuid.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/setuid.d
/home/alex/code/mininode/obj/src/modules/process/methods/umask.o: /home/alex/code/mininode/src/modules/process/methods/umask.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/umask.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/umask.d
/home/alex/code/mininode/obj/src/modules/process/methods/uptime.o: /home/alex/code/mininode/src/modules/process/methods/uptime.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/uptime.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/uptime.d
/home/alex/code/mininode/obj/src/modules/process/methods/version.o: /home/alex/code/mininode/src/modules/process/methods/version.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/process/methods/version.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/process/methods/version.d
/home/alex/code/mininode/obj/src/modules/punycode/punycode.o: /home/alex/code/mininode/src/modules/punycode/punycode.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/punycode/punycode.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/punycode/punycode.d
/home/alex/code/mininode/obj/src/modules/querystring/querystring.o: /home/alex/code/mininode/src/modules/querystring/querystring.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/querystring/querystring.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/querystring/querystring.d
/home/alex/code/mininode/obj/src/modules/readline/readline.o: /home/alex/code/mininode/src/modules/readline/readline.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/readline.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/readline.d
/home/alex/code/mininode/obj/src/modules/readline/methods/clear_line.o: /home/alex/code/mininode/src/modules/readline/methods/clear_line.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/clear_line.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/clear_line.d
/home/alex/code/mininode/obj/src/modules/readline/methods/clear_screen_down.o: /home/alex/code/mininode/src/modules/readline/methods/clear_screen_down.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/clear_screen_down.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/clear_screen_down.d
/home/alex/code/mininode/obj/src/modules/readline/methods/create_interface.o: /home/alex/code/mininode/src/modules/readline/methods/create_interface.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/create_interface.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/create_interface.d
/home/alex/code/mininode/obj/src/modules/readline/methods/cursor_to.o: /home/alex/code/mininode/src/modules/readline/methods/cursor_to.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/cursor_to.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/cursor_to.d
/home/alex/code/mininode/obj/src/modules/readline/methods/emit_keypress_events.o: /home/alex/code/mininode/src/modules/readline/methods/emit_keypress_events.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/emit_keypress_events.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/emit_keypress_events.d
/home/alex/code/mininode/obj/src/modules/readline/methods/move_cursor.o: /home/alex/code/mininode/src/modules/readline/methods/move_cursor.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/readline/methods/move_cursor.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/readline/methods/move_cursor.d
/home/alex/code/mininode/obj/src/modules/repl/repl.o: /home/alex/code/mininode/src/modules/repl/repl.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/repl/repl.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/repl/repl.d
/home/alex/code/mininode/obj/src/modules/string_decoder/string_decoder.o: /home/alex/code/mininode/src/modules/string_decoder/string_decoder.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/string_decoder/string_decoder.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/string_decoder/string_decoder.d
/home/alex/code/mininode/obj/src/modules/timers/timers.o: /home/alex/code/mininode/src/modules/timers/timers.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/timers.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/timers.d
/home/alex/code/mininode/obj/src/modules/timers/methods/clear_immediate.o: /home/alex/code/mininode/src/modules/timers/methods/clear_immediate.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/clear_immediate.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/clear_immediate.d
/home/alex/code/mininode/obj/src/modules/timers/methods/clear_interval.o: /home/alex/code/mininode/src/modules/timers/methods/clear_interval.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/clear_interval.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/clear_interval.d
/home/alex/code/mininode/obj/src/modules/timers/methods/clear_timeout.o: /home/alex/code/mininode/src/modules/timers/methods/clear_timeout.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/clear_timeout.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/clear_timeout.d
/home/alex/code/mininode/obj/src/modules/timers/methods/set_immediate.o: /home/alex/code/mininode/src/modules/timers/methods/set_immediate.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/set_immediate.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/set_immediate.d
/home/alex/code/mininode/obj/src/modules/timers/methods/set_interval.o: /home/alex/code/mininode/src/modules/timers/methods/set_interval.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/set_interval.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/set_interval.d
/home/alex/code/mininode/obj/src/modules/timers/methods/set_timeout.o: /home/alex/code/mininode/src/modules/timers/methods/set_timeout.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/timers/methods/set_timeout.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/timers/methods/set_timeout.d
/home/alex/code/mininode/obj/src/modules/tls/tls.o: /home/alex/code/mininode/src/modules/tls/tls.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/tls/tls.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/tls/tls.d
/home/alex/code/mininode/obj/src/modules/tty/tty.o: /home/alex/code/mininode/src/modules/tty/tty.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/tty/tty.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/tty/tty.d
/home/alex/code/mininode/obj/src/modules/url/url.o: /home/alex/code/mininode/src/modules/url/url.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/url/url.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/url/url.d
/home/alex/code/mininode/obj/src/modules/util/util.o: /home/alex/code/mininode/src/modules/util/util.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/util.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/util.d
/home/alex/code/mininode/obj/src/modules/util/methods/debuglog.o: /home/alex/code/mininode/src/modules/util/methods/debuglog.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/methods/debuglog.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/methods/debuglog.d
/home/alex/code/mininode/obj/src/modules/util/methods/deprecate.o: /home/alex/code/mininode/src/modules/util/methods/deprecate.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/methods/deprecate.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/methods/deprecate.d
/home/alex/code/mininode/obj/src/modules/util/methods/format.o: /home/alex/code/mininode/src/modules/util/methods/format.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/methods/format.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/methods/format.d
/home/alex/code/mininode/obj/src/modules/util/methods/inherits.o: /home/alex/code/mininode/src/modules/util/methods/inherits.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/methods/inherits.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/methods/inherits.d
/home/alex/code/mininode/obj/src/modules/util/methods/inspect.o: /home/alex/code/mininode/src/modules/util/methods/inspect.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/util/methods/inspect.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/util/methods/inspect.d
/home/alex/code/mininode/obj/src/modules/v8/v8.o: /home/alex/code/mininode/src/modules/v8/v8.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/v8/v8.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/v8/v8.d
/home/alex/code/mininode/obj/src/modules/vm/vm.o: /home/alex/code/mininode/src/modules/vm/vm.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/vm/vm.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/vm/vm.d
/home/alex/code/mininode/obj/src/modules/zlib/zlib.o: /home/alex/code/mininode/src/modules/zlib/zlib.c | objdir
	$(CC) $(CORE_CFLAGS)  -c $< -o $@ -MMD -MP -MT'$@' -MF /home/alex/code/mininode/obj/src/modules/zlib/zlib.d
CORE_DEPS += /home/alex/code/mininode/obj/src/modules/zlib/zlib.d
$(OBJDIR)/build/mininode: /home/alex/code/mininode/obj/src/contrib/duktape/duktape.o /home/alex/code/mininode/obj/src/core/ref.o /home/alex/code/mininode/obj/src/core/core.o /home/alex/code/mininode/obj/src/core/loader.o /home/alex/code/mininode/obj/src/core/mininode.o /home/alex/code/mininode/obj/src/modules/assert/assert.o /home/alex/code/mininode/obj/src/modules/assert/methods/deep_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/deep_strict_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/does_not_throw.o /home/alex/code/mininode/obj/src/modules/assert/methods/equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/fail.o /home/alex/code/mininode/obj/src/modules/assert/methods/if_error.o /home/alex/code/mininode/obj/src/modules/assert/methods/not_deep_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/not_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_deep_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/not_strict_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/ok.o /home/alex/code/mininode/obj/src/modules/assert/methods/strict_equal.o /home/alex/code/mininode/obj/src/modules/assert/methods/throws.o /home/alex/code/mininode/obj/src/modules/buffer/buffer.o /home/alex/code/mininode/obj/src/modules/child_process/child_process.o /home/alex/code/mininode/obj/src/modules/child_process/methods/disconnect.o /home/alex/code/mininode/obj/src/modules/child_process/methods/exec.o /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file.o /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_file_sync.o /home/alex/code/mininode/obj/src/modules/child_process/methods/exec_sync.o /home/alex/code/mininode/obj/src/modules/child_process/methods/fork.o /home/alex/code/mininode/obj/src/modules/child_process/methods/kill.o /home/alex/code/mininode/obj/src/modules/child_process/methods/send.o /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn.o /home/alex/code/mininode/obj/src/modules/child_process/methods/spawn_sync.o /home/alex/code/mininode/obj/src/modules/cluster/cluster.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/worker.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/disconnect.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_connected.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/is_dead.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/kill.o /home/alex/code/mininode/obj/src/modules/cluster/classes/worker/methods/send.o /home/alex/code/mininode/obj/src/modules/crypto/crypto.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipher.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_cipheriv.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_credentials.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipher.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_decipheriv.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_diffie_hellman.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_ecdh.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hash.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_hmac.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_sign.o /home/alex/code/mininode/obj/src/modules/crypto/methods/create_verify.o /home/alex/code/mininode/obj/src/modules/crypto/methods/get_ciphers.o /home/alex/code/mininode/obj/src/modules/crypto/methods/get_curves.o /home/alex/code/mininode/obj/src/modules/crypto/methods/get_diffie_hellman.o /home/alex/code/mininode/obj/src/modules/crypto/methods/get_hashes.o /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2.o /home/alex/code/mininode/obj/src/modules/crypto/methods/pbkdf2_sync.o /home/alex/code/mininode/obj/src/modules/crypto/methods/private_decrypt.o /home/alex/code/mininode/obj/src/modules/crypto/methods/private_encrypt.o /home/alex/code/mininode/obj/src/modules/crypto/methods/public_encrypt.o /home/alex/code/mininode/obj/src/modules/crypto/methods/public_decrypt.o /home/alex/code/mininode/obj/src/modules/debugger/debugger.o /home/alex/code/mininode/obj/src/modules/dgram/dgram.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/socket.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/add_membership.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/address.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/bind.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/close.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/ref.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/send.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_broadcast.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_loopback.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_multicast_ttl.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/set_ttl.o /home/alex/code/mininode/obj/src/modules/dgram/classes/socket/methods/unref.o /home/alex/code/mininode/obj/src/modules/dns/dns.o /home/alex/code/mininode/obj/src/modules/errors/errors.o /home/alex/code/mininode/obj/src/modules/events/events.o /home/alex/code/mininode/obj/src/modules/fs/fs.o /home/alex/code/mininode/obj/src/modules/fs/methods/access.o /home/alex/code/mininode/obj/src/modules/fs/methods/access_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/append_file.o /home/alex/code/mininode/obj/src/modules/fs/methods/append_file_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/chmod.o /home/alex/code/mininode/obj/src/modules/fs/methods/chmod_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/chown.o /home/alex/code/mininode/obj/src/modules/fs/methods/chown_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/close.o /home/alex/code/mininode/obj/src/modules/fs/methods/close_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/create_read_stream.o /home/alex/code/mininode/obj/src/modules/fs/methods/create_write_stream.o /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod.o /home/alex/code/mininode/obj/src/modules/fs/methods/fchmod_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync.o /home/alex/code/mininode/obj/src/modules/fs/methods/fdatasync_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/fstat.o /home/alex/code/mininode/obj/src/modules/fs/methods/fstat_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/fsync.o /home/alex/code/mininode/obj/src/modules/fs/methods/fsync_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate.o /home/alex/code/mininode/obj/src/modules/fs/methods/ftruncate_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod.o /home/alex/code/mininode/obj/src/modules/fs/methods/lchmod_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/lchown.o /home/alex/code/mininode/obj/src/modules/fs/methods/lchown_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/link.o /home/alex/code/mininode/obj/src/modules/fs/methods/link_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/lstat.o /home/alex/code/mininode/obj/src/modules/fs/methods/lstat_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir.o /home/alex/code/mininode/obj/src/modules/fs/methods/mkdir_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp.o /home/alex/code/mininode/obj/src/modules/fs/methods/mkdtemp_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/open.o /home/alex/code/mininode/obj/src/modules/fs/methods/open_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/read.o /home/alex/code/mininode/obj/src/modules/fs/methods/readdir.o /home/alex/code/mininode/obj/src/modules/fs/methods/readdir_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/read_file.o /home/alex/code/mininode/obj/src/modules/fs/methods/read_file_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/readlink.o /home/alex/code/mininode/obj/src/modules/fs/methods/readlink_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/read_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/realpath.o /home/alex/code/mininode/obj/src/modules/fs/methods/realpath_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/rename.o /home/alex/code/mininode/obj/src/modules/fs/methods/rename_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir.o /home/alex/code/mininode/obj/src/modules/fs/methods/rmdir_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/stat.o /home/alex/code/mininode/obj/src/modules/fs/methods/stat_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/symlink.o /home/alex/code/mininode/obj/src/modules/fs/methods/symlink_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/truncate.o /home/alex/code/mininode/obj/src/modules/fs/methods/truncate_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/unlink.o /home/alex/code/mininode/obj/src/modules/fs/methods/unlink_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/unwatch_file.o /home/alex/code/mininode/obj/src/modules/fs/methods/utimes.o /home/alex/code/mininode/obj/src/modules/fs/methods/utimes_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/watch.o /home/alex/code/mininode/obj/src/modules/fs/methods/watch_file.o /home/alex/code/mininode/obj/src/modules/fs/methods/write.o /home/alex/code/mininode/obj/src/modules/fs/methods/write_file.o /home/alex/code/mininode/obj/src/modules/fs/methods/write_file_sync.o /home/alex/code/mininode/obj/src/modules/fs/methods/write_sync.o /home/alex/code/mininode/obj/src/modules/http/http.o /home/alex/code/mininode/obj/src/modules/http2/http2.o /home/alex/code/mininode/obj/src/modules/https/https.o /home/alex/code/mininode/obj/src/modules/net/net.o /home/alex/code/mininode/obj/src/modules/os/os.o /home/alex/code/mininode/obj/src/modules/os/methods/arch.o /home/alex/code/mininode/obj/src/modules/os/methods/cpus.o /home/alex/code/mininode/obj/src/modules/os/methods/endianness.o /home/alex/code/mininode/obj/src/modules/os/methods/freemem.o /home/alex/code/mininode/obj/src/modules/os/methods/homedir.o /home/alex/code/mininode/obj/src/modules/os/methods/hostname.o /home/alex/code/mininode/obj/src/modules/os/methods/loadavg.o /home/alex/code/mininode/obj/src/modules/os/methods/network_interfaces.o /home/alex/code/mininode/obj/src/modules/os/methods/platform.o /home/alex/code/mininode/obj/src/modules/os/methods/release.o /home/alex/code/mininode/obj/src/modules/os/methods/tmpdir.o /home/alex/code/mininode/obj/src/modules/os/methods/totalmem.o /home/alex/code/mininode/obj/src/modules/os/methods/type.o /home/alex/code/mininode/obj/src/modules/os/methods/uptime.o /home/alex/code/mininode/obj/src/modules/os/methods/user_info.o /home/alex/code/mininode/obj/src/modules/path/path.o /home/alex/code/mininode/obj/src/modules/path/methods/basename.o /home/alex/code/mininode/obj/src/modules/path/methods/dirname.o /home/alex/code/mininode/obj/src/modules/path/methods/extname.o /home/alex/code/mininode/obj/src/modules/path/methods/format.o /home/alex/code/mininode/obj/src/modules/path/methods/is_absolute.o /home/alex/code/mininode/obj/src/modules/path/methods/join.o /home/alex/code/mininode/obj/src/modules/path/methods/normalize.o /home/alex/code/mininode/obj/src/modules/path/methods/parse.o /home/alex/code/mininode/obj/src/modules/path/methods/relative.o /home/alex/code/mininode/obj/src/modules/path/methods/resolve.o /home/alex/code/mininode/obj/src/modules/process/process.o /home/alex/code/mininode/obj/src/modules/process/methods/abort.o /home/alex/code/mininode/obj/src/modules/process/methods/arch.o /home/alex/code/mininode/obj/src/modules/process/methods/argv.o /home/alex/code/mininode/obj/src/modules/process/methods/chdir.o /home/alex/code/mininode/obj/src/modules/process/methods/config.o /home/alex/code/mininode/obj/src/modules/process/methods/connected.o /home/alex/code/mininode/obj/src/modules/process/methods/cpu_usage.o /home/alex/code/mininode/obj/src/modules/process/methods/cwd.o /home/alex/code/mininode/obj/src/modules/process/methods/disconnect.o /home/alex/code/mininode/obj/src/modules/process/methods/emit_warning.o /home/alex/code/mininode/obj/src/modules/process/methods/env.o /home/alex/code/mininode/obj/src/modules/process/methods/exec_argv.o /home/alex/code/mininode/obj/src/modules/process/methods/exec_path.o /home/alex/code/mininode/obj/src/modules/process/methods/exit.o /home/alex/code/mininode/obj/src/modules/process/methods/getegid.o /home/alex/code/mininode/obj/src/modules/process/methods/geteuid.o /home/alex/code/mininode/obj/src/modules/process/methods/getgid.o /home/alex/code/mininode/obj/src/modules/process/methods/getgroups.o /home/alex/code/mininode/obj/src/modules/process/methods/getuid.o /home/alex/code/mininode/obj/src/modules/process/methods/hrtime.o /home/alex/code/mininode/obj/src/modules/process/methods/initgroups.o /home/alex/code/mininode/obj/src/modules/process/methods/kill.o /home/alex/code/mininode/obj/src/modules/process/methods/main_module.o /home/alex/code/mininode/obj/src/modules/process/methods/memory_usage.o /home/alex/code/mininode/obj/src/modules/process/methods/next_tick.o /home/alex/code/mininode/obj/src/modules/process/methods/pid.o /home/alex/code/mininode/obj/src/modules/process/methods/platform.o /home/alex/code/mininode/obj/src/modules/process/methods/release.o /home/alex/code/mininode/obj/src/modules/process/methods/send.o /home/alex/code/mininode/obj/src/modules/process/methods/setegid.o /home/alex/code/mininode/obj/src/modules/process/methods/seteuid.o /home/alex/code/mininode/obj/src/modules/process/methods/setgid.o /home/alex/code/mininode/obj/src/modules/process/methods/setgroups.o /home/alex/code/mininode/obj/src/modules/process/methods/setuid.o /home/alex/code/mininode/obj/src/modules/process/methods/umask.o /home/alex/code/mininode/obj/src/modules/process/methods/uptime.o /home/alex/code/mininode/obj/src/modules/process/methods/version.o /home/alex/code/mininode/obj/src/modules/punycode/punycode.o /home/alex/code/mininode/obj/src/modules/querystring/querystring.o /home/alex/code/mininode/obj/src/modules/readline/readline.o /home/alex/code/mininode/obj/src/modules/readline/methods/clear_line.o /home/alex/code/mininode/obj/src/modules/readline/methods/clear_screen_down.o /home/alex/code/mininode/obj/src/modules/readline/methods/create_interface.o /home/alex/code/mininode/obj/src/modules/readline/methods/cursor_to.o /home/alex/code/mininode/obj/src/modules/readline/methods/emit_keypress_events.o /home/alex/code/mininode/obj/src/modules/readline/methods/move_cursor.o /home/alex/code/mininode/obj/src/modules/repl/repl.o /home/alex/code/mininode/obj/src/modules/string_decoder/string_decoder.o /home/alex/code/mininode/obj/src/modules/timers/timers.o /home/alex/code/mininode/obj/src/modules/timers/methods/clear_immediate.o /home/alex/code/mininode/obj/src/modules/timers/methods/clear_interval.o /home/alex/code/mininode/obj/src/modules/timers/methods/clear_timeout.o /home/alex/code/mininode/obj/src/modules/timers/methods/set_immediate.o /home/alex/code/mininode/obj/src/modules/timers/methods/set_interval.o /home/alex/code/mininode/obj/src/modules/timers/methods/set_timeout.o /home/alex/code/mininode/obj/src/modules/tls/tls.o /home/alex/code/mininode/obj/src/modules/tty/tty.o /home/alex/code/mininode/obj/src/modules/url/url.o /home/alex/code/mininode/obj/src/modules/util/util.o /home/alex/code/mininode/obj/src/modules/util/methods/debuglog.o /home/alex/code/mininode/obj/src/modules/util/methods/deprecate.o /home/alex/code/mininode/obj/src/modules/util/methods/format.o /home/alex/code/mininode/obj/src/modules/util/methods/inherits.o /home/alex/code/mininode/obj/src/modules/util/methods/inspect.o /home/alex/code/mininode/obj/src/modules/v8/v8.o /home/alex/code/mininode/obj/src/modules/vm/vm.o /home/alex/code/mininode/obj/src/modules/zlib/zlib.o | $(OBJDIR)/build/libduktape.a $(OBJDIR)/build/libhttparser.a $(OBJDIR)/build/libbearssl.a $(OBJDIR)/build/libslz.a $(OBJDIR)/build/liblowzip.a  objdir
	$(CC) $(CORE_CFLAGS) -lduktape -lhttparser -lbearssl -lslz -llowzip $(CORE_LINKFLAGS) $^ -o $@
