liba.a:
	rustc -C linker=cc --color=always -C debug-assertions=yes --crate-type staticlib -g -C relocation-model=pic --crate-name a --emit dep-info=a.d --emit link -o liba.a stuff.rs
liba.so:
	rustc -C linker=cc --color=always -C debug-assertions=yes --crate-type cdylib -g -C relocation-model=pic --crate-name a --emit dep-info=a.d --emit link -o liba.so stuff.rs

all: liba.a liba.so
	ccache cc  -I. -I.. -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -O0 -g -MD -MQ main.c.o -MF main.c.o.d -o main.c.o -c main.c
	cc  -o app main.c.o -Wl,--as-needed -Wl,--no-undefined '-Wl,-rpath,$ORIGIN/' -Wl,-rpath-link,/home/xclaesse/programmation/rustc-bug/builddir/ -Wl,--start-group liba.so -Wl,--end-group

clean:
	rm a.d app liba.a liba.so main.c.o main.c.o.d