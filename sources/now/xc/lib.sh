cd lib
for package in $(grep -v '^#' lib-7.7.md5 | awk '{print $2}'); do
  #case "$package" in
  #  libXfont-[0-9]* )
  #    ./configure $XORG_CONFIG --disable-devel-docs
  #  ;;
  #  libXt-[0-9]* )
  #    ./configure $XORG_CONFIG \
  #               --with-appdefaultdir=/etc/X11/app-defaults
  #  ;;
  #  * )
  #    ./configure $XORG_CONFIG
  #  ;;
  #esac
  #cp '../util-macros-1.17.1#b' "${package/.tar.bz2}#b"
  echo "pbs ${package/.tar.bz2}#b"
  pbs "${package/.tar.bz2}#b"
done
