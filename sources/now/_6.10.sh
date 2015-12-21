time (

mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(gcc -dumpmachine)/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld

gcc -dumpspecs | sed -e 's@/tools@@g' \
  -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
  -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > \
  `dirname $(gcc --print-libgcc-file-name)`/specs

echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'
echo 'OK
[Requesting program interpreter: /lib/ld-linux.so.2]
'

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
echo 'OK
/usr/lib/crt1.o succeeded
/usr/lib/crti.o succeeded
/usr/lib/crtn.o succeeded
'

grep -B1 '^ /usr/include' dummy.log
echo 'OK
#include <...> search starts here:
/usr/include
'

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
echo 'OK
SEARCH_DIR("/usr/lib")
SEARCH_DIR("/lib");
'

grep "/lib.*/libc.so.6 " dummy.log
echo 'OK
attempt to open /lib/libc.so.6 succeeded
'

grep found dummy.log
echo 'OK
found ld-linux.so.2 at /lib/ld-linux.so.2
'

rm -v dummy.c a.out dummy.log
) &> $0.log
xz -f $0.log
