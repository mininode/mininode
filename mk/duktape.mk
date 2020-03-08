DUKTAPE_CFLAGS = $(MN_CFLAGS) \

$(OBJDIR)/src/contrib/duktape/duktape.o: $(SRCDIR)/src/contrib/duktape/duktape.c
	$(CC) $(DUKTAPE_CFLAGS) -c $^ -o $@ 

$(OBJDIR)/build/libduktape.a: $(OBJDIR)/src/contrib/duktape/duktape.o
	ar crs $@ $^
