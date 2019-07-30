Just run `test.sh`.

The output should be:
```
$ ./test.sh 
compiling libfoo with foo=foo_v1
compiling main.c with foo=foo_v1
running with v1 lib
3
compiling libfoo with foo=foo_v2
running with v2 lib
3
compiling main.c with foo=foo_v2
running new version with v2 lib
-1
```

This demonstrates, that by using a macro in `foo_syms.h` to define the version of `foo`,
we can ensure that an application using `libfoo` will be compatible with future versions.

