time (

#strip --strip-debug /tools/lib/*
#/usr/bin/strip --strip-unneeded /tools/{,s}bin/*

find /tools/ -iname \*.a | xargs strip --strip-debug
find /tools/ | xargs file | grep -e "executable" -e "shared object" | grep ELF \
  | cut -f 1 -d : | xargs /usr/bin/strip --strip-unneeded

rm -rf /tools/{,share}/{info,man,doc,locale}

) &> $0.log
xz -f $0.log
