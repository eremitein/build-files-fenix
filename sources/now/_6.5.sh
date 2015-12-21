time (

mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib,opt}
mkdir -pv /{media/{floppy,cdrom},sbin,srv,var}
ln -sfv media /mnt
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
ln -sfv share/{man,doc,info} /usr/
mkdir -v /usr/{,local/}share/{games,misc,terminfo,zoneinfo}
mkdir -v /usr/libexec
mkdir -pv /usr/{,local/}share/man/man{1..8}

case $(uname -m) in
  x86_64)
    ln -sfv lib /lib64
    ln -sfv lib /usr/lib64
    ln -sfv lib /usr/local/lib64 ;;
esac

mkdir -v /var/{log,mail,spool}
ln -sfv /tmp /var/tmp
ln -sfv /ram /var/ram
ln -sfv /run /var/run
ln -sfv /run/lock /var/lock
mkdir -pv /var/{opt,cache,lib/{color,misc,locate},local}

) &> $0.log
xz -f $0.log
