CC=gcc
ARCH=$(shell getconf LONG_BIT)

all: tracer hello

hello: hello.c
	$(CC) -o hello hello.c

tracer: tracer-$(ARCH).c libelf.c libelf.h
	$(CC) -static -o tracer tracer-$(ARCH).c libelf.c

clean:
	rm -f hello tracer

check: hello tracer
	time ./tracer ./hello