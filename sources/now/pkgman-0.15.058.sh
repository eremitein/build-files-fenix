time (

tar xf ${0/.sh}*.pkg.* -C / ||exit
pkg_in ${0/.sh}*.pkg.*

) &> $0.log
xz -f $0.log
