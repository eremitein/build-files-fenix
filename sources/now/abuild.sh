e='echo -e'
b=`basename $0`

fail() {
$e "*** arghhhh!!! $1 failed!.."
exit 1
}

stage0_1() {
target_list="
binutils-2.24#b0
gcc-4.8.3#b0
linux-3.14.20-headers#b0
glibc-2.19#b0
_5.7.sh
"
}

stage0_2() {
target_list="
libstdc++-4.8.3#b0
binutils-2.24#b1
gcc-4.8.3#b1
_5.10.sh
"
}

stage0_3() {
target_list="
tcl-8.6.2#b0
expect-5.45#b0
dejagnu-1.5.1#b0
check-0.9.14#b0
"
}

stage0_4() {
target_list="
ncurses-5.9#b0
bash-4.3.30#b0
bzip2-1.0.6#b0
coreutils-8.23#b0
diffutils-3.3#b0
file-5.22#b0
findutils-4.4.2#b0
gawk-4.1.1#b0
gettext-0.19.2#b0
grep-2.21#b0
gzip-1.6#b0
m4-1.4.17#b0
make-4.1#b0
patch-2.7.1#b0
perl-5.20.0#b0
sed-4.2.2#b0
tar-1.28#b0
texinfo-5.2#b0
util-linux-2.25.2#b0
xz-5.2.0#b0
less-458#b0
_5.35.sh
"
}

stage1_1() {
#_5.36_root.sh
#_6.2,5,6_root.sh (basefs)
target_list="
_6.6.sh
_6.3.sh
linux-3.14.20-headers#b
man-pages-3.75#b
glibc-2.19#b
tzdata-2014g#b
_6.10.sh
"
}

stage1_2() {
target_list="
zlib-1.2.8#b
file-5.22#b
binutils-2.24#b
gmp-5.1.3#b
mpfr-3.1.2#b
mpc-1.0.2#b
gcc-4.8.3#b
_6.17.sh
"
}

stage1_3() {
target_list="
bzip2-1.0.6#b
pkg-config-0.28#b
ncurses-5.9#b
attr-2.4.47#b
acl-2.2.52#b
libcap-2.24#b
sed-4.2.2#b
shadow-4.2.1#b
psmisc-22.21#b
procps-ng-3.3.10#b
e2fsprogs-1.42.12#b
strace-4.8#b
coreutils-8.23#b
iana-etc-2.30#b
m4-1.4.17#b
flex-2.5.39#b
bison-3.0.2#b
grep-2.21#b
readline-6.3#b
bash-4.3.30#b
bc-1.06.95#b
libtool-2.4.4#b
gdbm-1.11#b
expat-2.1.0#b
iptables-1.4.21#b
inetutils-1.9.2#b
perl-5.20.0#b
XML-Parser-2.42_01#b
"
}

stage1_4() {
target_list="
autoconf-2.69#b
automake-1.14.1#b
diffutils-3.3#b
gawk-4.1.1#b
findutils-4.4.2#b
gettext-0.19.2#b
intltool-0.50.2#b
gperf-3.0.4#b
groff-1.22.2#b
xz-5.2.0#b
grub-0.97#b
less-458#b
gzip-1.6#b
iproute2-3.17.0#b
kbd-2.0.2#b
kmod-18#b
libpipeline-1.4.0#b
make-4.1#b
patch-2.7.1#b
sysklogd-1.5.1#b
sysvinit-2.88dsf#b
tar-1.28#b
texinfo-5.2#b
eudev-2.1#b
util-linux-2.25.2#b
man-db-2.7.1#b
vim-7.4#b
which-2.20#b
libtirpc-0.2.5#b
lsof-4.88#b
"
}

stage1_5() {
target_list="
lfs-bootscripts-20141224.pkg.txz
lfs-sysconfig-0.15.023.pkg.txz
afterlfs-0.15.021.pkg.txz
zenit-0.15.053.pkg.txz
"
}

stage2_1() {
target_list="
terminus-font-4.38-cli#b
gpm-1.20.7#b
acpid-2.0.20#b
fbset-2.1#b
hdparm-9.45#b
"
}

stage2_2() {
target_list="
blfs-bootscripts-20140301#b
ppp-2.4.7#b
nasm-2.10.07#b
yasm-1.2.0#b
lzo-2.08#b
p7zip-9.20.1#b
pcre-8.35#b
libidn-1.28#b
lua-5.1.5#b
openssl-1.0.1i#b
openssh-6.6p1#b
wget-1.15#b
popt-1.16#b
rsync-3.0.9#b
curl-7.36.0#b
lynx-2.8.8#b
gc-7.2#b
elinks-0.12pre6#b
dnsmasq-2.66#b
mailx-12.4#b
ctorrent-dnh3.3.2#b
vifm-0.7.6#b
libevent-2.0.21-stable#b
tmux-1.9a#b
alsa-lib-1.0.27.2#b
alsa-plugins-1.0.27#b
alsa-utils-1.0.27.2#b
libmad-0.15.1b#b
libid3tag-0.15.1b#b
madplay-0.15.2b#b
mpg123-1.20.1#b
libogg-1.3.2#b
flac-1.3.0#b
libao-1.2.0#b
vorbis-tools-1.4.0#b
libcue-1.4.0#b
faad2-2.7#b
"
}

stage2_3() {
target_list="
sqlite-3.8.2#b
libffi-3.0.13#b
Python-2.7.7#b
git-1.8.5.5#b
cvs-1.11.23#b
glib-2.38.2#b
sdcv-0.4.2#b
stardict-comn_sdict05_eng_rus_full-2.4.2#b
stardict-comn_sdict05_rus_eng_full-2.4.2#b
"
}

stage2_4() {
target_list="
libpng-1.6.10#b
libjpeg-turbo-1.3.1#b
giflib-4.1.6#b
freetype-2.5.3#b
fontconfig-2.10.92#b
SDL-1.2.15#b
fbv-1.0b#b
"
}

stage_xorg() {
target_list="
util-macros-1.17.1#b
proto.sh
makedepend-1.0.5#b
libXau-1.0.8#b
libXdmcp-1.1.1#b
xcb-proto-1.11#b
libxcb-1.11#b
lib.sh
xcb-util-0.4.0#b
xcb-util-image-0.4.0#b
xcb-util-keysyms-0.4.0#b
xcb-util-renderutil-0.3.9#b
xcb-util-wm-0.4.1#b
libdrm-2.4.58#b
MesaLib-10.2.7#b
xbitmaps-1.1.1#b
app.sh
xcursor-themes-1.0.4#b
font.sh
xkeyboard-config-2.12#b
pixman-0.32.6#b
libepoxy-1.2#b
xorg-server-1.16.0#b
libevdev-1.2.2#b
xf86-input-evdev-2.9.0#b
xf86-input-synaptics-1.8.0#b
xf86-input-vmmouse-13.0.0#b
xf86-input-wacom-0.25.0#b
xf86-video-ati-7.4.0#b
xf86-video-cirrus-1.5.2#b
xf86-video-fbdev-0.4.4#b
xf86-video-intel-2.99.916#b
xf86-video-mach64-6.9.4#b
xf86-video-mga-1.6.3#b
xf86-video-nouveau-1.0.11#b
xf86-video-openchrome-0.3.3#b
xf86-video-r128-6.9.2#b
xf86-video-savage-2.3.7#b
xf86-video-sis-0.10.7#b
xf86-video-tdfx-1.4.5#b
xf86-video-vesa-2.3.3#b
xf86-video-vmware-13.0.2#b
libva-1.3.1#b
#libva-intel-driver-1.3.2
libvdpau-0.8#b
#libvdpau-va-gl-0.3.4
twm-1.0.8#b
xterm-312#b
xclock-1.0.7#b
xinit-1.3.4#b
dmenu-4.5#b
dwm-6.1-dark-pt#b
terminus-font-4.38#b
dejavu-fonts-ttf-2.34#b
opera-11.64-1403.i386.pkg.txz
opera-12.16-1806.i386.pkg.txz
libxml2-2.9.1#b 
conky-1.8.1#b
glu-9.0.0#b
freeglut-2.8.1#b
tiff-4.0.3#b
imlib2-1.4.6#b
feh-2.12#b
atk-2.12.0#b
cairo-1.12.16#b
gdk-pixbuf-2.30.8#b
poppler-0.26.4#b
harfbuzz-0.9.35#b
pango-1.36.8#b
gtk+-2.24.24#b
audacious-3.2.4#b
audacious-plugins-3.2.4#b
libcroco-0.6.8#b
librsvg-2.40.6#b
djvulibre-3.5.25.3#b
apvlv-0.1.4#b
fluxbox-1.3.6#b
slock-1.2#b
"
}

stage3_2() {
target_list="
blfs-bootscripts-20140301#b
ppp-2.4.7#b
nasm-2.10.07#b
yasm-1.2.0#b
lua-5.1.5#b
openssl-1.0.1i#b
openssh-6.6p1#b
lynx-2.8.8#b
gc-7.2#b
elinks-0.12pre6#b 
elinks-0.13#b
alsa-lib-1.0.27.2#b
alsa-plugins-1.0.27#b
alsa-utils-1.0.27.2#b
p7zip-9.20.1#b

libmad-0.15.1b#b
libid3tag-0.15.1b#b
madplay-0.15.2b#b

libpng-1.6.10#b
libjpeg-turbo-1.3.1#b
giflib-4.1.6#b
freetype-2.5.3#b
fontconfig-2.10.92#b

pcre-8.35#b
vifm-0.7.6#b
libevent-2.0.21-stable#b
tmux-1.9a#b
glib-2.38.2#b
screen-4.0.3

links-2.8

libarchive-3.1.2
cmake-2.8.12.2

dnsmasq-2.66#b
openvpn-2.3.3

libidn-1.28#b
wget-1.14#b
popt-1.16#b
rsync-3.0.9#b
curl-7.36.0#b

sqlite-3.8.2#b
libffi-3.0.13#b
Python-2.7.7#b
git-1.8.5.5#b
cvs-1.11.23#b
cvs-1.12.12
elfutils-0.160#b
llvm-3.5.0#b

mailx-12.4#b
mutt-1.5.22
alpine-2.00
re-alpine
snownews-1.5.12
mcabber-0.10.2_p20131025
irssi-0.8.15

SDL-1.2.15#b
MPlayer-1.1.1#b
fbv-1.0b#b
fbida-2.09

dgen-sdl-1.32#b
zsnes
fceu

sdcv-0.4.2#b
libatomic_ops-7.2d

libxml2-2.9.1#b 
conky-1.8.1#b

lzo-2.08#b
glu-9.0.0#b
freeglut-2.8.1#b
tiff-4.0.3#b
imlib2-1.4.6#b
feh-2.12#b
atk-2.12.0#b
cairo-1.12.16#b
gdk-pixbuf-2.30.8#b
poppler-0.26.4#b
harfbuzz-0.9.35#b
pango-1.36.8#b
gtk+-2.24.24#b

mpg123-1.20.1#b
libogg-1.3.2#b
flac-1.3.0#b
libao-1.2.0#b
vorbis-tools-1.4.0#b
libcue-1.4.0#b
faad2-2.7#b
audacious-3.2.4#b
audacious-plugins-3.2.4#b

nspr-4.10.7#b
nss-3.17.2#b
pciutils-3.2.0#b
libxslt-1.1.28#b
libtool-2.4.2#b
libcroco-0.6.8#b
librsvg-2.40.6#b
djvulibre-3.5.25.3#b
apvlv-0.1.4#b
vsftpd-3.0.2#b
fluxbox-1.3.6#b
slock-1.2#b

wireless-tools-29#b
libnl-3.2.25#b
wpa_supplicant-2.3#b
nmap-5.51#b
gens-2.15.5#b
snes9x-1.53#b
vbam-1.8.0.1009#b
scons-2.3.0#b
fceux-2.2.1#b
gngeo-0.8#b

rtf2html-0.2.0
docx2txt-1.4
antiword-0.37
antixls-0.3b
chmlib-0.40

postgresql-9.1.14
mariadb-10.0.15
mysql-5.6.22


"
}

if [ ! "$1" ]; then
  $e "Usage: $b {stage0_[1-4] stage1_[1-5] stage2_[1-4]}"
  exit
else
  case "$1" in
    stage0_[1-5]) "$1" ||fail "case $1" ;;
    stage1_[1-5]) "$1" ||fail "case $1" ;;
    stage2_[1-5]) "$1" ||fail "case $1" ;;
    *) fail "matching stage level" ;;
  esac
fi

for file in $target_list; do
  case $file in
	  "#"*) $e "skip $file" ;;
	  *'#b'*) $e pbs $file ; pbs $file ||fail $file ;;
		*.sh) $e sh $file ; sh $file ||fail $file ;;
		*.pkg.txz) $e pkg_in $file ; pkg_in $file ||fail $file ;;
	esac
done
