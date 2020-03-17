# In the case of BearSSL, we're just going to rely on their Makefile.
# With code that is so security sensitive, I think it's best to be 
# clear that this project hasn't touched it at all. We just grab it 
# from git and build a static library.
$(OBJDIR)/build/libbearssl.a: | objdir
	$(MAKE) CC=$(CC) AROUT=$(OBJDIR)/ OBJDIR=$(OBJDIR)/src/contrib/BearSSL/obj -C src/contrib/BearSSL lib


