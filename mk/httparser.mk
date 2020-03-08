HTTP_PARSER_CFLAGS = $(CFLAGS)

HTTP_PARSER_SRCS = $(SRCDIR)/src/contrib/http-parser/http_parser.c

HTTP_PARSER_OBJS = $(OBJDIR)/src/contrib/http-parser/http_parser.o

HTTP_PARSER_DEPS = $(HTTP_PARSER_OBJS:.o=.d)

$(HTTP_PARSER_OBJS): $(OBJDIR)
	$(CC) $(HTTP_PARSER_CFLAGS) -c -o $@ $(HTTP_PARSER_SRCS)

$(OBJDIR)/build/libhttparser.a: $(HTTP_PARSER_OBJS)
	ar crs $@ $^


