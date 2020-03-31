$(OBJDIR)/src/contrib/duktape/duktape.o: $(SRCDIR)/src/contrib/duktape/duktape.c | objdir
	$(CC) -c -fPIC $(CORE_CFLAGS) $^ -o $@

$(OBJDIR)/build/libduktape.a: $(OBJDIR)/src/contrib/duktape/duktape.o
	ar crs $@ $^
	ranlib $@
