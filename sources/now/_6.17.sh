time (

echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'
echo 'OK
[Requesting program interpreter: /lib/ld-linux.so.2]
'

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
echo 'OK
/usr/lib/gcc/i686-pc-linux-gnu/4.8.3/../../../crt1.o succeeded
/usr/lib/gcc/i686-pc-linux-gnu/4.8.3/../../../crti.o succeeded
/usr/lib/gcc/i686-pc-linux-gnu/4.8.3/../../../crtn.o succeeded
'

grep -B4 '^ /usr/include' dummy.log
echo 'OK
#include <...> search starts here:
/usr/lib/gcc/i686-pc-linux-gnu/4.8.3/include
/usr/local/include
/usr/lib/gcc/i686-pc-linux-gnu/4.8.3/include-fixed
/usr/include
'

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
echo 'OK'
if [ $(uname -m) = "x86_64" ]; then
  echo 'SEARCH_DIR("/usr/x86_64-unknown-linux-gnu/lib64")
SEARCH_DIR("/usr/local/lib64")
SEARCH_DIR("/lib64")
SEARCH_DIR("/usr/lib64")
SEARCH_DIR("/usr/x86_64-unknown-linux-gnu/lib")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");
'
else
  echo ' SEARCH_DIR("/usr/i686-pc-linux-gnu/lib32")
SEARCH_DIR("/usr/local/lib32")
SEARCH_DIR("/lib32")
SEARCH_DIR("/usr/lib32")
SEARCH_DIR("/usr/i686-pc-linux-gnu/lib")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");
'
fi

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
