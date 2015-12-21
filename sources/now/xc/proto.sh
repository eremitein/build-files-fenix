cd proto
for package in $(grep -v '^#' proto-7.7.md5 | awk '{print $2}'); do
  cp '../util-macros-1.17.1#b' "${package/.tar.bz2}#b"
  echo "pbs ${package/.tar.bz2}#b"
  pbs "${package/.tar.bz2}#b"
done
