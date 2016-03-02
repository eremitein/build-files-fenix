# Copyright 2009-2016 Victor Boyko, Tashkent, Uzbekistan <bvoid(at)yandex.ru>
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  THIS SOFTWARE FOR NON COMMERCIAL USING ONLY.

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
