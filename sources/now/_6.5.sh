# Copyright 2009-2016 Victor Boyko, Tashkent, Uzbekistan <bvoid(at)yandex.ru>
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  THIS SOFTWARE FOR NON COMMERCIAL USING ONLY.

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
