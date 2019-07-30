#!/bin/bash

cat <<EOF > foo_syms.h
#ifndef FOO_H
#error Must be used inside foo.h
#endif

#ifndef FOO_SYMS_H
#define FOO_SYMS_H

#define foo foo_v1

#endif
EOF

echo "compiling libfoo with foo=foo_v1"
gcc -shared -o libfoo.so foo.c

echo "compiling main.c with foo=foo_v1"
gcc main.c -lfoo -L. -Wl,-rpath=.

echo "running with v1 lib"
./a.out

cat <<EOF > foo_syms.h
#ifndef FOO_H
#error Must be used inside foo.h
#endif

#ifndef FOO_SYMS_H
#define FOO_SYMS_H

#define foo foo_v2

#endif
EOF

echo "compiling libfoo with foo=foo_v2"
gcc -shared -o libfoo.so foo.c

echo "running with v2 lib"
./a.out

echo "compiling main.c with foo=foo_v2"
gcc main.c -lfoo -L. -Wl,-rpath=.

echo "running new version with v2 lib"
./a.out
