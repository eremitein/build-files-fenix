cd proto
for package in $(grep -v '^#' proto-7.7.md5 | awk '{print $2}'); do
  pkg_out /var/pkg/in/${package/.tar.bz2}-*
done
