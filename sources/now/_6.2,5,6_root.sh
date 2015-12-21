time (

# run instead 6.2 + 6.5 + partial of 6.6 steps!!!

mkdir -pv $LFS/var/pkg/in/
tar xvf basefs-0.15.024.pkg.txz -C $LFS  > $LFS/var/pkg/in/basefs-0.15.024

) &> $0.log
xz -f $0.log
