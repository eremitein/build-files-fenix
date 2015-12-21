time (

mkdir -pv $LFS/tools
ln -sfv $LFS/tools /

#groupadd lfs
#useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs:build $LFS/tools
chown -R -v lfs:build /sources/now/ /sources/all/linux-3.14.20/

) &> $0.log
xz -f $0.log
