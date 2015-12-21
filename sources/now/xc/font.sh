cd font
for package in $(grep -v '^#' font-7.7.md5 | awk '{print $2}'); do
  cp '../util-macros-1.17.1#b' "${package/.tar.bz2}#b"
  echo "pbs ${package/.tar.bz2}#b"
  pbs "${package/.tar.bz2}#b"
done
install -v -d -m755 /usr/share/fonts
ln -svfn $XORG_PREFIX/share/fonts/X11/OTF /usr/share/fonts/X11-OTF
ln -svfn $XORG_PREFIX/share/fonts/X11/TTF /usr/share/fonts/X11-TTF
