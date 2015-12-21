time (

echo 'main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep ': /tools'

echo -e "\nIf everything is working correctly, there should be no errors, and the output of the last command will be of the form:
[Requesting program interpreter: /tools/lib/ld-linux.so.2]

Note that /tools/lib, or /tools/lib64 for 64-bit machines appears as the prefix of the dynamic linker
"

rm -v dummy.c a.out

) &> $0.log
xz -f $0.log
