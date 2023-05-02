## Test case to reproduce rust

`while make all && make clean; do :; done` randomly fail to link with different possible errors.
Can take a while to reproduce.

Examples of errors:
```
/usr/bin/ld: liba.so: undefined reference to `__rust_alloc'
/usr/bin/ld: liba.so: undefined reference to `__rust_dealloc'
/usr/bin/ld: liba.so: undefined reference to `__rust_alloc_zeroed'
/usr/bin/ld: liba.so: undefined reference to `__rust_alloc_error_handler'
/usr/bin/ld: liba.so: undefined reference to `__rust_realloc'
```

or:
```
/home/xclaesse/programmation/rustc-bug/main.c:5: undefined reference to `f'
```

or:
```
error: linking with `cc` failed: exit status: 1
  |
  = note: LC_ALL="C" PATH="/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/bin:/home/xclaesse/.cargo/bin:/home/xclaesse/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/xclaesse/.local/bin" VSLANG="1033" "cc" "-Wl,--version-script=/tmp/rustclolxj9/list" "-m64" "/tmp/rustclolxj9/symbols.o" "liba.a.9d3a5b04-cgu.0.rcgu.o" "liba.a.9d3a5b04-cgu.1.rcgu.o" "liba.5526o9o66d8jdg4s.rcgu.o" "-Wl,--as-needed" "-L" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-Wl,-Bstatic" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libstd-89bc084783fdc439.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libpanic_unwind-8bee4b287d4367c1.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libobject-d61707aed80694c0.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libmemchr-d85366256f22345b.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libaddr2line-96069b86b8a8cae9.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libgimli-d19d53abf68dfa6c.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/librustc_demangle-787cbccd19d64ac6.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libstd_detect-b3837a36b830e0d0.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libhashbrown-e3deb0e7e3f04966.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libminiz_oxide-dabbb79c9815def4.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libadler-305b01f34c9409f2.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_alloc-f833521df6074e73.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libunwind-9ac333113350d171.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcfg_if-1c126114322d0eee.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/liblibc-bad9164fdeeecf92.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/liballoc-f9374b1e480fa681.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_core-207f06e41d9603af.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-7e2768e66e984e85.rlib" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcompiler_builtins-957b4aff41f8cd46.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/home/xclaesse/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "liba.so" "-Wl,--gc-sections" "-shared" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
  = note: /usr/bin/ld: liba.a.9d3a5b04-cgu.0.rcgu.o: in function `f':
          /home/xclaesse/programmation/rustc-bug/stuff.rs:3: undefined reference to `core::fmt::Arguments::new_v1'
          /usr/bin/ld: liba.so: hidden symbol `_ZN4core3fmt9Arguments6new_v117had7168374c70d064E' isn't defined
          /usr/bin/ld: final link failed: bad value
          collect2: error: ld returned 1 exit status
          
  = note: some `extern` functions couldn't be found; some native libraries may need to be installed or have their path specified
  = note: use the `-l` flag to specify native libraries to link
  = note: use the `cargo:rustc-link-lib` directive to specify the native libraries to link with Cargo (see https://doc.rust-lang.org/cargo/reference/build-scripts.html#cargorustc-link-libkindname)
```