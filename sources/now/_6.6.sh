time (

ln -sfv /tools/bin/{bash,cat,echo,pwd,stty} /bin
ln -sfv /tools/bin/perl /usr/bin
ln -sfv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sfv /tools/lib/libstdc++.so{,.6} /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
ln -sfv bash /bin/sh

) &> $0.log
xz -f $0.log
