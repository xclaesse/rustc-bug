liba.a:
	rustc -C linker=cc --crate-type staticlib --crate-name a --emit link -o liba.a stuff.rs
liba.so:
	rustc -C linker=cc --crate-type cdylib --crate-name a --emit link -o liba.so stuff.rs

all: liba.a liba.so

clean:
	rm liba.a liba.so