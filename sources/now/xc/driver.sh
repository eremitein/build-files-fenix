for package in xf86-* ; do
  cp 'util-macros-1.17.1#b' "${package/.tar.bz2}#b"
  #echo "pbs ${package/.tar.bz2}#b"
  #pbs "${package/.tar.bz2}#b"
done
